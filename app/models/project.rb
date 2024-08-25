class Project < ApplicationRecord
    has_many :bugs, dependent: :delete_all
    has_and_belongs_to_many :users
  
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true,length: { minimum: 5, maximum: 500 }
  end
  