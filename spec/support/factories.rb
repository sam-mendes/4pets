FactoryGirl.define do
	factory :role do
		name "client"
	end

	factory :admin_role, class: Role do
		name "admin"
	end

	factory :user do
		name "John Doe"
		sequence(:email) {|n| "john#{n}@example.org"}
		password "test"
		password_confirmation "test"

		association :role
	end

	factory :admin, class: User do
		name "Naiara"
		sequence(:email) {|n| "naiara#{n}@example.org"}
		password "test"
		password_confirmation "test"
		association :role
	end

	preload do
		factory(:client) { create(:role) }
		factory(:admin) { create(:admin_role) }

		factory(:john) { create(:user, role: roles(:client)) }
		factory(:naiara) { create(:admin, role: roles(:admin))}
	end

end