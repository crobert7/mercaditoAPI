require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest

  setup do

    @user = users(:one)

  end

  test "should show user" do

    get api_v1_user_url(@user), as: :json
    assert_response :success

    #Test to ensure response contains the correct email
    json_response = JSON.parse(self.response.body)
    assert_equal @user.email, json_response['email']

  end

  #Test to create Users

  test "Should create user" do

    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { email: 'roberto@test.com', password: '7654321' }}, as: :json

    end

    assert_response :created

  end

  test "Should not create a user with taken email" do

    assert_no_difference('User.count') do
      post api_v1_users_url, params: { user: { email: @user.email, password: '1234576' }}, as: :json

    end

    assert_response :unprocessable_entity

  end


  test "should update user" do

    patch api_v1_user_url(@user), params: {user: { email: @user.email, password: '1234569' }}, as: :json

    assert_response :success

  end

  test "should not update user when invalid params are sent" do

    patch api_v1_user_url(@user), params: { user: { email: 'bad_mail', password: '1234560' }}, as: :json

    assert_response :unprocessable_entity

  end

  test "shoud destroy user" do

    assert_difference('User.count', -1) do

      delete api_v1_user_url(@user), as: :json

    end

    assert_response :no_content

  end

end
