class AddProfilePictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture, :attachment
    has_attached_file :profile_picture, styles: { small: "64x64", med: "100x100", large: "200x200" }
    # add_attachment :users, :profile_picture
  end
end
