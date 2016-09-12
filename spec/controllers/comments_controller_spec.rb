require "rails_helper"

RSpec.describe CommentsController, :type => :controller do
  before(:each) do
    @user = create(:user) do |user|
      user.posts.create(attributes_for(:post1))
      user.posts.first.moderation = true
      @comment1 = user.posts.first.comments.create(attributes_for(:comment1))
      @comment2 = user.posts.first.comments.create(attributes_for(:comment2))
    end
    @admin = create(:admin) do |admin|
      admin.posts.create(attributes_for(:post2))
      @comment3 = admin.posts.first.comments.create(attributes_for(:comment3))
      @comment4 = admin.posts.first.comments.create(attributes_for(:comment4))
    end
    @comment1.author = @admin.email
    @comment2.author = @user.email
    @comment3.author = @admin.email
    @comment4.author = @user.email
  end

  # describe "POST #create" do
  #   it "creates a new comment" do
  #     post :create, params: { post_id: 1, comment: @user.posts.first.comments.create(attributes_for(:comment3)) }
  #     expect(response).to change(Comment, :count).by(1)
  #   end
  # end

  # describe "POST #save" do
  #   it "approves comments on posts with moderation on" do
  #     sign_in @admin
  #     post :save, params: { post_id: 1, id: 1, comment: { @comment1.approved => true } }
  #     expect(response).to have_http_status(200)
  #     expect(@comment1.approved).to be true
  #   end
  # end

  describe "DELETE #destroy" do
    it "deletes specified comment" do
      delete :destroy, params: { post_id: 1, id: 1 }
      expect(@user.posts.first.comments.count).to eq(1)
    end

    it "updates page with all user posts" do
      delete :destroy, params: { post_id: 1, id: 1 }
      expect(response).to redirect_to (post_path(@user.posts.first))
    end
  end
end
