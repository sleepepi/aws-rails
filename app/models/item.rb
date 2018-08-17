class Item < ApplicationRecord
  # Uploaders
  mount_uploader :file, GenericUploader

  has_one_attached :photo
end
