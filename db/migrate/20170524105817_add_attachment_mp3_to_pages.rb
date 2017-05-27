class AddAttachmentMp3ToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :pages, :mp3
  end
end
