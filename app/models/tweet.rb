class Tweet < ActiveRecord::Base
  attr_accessible :content, :type, :user_id, :can_id

  belongs_to :user
  belongs_to :can
  # TODO
  # after_create :send_topic_reply_notification

end
