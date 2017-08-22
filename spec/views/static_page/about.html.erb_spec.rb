require 'rails_helper'

RSpec.describe "static_page/about", type: :feature do
  it 'displays `Sobre nosotros` in title' do
    visit('/sobre-nosotros')
    expect(page).to have_title('Sobre nosotros | Geco USB')
  end
end
