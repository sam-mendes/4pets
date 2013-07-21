require 'spec_helper'

describe User do
	it "require name" do
	  user = User.create name: nil
	  expect(user).to have_at_least(1).error_on(:name)
	end

	it "require e-mail" do
	  user = User.create email: nil
	  expect(user).to have_at_least(1).error_on(:email)
	end

	it "don't allow duplicated emails" do
	   existing_user = users(:john)
	   new_user = User.create(email:existing_user.email)
	   
	   expect(new_user).to have_at_least(1).error_on(:email)
	end

	%w[	
		john.doe@example.c
		john+spam@example
		invalid
	].each do |email|
  	it "require #{email} as invalid email" do
  	  user = User.create(email: email)

  	  expect(user).to have_at_least(1).error_on(:email)
  	end
	end

	%w[
		john.doe@example.co.uk
		john+spam@example.com.br
		john@example.me
		john@example.info
		john1234@example.io
	].each do |email|
  	it "accepts #{email} as valid email" do
  	  user = User.create(email: email)

  	  expect(user).to have_at_least(:no).error_on(:email)
  	end
	end

	it "require password" do
	  user = User.create password: nil
	  expect(user).to have_at_least(1).error_on(:password)
	end	

	it "require password confirmation" do
	  user = User.create password: "test", password_confirmation: nil
	  expect(user).to have_at_least(1).error_on(:password_confirmation)
	end

end
