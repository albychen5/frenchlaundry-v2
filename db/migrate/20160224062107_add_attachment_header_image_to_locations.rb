class AddAttachmentHeaderImageToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.attachment :header_image
    end
  end

  def self.down
    remove_attachment :locations, :header_image
  end
end
