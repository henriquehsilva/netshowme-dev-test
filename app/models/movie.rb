class Movie < ApplicationRecord
  belongs_to :user

  validates :name, :url, :poster, presence: true
end
