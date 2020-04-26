class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessor :cover

  after_save :save_cover_image, if: :cover

  def save_cover_image
    @filename = cover.original_filename
    folder = "public/books/#{id}/cover"

    FileUtils::mkdir_p folder

    f = File.open File.join(folder, @filename), "wb"
    f.write cover.read()
    f.close

    self.cover = nil
    update cover_filename: @filename
  end
end
