class Room < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    def self.search(keyword)
        where(["room_name like? OR address like?","%#{keyword}%","%#{keyword}%"])
    end

end
