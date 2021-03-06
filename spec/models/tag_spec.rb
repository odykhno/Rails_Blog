# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Tag, :type => :model do
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

  it "creates tags" do
    expect(Tag.count).to eq(3)
  end

  it "creates tags associated with specified posts" do
    expect(@user.posts.first.tags.count).to eq(2)
    expect(@admin.posts.first.tags.count).to eq(1)
  end

  describe Tag, ".counts" do
    before(:each) do
      @tags = Tag.counts
    end

    it "returns list of all tags with name column" do
      expect(@tags.first).to respond_to(:name)
      expect(@tags.second.name).to eq("Olena")
    end

    it "all others columns are absent" do
      expect(@tags.first).not_to respond_to(:created_at)
      expect(@tags.second).not_to respond_to(:updated_at)
    end
  end
end
