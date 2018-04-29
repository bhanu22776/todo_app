class ToDoList < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  [:open, :in_progress, :done].each do |method_name|
    define_method :"#{method_name}?" do
      status == method_name.to_s
    end
  end
end
