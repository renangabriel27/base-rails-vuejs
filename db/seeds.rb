User.create_with(name: 'User', password: 'user123').find_or_create_by!(email: 'user@gmail.com')
