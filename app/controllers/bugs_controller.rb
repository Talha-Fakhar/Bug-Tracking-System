class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_bug, only: [:show, :edit, :update, :destroy, :assign]

  def index
    @bugs = @project.bugs.all
  end

  def new
    @bug = @project.bugs.build
  end

  def create
    @bug = @project.bugs.build(bug_params)
    @bug.qa_id = current_user.id  
    if @bug.save
      flash[:success] = "Bug was successfully created."
      redirect_to @bug.project
    else
      flash.now[:danger] = 'Please fix the errors below.'
      render 'new'
    end
  end

  def show
  end

  def assign
    if @bug.update(user: current_user)
      flash[:success] = "Bug assigned to you successfully."
    else
      flash[:danger] = "Failed to assign bug."
    end
    redirect_to project_bug_path(@bug.project, @bug)
  end

  def destroy
    if @bug.destroy
      flash[:success] = "Bug was successfully deleted."
      redirect_to @project
    else
      flash[:error] = "Failed to delete the bug."
      redirect_to @project
    end
  end

  def update
    if @bug.update(bug_params)
      flash[:success] = "Bug updated successfully"
      redirect_to(@bug.project)
    else
      flash.now[:danger] = "Failed to delete the bug."
      render 'edit'
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_bug
    @bug = @project.bugs.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :status, :bug_type, :deadline, :project_id, :screenshot, :user_id)
  end
end
