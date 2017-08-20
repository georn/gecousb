require 'rails_helper'

RSpec.describe "static_page/home", type: :view do
  xit 'displays `Inicio` in title' do
    expect(page).to have_title('Inicio | Geco USB')
  end
end
