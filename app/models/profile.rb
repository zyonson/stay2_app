class Profile < ApplicationRecord
    belongs_to :user
    has_many :rooms
    mount_uploader :avatar, ImageUploader
end
