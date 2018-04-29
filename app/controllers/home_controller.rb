class HomeController < ApplicationController
  before_action :find_project_to_do_list, except: [:index]

  def index
    @to_do_lists = current_user.to_do_lists
  end

  def change_todo_status
  end

  def update_todo_status
    @to_do_list.update(status: params[:status])
  end

  private
  def find_project_to_do_list
    @project = Project.find_by_id(params[:project_id])
    @to_do_list = @project.to_do_lists.find_by_id(params[:to_do_list_id])
  end
end
