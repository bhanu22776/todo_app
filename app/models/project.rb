class Project < ActiveRecord::Base
	has_many :users, through: :to_do_lists
	has_many :to_do_lists
end
