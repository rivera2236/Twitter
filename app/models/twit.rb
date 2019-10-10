class Twit < ApplicationRecord
	belongs_to :user

	validates :message, presence: true
	validates :message, length: {maximum: 140, too_long: "A tweet nust be less than 140 characters"}
	
end
