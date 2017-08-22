require 'rails_helper'

RSpec.describe "static_page/home", type: :feature do
  it 'displays `Inicio` in title' do
    visit('/')
    expect(page).to have_title('Inicio | Geco USB')
  end
end
