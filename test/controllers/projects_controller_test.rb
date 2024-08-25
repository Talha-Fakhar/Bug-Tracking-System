require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { description: @project.description, name: @project.name, user_id: @project.user_id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should not create project with duplicate name" do
    duplicate_project = @project.dup
    duplicate_project.name = @project.name 

    assert_no_difference('Project.count') do
      post projects_url, params: { project: { description: duplicate_project.description, name: duplicate_project.name, user_id: duplicate_project.user_id } }
    end

    assert_flash_alert 'Project with this name already exists. Please choose a different name.'
    assert_response :unprocessable_entity
  end

  test "should not create project with empty name" do
    assert_no_difference('Project.count') do
      post projects_url, params: { project: { description: @project.description, name: '', user_id: @project.user_id } }
    end

    assert_flash_alert "Name can't be blank"
    assert_response :unprocessable_entity
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { description: @project.description, name: @project.name, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end

  private

  def assert_flash_alert(message)
    assert_equal message, flash[:alert] || flash[:danger]
  end
end
