class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :text, presence: true

  def posted_time
    created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def posted_user
    user.nickname
  end
end
