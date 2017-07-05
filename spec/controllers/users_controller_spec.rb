require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    it "users with active roles" do
			role = Role.create(hidden: false)
      user = User.create(email: 'admin@example.com')
			user.roles << role
      get :index, xhr: true
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index, xhr: true
      expect(response).to render_template("index")
    end
  end

	describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
		it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end
