class Subject < ApplicationRecord
	belongs_to :group
	belongs_to :user
	has_many :lessons
end
