class Comment < ApplicationRecord
  belongs_to :matrimony
  belongs_to :user
end
