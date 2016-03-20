class ReadableValue < ActiveRecord::Base
	validates :title, presence: true
	validates :index, presence: true

	belongs_to :csv_file

	def to_a()
		
	end
end