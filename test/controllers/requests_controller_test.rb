require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { address: @request.address, budget: @request.budget, category: @request.category, company_name: @request.company_name, date_request_executed: @request.date_request_executed, date_response_by: @request.date_response_by, description: @request.description, location: @request.location, sub_category: @request.sub_category, title: @request.title }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    patch :update, id: @request, request: { address: @request.address, budget: @request.budget, category: @request.category, company_name: @request.company_name, date_request_executed: @request.date_request_executed, date_response_by: @request.date_response_by, description: @request.description, location: @request.location, sub_category: @request.sub_category, title: @request.title }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
