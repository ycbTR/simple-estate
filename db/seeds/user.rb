user = User.new
user.email = 'admin@example.net'
user.firstname = 'Admin'
user.lastname = 'User'
user.description = 'Admin User'
user.role = 'Admin'
user.password = 12345678
user.password_confirmation = 12345678
user.save


user = User.new
user.email = 'agent@example.net'
user.firstname = 'Agent'
user.lastname = 'User'
user.description = 'This is an example description for my account. '
user.role = 'Agent'
user.password = 12345678
user.password_confirmation = 12345678
user.save


user = User.new
user.email = 'customer@example.net'
user.firstname = 'customer'
user.lastname = 'User'
user.description = 'This is an example description for my account. '
user.role = 'Customer'
user.password = 12345678
user.password_confirmation = 12345678
user.save