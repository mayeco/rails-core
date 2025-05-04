require "application_system_test_case"

class ResourceGroupsTest < ApplicationSystemTestCase
  setup do
    @resource_group = resource_groups(:one)
  end

  test "visiting the index" do
    visit resource_groups_url
    assert_selector "h1", text: "Resource groups"
  end

  test "should create resource group" do
    visit resource_groups_url
    click_on "New resource group"

    fill_in "Dataareaid", with: @resource_group.dataAreaId
    fill_in "Groupid", with: @resource_group.groupId
    fill_in "Groupname", with: @resource_group.groupName
    fill_in "Inputwarehouseid", with: @resource_group.inputWarehouseId
    click_on "Create Resource group"

    assert_text "Resource group was successfully created"
    click_on "Back"
  end

  test "should update Resource group" do
    visit resource_group_url(@resource_group)
    click_on "Edit this resource group", match: :first

    fill_in "Dataareaid", with: @resource_group.dataAreaId
    fill_in "Groupid", with: @resource_group.groupId
    fill_in "Groupname", with: @resource_group.groupName
    fill_in "Inputwarehouseid", with: @resource_group.inputWarehouseId
    click_on "Update Resource group"

    assert_text "Resource group was successfully updated"
    click_on "Back"
  end

  test "should destroy Resource group" do
    visit resource_group_url(@resource_group)
    click_on "Destroy this resource group", match: :first

    assert_text "Resource group was successfully destroyed"
  end
end
