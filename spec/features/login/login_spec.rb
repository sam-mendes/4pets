require "spec_helper"

feature "Login" do
  scenario "with valid credentials" do
  	visit root_path
  	click_link "Acessar minha conta"

  	user = users(:john)
  	fill_in "Seu e-mail", with: user.email
  	fill_in "Sua senha", with: "test"
  	click_button "Entrar"

  	expect(current_path).to eql(user_index_path)
  	expect(page).to have_content("Olá, #{user.name}")
  end

  scenario "with invalid credentials" do
    visit root_path
    click_link "Acessar minha conta"

    click_button "Entrar"

    expect(current_path).to eql(new_login_path)
    expect(page).to have_content("E-mail/senha inválidos.")
  end
  
  scenario "with admin credentials" do
    visit root_path
    click_link "Acessar minha conta"
    admin = users(:naiara)

    fill_in "Seu e-mail", with: admin.email
    fill_in "Sua senha", with: "test"
    click_button "Entrar"

    expect(current_path).to eql(admin_dashboard_path)
    #TODO others assertions
  end
  scenario "already logged in"
end