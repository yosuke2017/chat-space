class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :members
  has_many :users, through: :members
  has_many :messages


  def last_message
   @message = Message.where(group_id: self.id).order('created_at DESC').limit(1)
   if @message.empty?
     return "まだメッセージはありません"
   elsif @message.present?
     @message.each do |message|
       if message.body.present?
         return message.body
       elsif message.body.empty?
         return "画像が送信されました"
       end
     end
   end
  end
end

