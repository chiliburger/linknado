require 'test_helper'

describe LinksController do
  before(:each) do
    @link         = links(:one)
    @valid_params = {
      name:     'OSNews',
      uri:      'http://www.osnews.com',
      username: 'smith'
    }
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create link" do
    assert_difference('Link.count') do
      post :create, link: @valid_params
    end

    assert_redirected_to link_path(assigns(:link))
  end

  it "should show link" do
    get :show, id: @link
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @link
    assert_response :success
  end

  it "should update link" do
    patch :update, id: @link, link: @valid_params

    @link.reload
    @link.name.must_equal @valid_params[:name]
    @link.uri.must_equal @valid_params[:uri]
    @link.username.must_equal @valid_params[:username]

    assert_redirected_to link_path(assigns(:link))
  end

  it "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, id: @link
    end

    assert_redirected_to links_path
  end
end
