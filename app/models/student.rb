class Student < ApplicationRecord
	belongs_to :group
	has_many_attached :images
	has_and_belongs_to_many :lessons
end
