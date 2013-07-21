desc "Add roles into database"
task :add_roles_into_db => :environment do
	%w[ client admin ].each do |role|
		Role.create(name: role)
	end
end