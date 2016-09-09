require "rails_helper"

RSpec.describe Comment, :type => :model do
  before(:each) do
    @user = create(:user) do |user|
      user.posts.create(attributes_for(:post1))
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
  
  it "creates comments" do
    expect(Comment.count).to eq(4)
  end

  it "creates comments associated with specified posts" do
    expect(@user.posts.first.comments.count).to eq(2)
    expect(@admin.posts.first.comments.count).to eq(2)
  end

  it "creates comments associated with specified users" do
    expect(@user.email).to eq(@comment2.author).and eq(@comment4.author)
    expect(@admin.email).to eq(@comment1.author).and eq(@comment3.author)
  end
end