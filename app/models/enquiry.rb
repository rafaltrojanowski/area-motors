class Enquiry < ApplicationRecord
  has_one_attached :file

  def file_path
    ActiveStorage::Blob.service.send(:path_for, file.blob.key)
  end

  def self.create_from!(path)
    website = if path.include?('amdirect')
      'amdirect'
    elsif path.include?('carsforsale')
      'carsforsale'
    end

    filename = path.split('/').last

    record = self.create!(website: website)
    record.file.attach(
      io: File.open(path),
      filename: filename
    )
    record
  end
end
