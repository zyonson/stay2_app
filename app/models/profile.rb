class Profile < ApplicationRecord
    belongs_to :user
    has_many :rooms
    has_many :reservations
    mount_uploader :avatar, ImageUploader
end
