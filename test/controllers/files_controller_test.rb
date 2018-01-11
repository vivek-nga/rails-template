require 'test_helper'

class FilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file = files(:one)
  end

  test "should get index" do
    get files_url
    assert_response :success
  end

  test "should get new" do
    get new_file_url
    assert_response :success
  end

  test "should create file" do
    assert_difference('File.count') do
      post files_url, params: { file: {  } }
    end

    assert_redirected_to file_url(File.last)
  end

  test "should show file" do
    get file_url(@file)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_url(@file)
    assert_response :success
  end

  test "should update file" do
    patch file_url(@file), params: { file: {  } }
    assert_redirected_to file_url(@file)
  end

  test "should destroy file" do
    assert_difference('File.count', -1) do
      delete file_url(@file)
    end

    assert_redirected_to files_url
  end
end
