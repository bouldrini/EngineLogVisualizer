class CsvFilesController < ApplicationController
	def create
		file = CsvFile.new(csv_file_params)
		file.file = params[:csv_file][:file]
		file.save
		if params[:csv_file][:readable_values_attributes].present?
			params[:csv_file][:readable_values_attributes].each do |id, obj|
				value = ReadableValue.new()
				value.title = obj[:title]
				value.csv_file = file
				value.unit = obj[:unit]
				value.index = obj[:index]
				value.save
			end
		end
		redirect_to root_path
	end

	def show
		@file = CsvFile.find(params[:id])
	end

	def get_values
		series = []
		file = CsvFile.find(params[:id])
		file_values = file.to_a
		file.readable_values.each do |value|
			series << {
				name: value.title,
				data: file_values[value.title].map(&:to_f),
				unit: value.unit
			}
		end
		json_response = {success: true, series: series, times: file_values[:time]}
		render json: json_response
	end

	def destroy
		file = CsvFile.find(params[:id])
		file.destroy
		redirect_to root_path
	end

	def update
		file = CsvFile.find(params[:id])
		file.title = params[:csv_file][:title]
		file.save
		file.readable_values.each do |value|
			value.destroy
		end
		params[:csv_file][:readable_values_attributes].each do |key, value|
			unless value[:_destroy] == "1"
				new_value = ReadableValue.new()
				new_value.title = value[:title]
				new_value.unit = value[:unit]
				new_value.index = value[:index]
				new_value.csv_file = file
				new_value.save
			end
		end
		redirect_to root_path
	end

	def clone
		file = CsvFile.find(params[:id])
		clone = CsvFile.new()
		clone.title = file.title
		clone.file = file.file
		clone.save
		redirect_to root_path
	end

	private
	def csv_file_params
		params.require(:csv_file).permit(:file, :title, :log_start_at, :log_end_at)
    end
end