class User < ApplicationRecord
	has_many :project_users
	has_many :projects, through: :project_users
	

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         User_var=  ['developer','manager','qa']
end
