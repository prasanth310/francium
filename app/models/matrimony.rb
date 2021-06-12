class Matrimony < ApplicationRecord
    mount_uploader :thumb_image, MatrimonyUploader
    mount_uploader :main_image, MatrimonyUploader
    validates :name, :age, :spa, :thumb_image, :main_image, :presence => true
    belongs_to :user
    has_many :comments
    
end
