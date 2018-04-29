class Admin::HomeController < ApplicationController
  before_action :find_project, except: [:dashboard, :index, :create_project]
  before_action :find_to_do_list, only: [:assign_developer, :add_developer]

  def dashboard
    @to_do_lists = ToDoList.all.group_by(&:status)
  end

  def index
    @projects = Project.all
  end

  def create_project
    Project.create(name: params[:name])
  end

  def todo_lists
    @todo_lists = @project.to_do_lists
  end

  def add_todo
  end

  def create_todo
    @todo_list = @project.to_do_lists.build(todo_params)
    @todo_list.save
  end

  def assign_developer
    @developers = User.without_role(:admin)
  end

  def add_developer
    @to_do_list.update(user_id: params[:user_id])
  end

  private

  def find_project
    @project = Project.find_by_id(params[:project_id])
  end

  def find_to_do_list
    @to_do_list = @project.to_do_lists.find_by_id(params[:to_do_list_id])
  end

  def todo_params
    params.permit(:title, :description)
  end
end
