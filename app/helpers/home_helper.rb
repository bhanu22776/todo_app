module HomeHelper

  def todo_list_developer_header(to_do_list)
    headers = ["Status"]
    User.without_role(:admin).each{|user| headers << user.name.titleize}
    headers.map{|el| content_tag :th, el}.join().html_safe
  end

  def todo_list_project_header(to_do_list)
    headers = ["Status"]
    Project.all.each{|project| headers << project.name.titleize}
    headers.map{|el| content_tag :th, el}.join().html_safe
  end

  def todo_list_user_details(status, todo_lists)
    content_tag :tr do
      content_tag(:td, status.titleize) +
      todo_lists.sort_by(&:user_id).group_by(&:user).map do |user, todo_lists| 
        content_tag(:td, todo_lists.map(&:title).join('<br>').html_safe)
      end.join().html_safe
    end
  end

  def todo_list_project_details(status, todo_lists)
    content_tag :tr do
      content_tag(:td, status.titleize) +
      todo_lists.sort_by(&:user_id).group_by(&:project).map do |project, todo_lists| 
        content_tag(:td, todo_lists.map(&:title).join('<br>').html_safe)
      end.join().html_safe
    end
  end
end
