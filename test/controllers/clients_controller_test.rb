require "test_helper"

class ClientsControllerTest < ActionController::TestCase

  before do
    @client = clients(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Client.count') do
      post :create, client: {  }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  def test_show
    get :show, id: @client
    assert_response :success
  end

  def test_edit
    get :edit, id: @client
    assert_response :success
  end

  def test_update
    put :update, id: @client, client: {  }
    assert_redirected_to client_path(assigns(:client))
  end

  def test_destroy
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
