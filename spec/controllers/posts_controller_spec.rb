require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  before(:each) do
    @user = create(:user) do |user|
      user.posts.create(attributes_for(:post1))
    end
    @admin = create(:admin) do |admin|
      admin.posts.create(attributes_for(:post2))
    end
    sign_in @user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of current user posts into @posts" do
      get :index
      expect(assigns(:posts)).to match_array(@user.posts)
    end
  end

  describe "GET #get_all" do
    it "responds successfully with an HTTP 200 status code" do
      get :get_all
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the get_all template" do
      get :get_all
      expect(response).to render_template("get_all")
    end

    it "loads all of the posts into @posts" do
      get :get_all
      expect(assigns(:posts)).to match_array([@user.posts.first, @admin.posts.first])
    end
  end

  # describe "POST #save" do
  #   it "redirects to the new post" do
  #
  #     post :save, params: { id: 1, post: @user.posts.create(attributes_for(:post2)) }
  #     expect(response).to render_template("show")
  #   end
  # end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: 1 }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "redirects to the post page" do
      get :show, params: { id: 1 }
      expect(response).to render_template("show")
    end

    it "loads selected post into @post" do
      get :show, params: { id: 1 }
      expect(assigns(:post)).to match(@user.posts.first)
    end
  end

  # describe "POST #create" do
  #   it "creates a new post" do
  #     post :create, params: { post: @user.posts.create(attributes_for(:post2)) }
  #     expect(response).to change(Post, :count).by(1)
  #   end
  #
  #   it "redirects to the new post" do
  #     post :create, params: { post: @user.posts.create(attributes_for(:post2)) }
  #     expect(response).to render_template("show")
  #   end
  #
  # end

  # describe "POST #update" do
  #   it "updates current post" do
  #     post :update, params: { id: 1, post: {@user.posts.first.title => "New title"} }
  #     expect(assigns(:post).title).to eq("New title")
  #   end
  # end

  describe "DELETE #destroy" do
    it "deletes specified post" do
      delete :destroy, params: {id: 1}
      expect(@user.posts.count).to eq(0)
    end

    it "updates page with all user posts" do
      delete :destroy, params: {id: 1}
      # expect(response).to render_template("index")
      response.should redirect_to (posts_path)

      posts_path
    end

  end

end
