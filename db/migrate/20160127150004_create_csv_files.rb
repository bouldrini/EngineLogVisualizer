class CreateCsvFiles < ActiveRecord::Migration
  def change
    create_table :csv_files do |t|
    	t.string :title
    	t.string :file
    	t.timestamp
    end
  end
end
