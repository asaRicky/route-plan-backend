# db/seeds.rb

# Create sample Users
user1 = User.create!(username: 'merchandiser1', email: 'merchandiser1@example.com', password_digest: 'password', role: 'merchandiser')
user2 = User.create!(username: 'salesmanager1', email: 'salesmanager1@example.com', password_digest: 'password', role: 'sales_manager')

# Create sample Merchandiser
merchandiser1 = Merchandiser.create!(user: user1, name: 'John Dee', contact_number: '1234567890')

# Create sample Sales Manager
salesmanager1 = SalesManager.create!(user: user2, name: 'Jane Smith', contact_number: '9876543210')

# Create sample Outlets
outlet1 = Outlet.create!(name: 'Outlet A', address: '123 Main St, City')
outlet2 = Outlet.create!(name: 'Outlet B', address: '456 Broad St, Town')

# Create sample Route Plan
route_plan = RoutePlan.create!(user: salesmanager1.user, merchandiser: merchandiser1, start_date: Date.today, end_date: Date.today + 30.days)

# Create sample Check-Ins
CheckIn.create!(user: merchandiser1.user, merchandiser_id: merchandiser1.id, outlet: outlet1, check_in_timestamp: Time.now)
CheckIn.create!(user: merchandiser1.user, merchandiser_id: merchandiser1.id, outlet: outlet2, check_in_timestamp: Time.now - 2.hours)
