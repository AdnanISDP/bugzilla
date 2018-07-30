class ProjectPolicy < ApplicationPolicy
 
  def index?
    user.present?
  end

  def create?
    user.present? && user.user_type == "manager"
  end
  def update?
    user.present? && user.user_type == "manager"
  end
  def edit?
    user.present? && user.user_type == "manager"
  end
  def destroy?
    user.present? && user.user_type == "manager"
  end
  
end
