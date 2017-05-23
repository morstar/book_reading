class AddAttachmentThumbnailToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :pages, :thumbnail
  end
end
