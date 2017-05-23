class Page < ApplicationRecord
  belongs_to :book

  has_attached_file :thumbnail, styles: { large: "1000*1000>", medium: "500*500>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

end
