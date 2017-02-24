class Photo < ActiveRecord::Base

  belongs_to :user

  DEFAULT_SIZE = :size_100x100

  has_attached_file :image, styles: { size_100x100: '100x100!', size_250x250: '250x250!' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :one_liner, presence: true
  validates :description, presence: true
  validates :image, presence: true

end
