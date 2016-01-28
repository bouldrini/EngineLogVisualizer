class CsvFile < ActiveRecord::Base
	mount_uploader :file, EngineLogUploader

	validates :title, presence: true 
	validates :file, presence: true 

	def to_a()
		values = {
			time: [],
			air_temp: [],
			oil_temp: [],
			drossel: [],
			pedal: [],
			air: [],
			engine_temp: [],
		}

		i = 0
		File.open(file.path).each do |row|
			if i != 0
				if((i % 10) == 0)
					row = row.split("\t")
					values[:time] << row[0].split(" ")[1]
					values[:air_temp] << row[1]
					values[:oil_temp] << row[2]
					values[:drossel] << row[3]
					values[:pedal] << row[4]
					values[:air] << row[5]
					values[:engine_temp] << row[6].split("\n").first
				end
			end
			i = i + 1
		end
		return values
	end
end