require 'rails_helper'

describe "login", type: :feature, js: true do
  before do
    FactoryBot.create(:user, email: 'MyAdmin@example.com', password: "myuser", password_confirmation: "myuser", admin: true)
  end

  it "works" do
    visit '/admin'

    fill_in('user_email', with: 'MyAdmin@example.com')
    fill_in('user_password', with: 'myuser')

    click_button('Zaloguj')

    click_link('Użytkownicy')

    click_link('Dodaj użytkownika')

    fill_in('user_username', with: 'nieadmin')
    fill_in('user_email', with: 'nieadmin@example.com')
    uncheck('user_admin')

    click_button('Zarejestruj się')

    click_link("Wyloguj")





  end
end
