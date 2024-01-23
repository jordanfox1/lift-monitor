require "test_helper"

class SetInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @set_instance = set_instances(:one)
  end

  test "should get index" do
    get set_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_set_instance_url
    assert_response :success
  end

  test "should create set_instance" do
    assert_difference("SetInstance.count") do
      post set_instances_url, params: { set_instance: {  } }
    end

    assert_redirected_to set_instance_url(SetInstance.last)
  end

  test "should show set_instance" do
    get set_instance_url(@set_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_set_instance_url(@set_instance)
    assert_response :success
  end

  test "should update set_instance" do
    patch set_instance_url(@set_instance), params: { set_instance: {  } }
    assert_redirected_to set_instance_url(@set_instance)
  end

  test "should destroy set_instance" do
    assert_difference("SetInstance.count", -1) do
      delete set_instance_url(@set_instance)
    end

    assert_redirected_to set_instances_url
  end
end
