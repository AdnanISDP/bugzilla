class ProjectsController < ApplicationController

  def index
   @project= current_user.projects
  end
  def show
     @project = Project.find(params[:id])
  end
  def new
    @project=Project.new
    @project.project_users.build
    @users = User.all
    @users= User.where. not(user_type: 'manager')
  end
  def create  
    @project=Project.new(project_params)
    authorize @project
    if @project.save!
      @user = ProjectUser.new(project_id: @project.id, user_id: current_user.id)
      @user.save
      redirect_to projects_path
    else
      redirect to new_project_path
    end
  end

  def edit
     @project = Project.find(params[:id])
     @users= User.all
  end   

  def update
     @project = Project.find(params[:id])
     if @project.update_attributes(project_params)
      redirect_to projects_path
      else
        redirect_to edit_project_path
      end
  end
  def destroy
    @userproject = ProjectUser.where(project_id: params[:id]).destroy_all
     @project = Project.find(params[:id])
    if @project.delete
      redirect_to projects_path
      end
  end
  private
  def project_params
     params.require(:project).permit(:id,:name, project_users_attributes:[:id ,:user_id])
  end
end