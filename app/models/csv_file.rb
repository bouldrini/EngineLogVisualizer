class CsvFile < ActiveRecord::Base
	mount_uploader :file, EngineLogUploader

	validates :title, presence: true 
	validates :file, presence: true 

	has_many :readable_values, dependent: :destroy
	accepts_nested_attributes_for :readable_values

	def to_a()
		values = {}
		readable_values.each do |value|
			values[value.title] = []
		end
		i = 0
		File.open(file.path).each do |row|
			if i != 0
				if((i % 10) == 0)
					row = row.split("\t")
					row[0] = row[0].split(" ")[1]
					readable_values.each do |value|
						values[value.title] << row[value.index]
					end
				end
			end
			i = i + 1
		end
		return values
	end

	def set_readable_values()
		i = 0
		File.open(file.path).each do |row|
			if i == 0
				row = row.split("\t")
				row.each_with_index do |title, index|
					unless index == 0
						value = ReadableValue.new()
						value.title = title
						value.csv_file = self
						value.unit = ""
						value.index = index
						value.save!
					end
				end
			end
			i = i + 1
		end
	end

	def has_readable_value(title)
		readable_values.each do |value|
			if value.title == title
				return true
			end
		end
		return false
	end
end