require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'GET index' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the #index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
