class Csv < ApplicationRecord
	has_one_attached :file
	belongs_to :user

	after_save :set_csv_name
	

	before_save do
    if self.file.attached?
        ext = '.' + self.file.blob.filename.extension
        self.file.blob.update(filename: SecureRandom.uuid + ext)
    end
  end

  private

  def set_csv_name
  	puts 'SELF:'
  	puts self.inspect
  	# self.csvs.last.name = self.file.blob.filename
	end

end
