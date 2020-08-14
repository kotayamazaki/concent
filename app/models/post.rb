class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comment

  acts_as_taggable  #追加(acts-as-taggable-onの別名)

  validates :tag_list, presence: true
end
