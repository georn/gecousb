require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET home" do
    it "responds with 200" do
      get :home
      expect(response).to have_http_status(200)
    end

    it "renders the #home view" do
      get :home
      expect(response).to render_template :home
    end
  end
end
