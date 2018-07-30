class Project < ApplicationRecord
	has_many :project_users
	has_many :users, through: :project_users
	has_many :bugs
	accepts_nested_attributes_for :project_users,  reject_if: proc { |pu| pu['user_id'].blank? }

 #    #callback
	# after_create :project_after_create
	# before_create :project_before_create
	# around_create :project_around_destroy
	# after_destroy :project_after_destroy
	# #It is considered good practice to declare callback methods as private
	# private       
	# 	def project_after_create
	# 		puts "created successfuly"
	# 	end
	# 	def project_before_create
	# 		puts " creating"
	# 	end
	# 	def project_around_create
	# 		puts "around cheking"
	# 	end
	# 	def project_after_destroy
	# 		puts "deleted successfuly"
	# 	end
	# end	
end
