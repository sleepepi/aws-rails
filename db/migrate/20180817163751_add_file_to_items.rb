class AddFileToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :file, :string
    add_column :items, :file_created_at, :datetime
    add_column :items, :file_byte_size, :bigint, null: false, default: 0
  end
end
