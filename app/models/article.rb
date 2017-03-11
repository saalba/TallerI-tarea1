class Article < ApplicationRecord
  has_many :comentaries

  validates :title, length: {minimum: 10}, presence: true
  validates :subtitle, length: {minimum: 0, maximum: 250}, presence: true
  validates :body, length: {minimum: 50}, presence: true

end
