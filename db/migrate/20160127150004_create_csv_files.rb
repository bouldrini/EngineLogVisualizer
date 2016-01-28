class CreateCsvFiles < ActiveRecord::Migration
  def change
    create_table :csv_files do |t|
    	t.string :title
    	t.datetime :log_start_at
    	t.datetime :log_end_at
    	t.string :file
    	t.timestamp
    end
  end
end
