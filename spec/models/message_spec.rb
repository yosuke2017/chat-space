require 'rails_helper'
require 'spec_helper'

describe Message do
  describe '#create' do

    it "is valid with a body, image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid if body is there" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "is valid if image is there" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end

    it "is invalid without a body and images" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end

    it "is invalid without group_id" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end

    it "is invalid without user_id" do
      # user = create(:user)
      # group = create(:group)
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end

  end
end


