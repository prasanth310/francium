class Matrimony < ApplicationRecord
    mount_uploader :thumb_image, MatrimonyUploader
    mount_uploader :main_image, MatrimonyUploader

    has_many :comments
    
    def set_defaults
        self.main_image ||= placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= placeholder.image_generator(height: '350', width: '200')
    end
end
