class Page < ApplicationRecord
  belongs_to :book

  has_attached_file :thumbnail, styles: { large: "1000*1000>", medium: "500*500>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }

end
