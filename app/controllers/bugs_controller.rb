class BugsController < ApplicationController
	def index
    @bug = Bug.all
  end
  def new
        @bug=Bug.new
  end
  
  def create
     @bug=Bug.new(bug_params)
     @bug.creator_id = current_user.id
    if @bug.save!
      redirect_to bugs_path
    else
      redirect_to new_bug
    end
  end
  def edit
     @bug = Bug.find(params[:id])
  end
  def update
     @bug = Bug.find(params[:id])
     if @bug.update_attributes(bug_params)
    
      redirect_to bugs_path
      else
       render 'edit'
      end
  end
  def destroy
     @bug = Bug.find(params[:id])
    if @bug.delete
      redirect_to bugs_path
      end
  end

  def assign
    @bug = Bug.find(params[:id])
    puts @bug.inspect
    puts current_user.inspect
    @bug.update!(developer_id: current_user.id,status:  'started')
    puts @bug.inspect 
    render json: { success: "successful"}
  end

  def assigned
    @bug = Bug.find(params[:id])
    @bug.update!(status: 'complated')
    redirect_to bugs_path
  end
  
  def bug_params   
    params.require(:bug).permit(:title, :deadline, :screenshot, :types, :status, :user_id, :creator_id, :developer_id, :project_id)
  end


end
