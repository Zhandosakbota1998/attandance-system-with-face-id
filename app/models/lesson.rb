class Lesson < ApplicationRecord
	belongs_to :subject
	has_many :students

	default_scope { order(created_at: :desc)}
	validates :name, presence: true
	validates :start_time, presence: true
end
