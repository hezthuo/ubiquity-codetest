class AddCsvUrlToCsv < ActiveRecord::Migration[7.0]
  def change
    add_column :csvs, :csv_url, :string
  end
end
