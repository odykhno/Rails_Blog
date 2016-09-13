require "rails_helper"

describe "check admins rights", :type => :feature do
  before :each do
    @user = create(:user) do |user|
      @post = user.posts.create(attributes_for(:post1))
    end
    @admin = create(:admin)
    login_as(@admin, :scope => :user)
  end

  it "turn on moderation on posts" do
    visit('posts/get_all')
    within("table") do
      check('moderation', :option => '1')
      click_button 'Save changes'
    end
    expect(page).to have_checked_field('moderation')
  end

  describe "on page all_users" do
    before :each do
      visit('users/show')
    end

    it "grants admin rights to users" do
      within("table") do
        check('grant_admin', :option => '1')
        click_button 'Save changes'
      end
      expect(page).to have_checked_field('grant_admin')
      expect(page).to have_selector('td', text: true, count: 2)
    end

    it "blockes users" do
      within("table") do
        check('block_user', :option => '1')
        click_button 'Save changes'
      end
      expect(page).to have_checked_field('block_user')
      expect(page).to have_selector('td', text: true, count: 2)
    end
  end

  it "approves comments on posts with moderation = true" do
    visit('posts/get_all')
    within("table") do
      check('moderation', :option => '1')
      click_button 'Save changes'
    end
    @comment = @post.comments.create(attributes_for(:comment1))
    visit(comments_show_path)
    within("table") do
      check('approved', :option => '1')
      click_button 'Save changes'
    end
    expect(page).to have_content('Nothing to approve')
  end
end
