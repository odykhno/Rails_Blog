require "rails_helper"

RSpec.describe Post, :type => :model do
  before(:each) do
    @user = create(:user) do |user|
      user.posts.create(attributes_for(:post1))
      user.posts.first.tags.create(attributes_for(:tag1))
      user.posts.first.tags.create(attributes_for(:tag2))
    end
    @admin = create(:admin) do |admin|
      admin.posts.create(attributes_for(:post2))
      admin.posts.first.tags.create(attributes_for(:tag1))
    end
  end

  it "creates posts" do
    expect(Post.count).to eq(2)
  end

  it "creates posts associated to specified users" do
    expect(@user.posts.count).to eq(1)
    expect(@admin.posts.count).to eq(1)
  end
end