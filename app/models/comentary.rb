class Comentary < ApplicationRecord
  belongs_to :article

  validates :user, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 2}, presence: true
end
