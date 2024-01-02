# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get landing page when user is not logged in' do
    get home_index_url
    assert_response :success
  end
end
