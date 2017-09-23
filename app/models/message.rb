class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :text_or_image, presence: true

  private
    def text_or_image
    	text.presence || image.presence
    end
end
