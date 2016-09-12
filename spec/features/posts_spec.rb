require "rails_helper"

describe "creating new post with comment", :type => :feature do
  before :each do
    @user = create(:user) do |user|
      @post = user.posts.create(attributes_for(:post1))
      @post.tags.create(attributes_for(:tag1))
    end
    login_as(@user, :scope => :user)
  end

  it "creates new post" do
    visit 'posts/new'
    within("#new_post") do
      fill_in 'post[title]', :with => 'The first post'
      fill_in 'post[text]', :with => 'Text of the first post'
      fill_in 'post[all_tags]', :with => 'text, post'
    end
    click_button 'Create post'
    expect(page).to have_content 'The first post'
  end

  it "creates comment to this post" do
    visit(post_path(@post))
    within("#new_comment") do
      fill_in 'comment[text]', :with => 'The first comment'
    end
    click_button 'Create Comment'
    expect(page).to have_selector('td', :text => 'The first comment')
  end

  it "crestes tag cloud with appropriate search" do
    visit(post_path(@post))
    within("footer") do
      click_link 'name'
    end
    expect(page).to have_content 'Listing all posts'
    expect(page).to have_selector('td', :text => 'First post')
  end
end