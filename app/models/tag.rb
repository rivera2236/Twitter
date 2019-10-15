class Tag < ApplicationRecord
	has_many :twit_tags
	has_many :twits, through: :twit_tags
end
