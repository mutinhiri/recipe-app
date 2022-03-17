require 'user'

module Mock
  def create_users
    names = [
      { name: 'Emmanuel', email: 'john.doe@example.com', postsCounter: 5, email: 'emmanuel@2.com', role: 'admin' },
      { name: 'Ogah', bio: 'English teacher', postsCounter: 5, email: 'ogah@2.com', role: 'admin' }
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
  
end