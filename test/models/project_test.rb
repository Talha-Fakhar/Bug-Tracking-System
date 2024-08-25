require "test_helper"

class ProjectTest < ActiveSupport::TestCase

    def setup
        @project = Project.new(name: "test project", description: "this is test project")
    end

    test "Project should be valid" do
        assert @project.valid?
    end

    test "name should be present" do
        @project.name = " "
        assert_not @project.valid?
    end

    test "descrption should be present" do
        @project.description = " "
        assert_not @project.valid?
    end

    test "description shouldn't be less than 5 characters" do
        @project.description = "a" * 3
        assert_not @project.valid?
    end

    test "description shouldn't be more than 500 characters" do
        @project.description = "a" * 501
        assert_not @project.valid?
    end
end
