class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  # validates_uniquenesss_of [:conversation_id, :user_id]
end
