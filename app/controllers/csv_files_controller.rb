class CsvFilesController < ApplicationController
	def create
		file = CsvFile.new(csv_file_params)
		file.file = params[:csv_file][:file]
		file.save
		redirect_to root_path
	end

	def show
		@file = CsvFile.find(params[:id])
	end

	def get_values
		series = []
		file_values = CsvFile.find(params[:id]).to_a
		params[:type].each do |type|
			if type == "air_temp"
				series << {
					name: 'Ansauglufttemperatur (°C)',
					data: file_values[:air_temp].map(&:to_f),
					unit: "°C"
				}
			elsif type == "oil_temp"
				series <<{
					name: 'Öltemperatur (°C)',
					data: file_values[:oil_temp].map(&:to_f),
					unit: "°C"
				}
			elsif type == "drossel"
				series << {
					name: 'Drosselklappe (°)',
					data: file_values[:drossel].map(&:to_f),
					unit: "°"
				}
			elsif type == "pedal"
				series << {
					name: 'Pedalwert (°)',
					data: file_values[:pedal].map(&:to_f),
					unit: "°"
				}
			elsif type == "air"
				series << {
					name: 'Luftmassenmesser - Luftmasse (l/min)',
					data: file_values[:air].map(&:to_f),
					unit: "l"
				}
			elsif type == "engine_temp"
				series << {
					name: 'Motortemperatur (°C)',
					data: file_values[:engine_temp].map(&:to_f),
					unit: "°C"
				}
			end
		end
		json_response = {success: true, series: series, times: file_values[:time]}
		render json: json_response
	end

	private
	def csv_file_params
		params.require(:csv_file).permit(:file, :title, :log_start_at, :log_end_at)
    end
end