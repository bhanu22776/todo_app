class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, through: :to_do_lists
  has_many :to_do_lists
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:developer) if self.roles.blank?
  end
end
