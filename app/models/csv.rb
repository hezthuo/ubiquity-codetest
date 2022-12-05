class Csv < ApplicationRecord
	has_one_attached :file
	belongs_to :user
	

	before_save do
    if self.file.attached?
        ext = '.' + self.file.blob.filename.extension
        self.file.blob.update(filename: SecureRandom.uuid + ext)
    end
  end

end
