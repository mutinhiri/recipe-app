require 'user'

module Mock
  def create_users
    names = [
      { name: 'Emmanuel', email: 'john.doe@example.com', role: 'admin' },
      { name: 'Ogah', email: 'ogah@2.com', role: 'admin' }
    ]
    (0..1).each do |i|
      user = User.new(names[i])
      user.password = 'admin123'
      user.password_confirmation = 'admin123'
      user.skip_confirmation!
      user.save!
    end
    User.all
  end

  def create_foods(users)
    users.each do |user|
      (1..5).each do |j|
        Food.create(name: "Food number: #{j}", measurement_unit: "gram: #{j}", price: "3: #{j}", user_id: user.id)
      end
    end
    Food.all
  end
end