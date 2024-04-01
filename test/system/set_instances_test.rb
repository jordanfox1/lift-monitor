# frozen_string_literal: true
# # frozen_string_literal: true

# require 'application_system_test_case'

# class SetInstancesTest < ApplicationSystemTestCase
#   setup do
#     @set_instance = set_instances(:one)
#   end

#   test 'visiting the index' do
#     visit set_instances_url
#     assert_selector 'h1', text: 'Set instances'
#   end

#   test 'should create set instance' do
#     visit set_instances_url
#     click_on 'New set instance'

#     click_on 'Create Set instance'

#     assert_text 'Set instance was successfully created'
#     click_on 'Back'
#   end

#   test 'should update Set instance' do
#     visit set_instance_url(@set_instance)
#     click_on 'Edit this set instance', match: :first

#     click_on 'Update Set instance'

#     assert_text 'Set instance was successfully updated'
#     click_on 'Back'
#   end

#   test 'should destroy Set instance' do
#     visit set_instance_url(@set_instance)
#     click_on 'Destroy this set instance', match: :first

#     assert_text 'Set instance was successfully destroyed'
#   end
# end
