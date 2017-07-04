class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :members
  has_many :users, through: :members
  has_many :messages


  def last_message
   @message = Message.where(group_id: self.id).order('created_at DESC').limit(1)
   if @message.present?
     @message.each do |message|
       return message.body
     end
   else
     return "まだメッセージはありません"
   end
  end

end

