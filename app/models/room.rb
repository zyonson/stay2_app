class Room < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    def self.search(keyword)
        where(["room_name like? OR address like?","%#{keyword}%","%#{keyword}%"])
    end

    with_options presence: true do
        validates :room_name
        validates :room_description
        validates :price
        validates :address
        validates :image
    end

end
