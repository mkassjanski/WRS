class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  def timestamp
  created_at.strftime('%H:%M:%S %d %B %Y')
  end
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
