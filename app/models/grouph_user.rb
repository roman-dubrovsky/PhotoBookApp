class GrouphUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :grouph
end
