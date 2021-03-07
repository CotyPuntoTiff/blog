class Post < ApplicationRecord
    validates :title, :content, :img_url, presence: true
end
