class Lesson < ApplicationRecord
	belongs_to :subject

	default_scope { order(created_at: :desc)}
	validates :name, presence: true
	validates :start_time, presence: true
end
