require "test_helper"

class DriversControllerTest < ActionController::TestCase

  before do
    @driver = drivers(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Driver.count') do
      post :create, driver: {  }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  def test_show
    get :show, id: @driver
    assert_response :success
  end

  def test_edit
    get :edit, id: @driver
    assert_response :success
  end

  def test_update
    put :update, id: @driver, driver: {  }
    assert_redirected_to driver_path(assigns(:driver))
  end

  def test_destroy
    assert_difference('Driver.count', -1) do
      delete :destroy, id: @driver
    end

    assert_redirected_to drivers_path
  end
end
