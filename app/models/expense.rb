class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_expenses, dependent: :destroy
  has_many :categories, through: :categories_expenses

  accepts_nested_attributes_for :categories_expenses

  validates :name, presence: true
  validates :author_id, presence: true
  validates :amount, presence: true, numericality: true
end
