require "spec_helper"

feature "Signup" do
  scenario "with valid credentials" do
  	visit root_path
  	click_link "Quero me cadastrar"

    fill_in "Seu nome", with: "John Doe"
		fill_in "Seu e-mail", with: "john@example.org"
		fill_in "Sua senha", with: "test"
    fill_in "Confirme sua senha", with: "test"

		click_button "Quero me cadastrar"

		expect(current_path).to eql(root_path)
		expect(page).to have_content("Cadastro realizado com sucesso!")
  end

  scenario "with invalid credentials" do
    visit root_path
    click_link "Quero me cadastrar"

    click_button "Quero me cadastrar"

    expect(current_path).to eql(user_index_path)
    expect(page).to have_content("Verifique o formulário antes de continuar:")

  end

  scenario "already logged in" 
  scenario "with admin credentials"
end