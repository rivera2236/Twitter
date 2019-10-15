class Twit < ApplicationRecord
	belongs_to :user

	validates :message, presence: true
	validates :message, length: {maximum: 140, too_long: "A tweet nust be less than 140 characters"}, on: :create
	
	has_many :twit_tags
	has_many :tags, through: :twit_tags

	before_validation :link_check, on: :create
	after_validation :apply_link, on: :create

	def link_check
		arr = self.message.split()
		index = arr.map{|x| x.include?('http://') || x.include?('https://')}.index(true)

		if index != nil
			self.link = arr[index]
			if arr[index].length > 23
				arr[index] = "#{arr[index][0..20]}..."
				self.message = arr.join('')
			end
		end
	end

	def apply_link
		arr = self.message.split
		index = arr.map{|x| x.include?('http://') || x.include?('https://')}.index(true)		

		if index != nil
			url = arr[index]
			arr[index] = "<a href='#{self.link}' target='_blank'>#{url}</a>"
			self.message = arr.join(' ')
		end
	end
end
