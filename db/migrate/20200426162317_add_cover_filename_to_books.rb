class AddCoverFilenameToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :cover_filename, :string
  end
end
