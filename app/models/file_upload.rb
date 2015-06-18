class FileUpload
  include ActiveModel::Model

  attr_accessor :file, :content_type

  validates :file, presence: true
  validates :content_type, inclusion: { in: %w(text/plain),
    message: "Only txt files are allowed" }, if: :file_present?

  def file_present?
    file.present?
  end
end
