class Task < ApplicationRecord
    has_many :task_members
    belongs_to :project
end
