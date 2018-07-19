class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :teams


  def manager?
    role === 3 || role === 2
  end

  def admin?
    role === 3
  end
end
