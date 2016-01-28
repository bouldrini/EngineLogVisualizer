class PagesController < ApplicationController
	def home
		@csv_file = CsvFile.new
		@files = CsvFile.all
	end
end