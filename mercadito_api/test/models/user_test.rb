require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'user with valid email shoud be valid' do

    user = User.new(email: 'qwerty@unam.mx', password_digest: '123456')
    assert user.valid?

  end

  test 'user with invalid email should be invalid' do

    user = User.new(email: 'test', password_digest: 'test')

    assert_not user.valid?

  end


  test 'user with taken email should be invalid' do

    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')

  end

end
