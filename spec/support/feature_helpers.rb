module FeatureHelpers
	def login_as(user)	
		visit root_path
		click_link "Acessar minha conta"
		
		fill_in "Seu e-mail", with: users(user).email
		fill_in "Sua senha", with: "test"
		click_button "Entrar"
	end

	RSpec.configure do |config|
		config.include FeatureHelpers, type: :feature
	end

end