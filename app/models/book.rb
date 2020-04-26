class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :cover, CoverUploader
end
