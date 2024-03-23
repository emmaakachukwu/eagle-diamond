# frozen_string_literal: true

require 'test_helper'

class SentPackagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get sent_packages_index_url
    assert_response :success
  end

  test 'should get show' do
    get sent_packages_show_url
    assert_response :success
  end
end
