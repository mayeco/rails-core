require "test_helper"

class ResourceGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource_group = resource_groups(:one)
  end

  test "should get index" do
    get resource_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_group_url
    assert_response :success
  end

  test "should create resource_group" do
    assert_difference("ResourceGroup.count") do
      post resource_groups_url, params: { resource_group: { dataAreaId: @resource_group.dataAreaId, groupId: @resource_group.groupId, groupName: @resource_group.groupName, inputWarehouseId: @resource_group.inputWarehouseId } }
    end

    assert_redirected_to resource_group_url(ResourceGroup.last)
  end

  test "should show resource_group" do
    get resource_group_url(@resource_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_group_url(@resource_group)
    assert_response :success
  end

  test "should update resource_group" do
    patch resource_group_url(@resource_group), params: { resource_group: { dataAreaId: @resource_group.dataAreaId, groupId: @resource_group.groupId, groupName: @resource_group.groupName, inputWarehouseId: @resource_group.inputWarehouseId } }
    assert_redirected_to resource_group_url(@resource_group)
  end

  test "should destroy resource_group" do
    assert_difference("ResourceGroup.count", -1) do
      delete resource_group_url(@resource_group)
    end

    assert_redirected_to resource_groups_url
  end
end
