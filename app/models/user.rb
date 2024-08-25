class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :user_type, presence: true
  USERTYPE_ = [['Manager', 'manager'],
               ['Developer', 'developer'],
               ['QA', 'qa']]

  has_and_belongs_to_many :projects
  has_many :bugs
end
