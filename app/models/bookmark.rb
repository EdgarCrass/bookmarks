class Bookmark < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :name, presence: true
end
