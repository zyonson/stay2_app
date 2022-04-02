class Room < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    def self.search(keyword)
        where(["room_name like? OR room_description like?","%#{keyword}%","%#{keyword}%"])
    end

end
