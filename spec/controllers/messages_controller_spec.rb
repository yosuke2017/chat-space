require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:user) { create(:user) }
  let(:message) { create(:message) }
  let(:messages) { create_list(:message, 3)}
  let(:group) { create(:group) }
  let(:set_group) { get :index, params: { group_id: group.id } }

      describe "GET #index" do

        context "sign in" do
          before do
            login_user user
            set_group
          end

          it "該当するビューが表示されているか" do
            expect(response).to render_template :index
          end

          it "assigns the requested groups to @groups" do
            groups = user.groups
            expect(assigns(:groups)).to eq groups
          end

          it "assigns the requested group to @group" do
            expect(assigns(:group)).to eq group
          end

          it "assigns the requested messages to @messages" do
            messages = group.messages
            expect(assigns(:messages)).to eq messages
          end
        end

        context "didn't sign in" do
          before {
            sign_out user
            set_group
          }
           it "該当するビューに遷移できているか" do
             expect(response).to redirect_to new_user_session_url
             expect(flash[:alert]).to include "ログインまたは登録が必要です"
           end
        end
      end



      describe "POST #create" do

        context "ログインしているかつ、保存に成功した場合" do
          before do
            login_user user
          end

          it "メッセージの保存はできたのか" do
            expect{
              post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
            }.to change(Message, :count).by(1)
            expect(flash[:notice]).to include "メッセージを送信しました"
          end

          it "意図した画面を表示できているか" do
            post :create, params: { message: attributes_for(:message, { body: 'hello' }), group_id: group.id }
            expect(response).to redirect_to group_messages_path(group)
          end
        end

        context "ログインしているが、保存に失敗した場合" do
          before do
            login_user user
          end

          it "メッセージの保存は失敗しているか" do
            expect{
              post :create, params: { message: attributes_for(:message, { body: '', image: '' }), group_id: group.id }
            }.to_not change(Message, :count)
            expect(flash[:alert]).to include "メッセージを入力してください"
          end

          it "意図したビューが描画されているか" do
            post :create, params: { message: attributes_for(:message, { body: '', image: '' }), group_id: group.id }
            expect(response).to render_template :index
          end
        end

        context "ログインしていない場合" do
          before do
            sign_out user
            set_group
          end

          it "意図した画面にリダイレクトできているか" do
            expect(response).to redirect_to new_user_session_url
            expect(flash[:alert]).to include "ログインまたは登録が必要です"
          end
        end
      end


end
