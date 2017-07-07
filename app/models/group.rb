class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :members
  has_many :users, through: :members
  has_many :messages

  def last_message
    if @message = self.messages.last
      if @message.body.present?
        return @message.body
      else
        return "画像が送信されました"
      end
    else
      return "まだメッセージはありません"
    end
  end
end

