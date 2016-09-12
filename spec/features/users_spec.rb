require "rails_helper"

describe "the signin process", :type => :feature do
  before :each do
    @user = create(:user)
  end

  describe "if correct data" do
    it "signs me in" do
      visit 'users/sign_in'
      within("#new_user") do
        fill_in 'Email', :with => 'user@mail.ru'
        fill_in 'Password', :with => '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end

  describe "if incorrect data" do
    it "doesn't sign me in" do
      visit 'users/sign_in'
      within("#new_user") do
        fill_in 'Email', :with => 'user@mail.com'
        fill_in 'Password', :with => '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end