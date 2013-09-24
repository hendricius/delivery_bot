require "test_helper"

class HeadquartersControllerTest < ActionController::TestCase

  before do
    @headquarter = headquarters(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:headquarters)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Headquarter.count') do
      post :create, headquarter: {  }
    end

    assert_redirected_to headquarter_path(assigns(:headquarter))
  end

  def test_show
    get :show, id: @headquarter
    assert_response :success
  end

  def test_edit
    get :edit, id: @headquarter
    assert_response :success
  end

  def test_update
    put :update, id: @headquarter, headquarter: {  }
    assert_redirected_to headquarter_path(assigns(:headquarter))
  end

  def test_destroy
    assert_difference('Headquarter.count', -1) do
      delete :destroy, id: @headquarter
    end

    assert_redirected_to headquarters_path
  end
end
