require "rails_helper"

RSpec.describe User, :type => :model do
  it "creates users" do
    user = create(:user)
    admin = create(:admin)

    expect(User.count).to eq(2)
  end
end