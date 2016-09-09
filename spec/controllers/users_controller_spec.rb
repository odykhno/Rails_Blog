require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "if current user has admin rights" do
    before(:each) do
      @user = create(:user)
      @admin = create(:admin)
      sign_in @admin
    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :show
        expect(response).to render_template("show")
      end

      it "loads all of the users into @users" do
        get :show
        expect(assigns(:users)).to match_array([@user, @admin])
      end
    end

    # describe "POST #save" do
    #
    # end
  end

  describe "if current user doesn't have admin rights" do
    before(:each) do
      @user = create(:user)
      @admin = create(:admin)
      sign_in @user
    end

    describe "GET #show" do
      it "responds unsuccessfully with an HTTP 401 status code" do
        get :show
        expect(response).not_to be_success
        expect(response).to have_http_status(401)
      end

      it "renders the unauthorised page" do
        get :show
        expect(response).to render_file('public/422.html')
      end
    end
  end
end