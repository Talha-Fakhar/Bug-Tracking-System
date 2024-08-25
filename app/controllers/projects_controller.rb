class ProjectsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
    @bug = @project.bugs.build
  end

  def edit
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      current_user.projects << @project unless current_user.projects.include?(@project)
      flash[:success] = "Project created successfully."
      redirect_to @project
    else
      flash.now[:error] = @project.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @project.update(project_params)
      user_ids = projects_user_params[:user_id].map(&:to_i)
      @project.users = User.where(id: user_ids)
      flash[:success] = "Project was successfully updated."
      redirect_to @project
    else
      flash.now[:danger] = "Error updating project. Please try again."
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:danger] = "Project deleted successfully"
    redirect_to @project
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end

    def projects_user_params
      params.require(:projects_users).permit(user_id: [])
    end
end
