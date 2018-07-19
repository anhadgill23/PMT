class Task < ApplicationRecord
  belongs_to :projects, required: false
  has_and_belongs_to_many :users, required: false
end
