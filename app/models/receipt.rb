class Receipt < ApplicationRecord
  belongs_to :shafu
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :course
  belongs_to :adult
  belongs_to :child

  integer = /\A[1-9][0-9]+\z/
  validates :fee, format: {with: integer, message: 'permit only half-width numbers'}
  with_options numericality: {other_than: 1} do
    validates :course_id
  end
  with_options presence: true do
    validates :customer_name
    validates :fee
    validates :departure_from
    validates :arrive_at
    validates :departure_time
    validates :arrival_time
  end
end
