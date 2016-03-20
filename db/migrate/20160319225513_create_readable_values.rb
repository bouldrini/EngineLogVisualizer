class CreateReadableValues < ActiveRecord::Migration
  def change
    create_table :readable_values do |t|
    	t.string :title
    	t.string :unit
    	t.integer :index
    	t.references :csv_file
    end
  end
end
