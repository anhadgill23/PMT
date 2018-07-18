class Task < ApplicationRecord
  belongs_to :projects
  has_and_belongs_to_many :users
end
