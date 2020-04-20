class Lesson < ApplicationRecord
	belongs_to :subject
	has_and_belongs_to_many :students

	default_scope { order(created_at: :desc)}
	validates :name, presence: true
	validates :start_time, presence: true
end
