require 'test_helper'

describe CommentsController do
  before(:each) do
    @comment      = comments(:one)
    @link         = links(:one)
    @valid_params = {
      link_id:  links(:two).id,
      username: "joebob",
      body:     "This is a test comment."
    } 
  end

  it "should redirect to root path if link not found" do
    get :new, link_id: 999999999
    assert_redirected_to root_path
  end

  it "should get new" do
    get :new, link_id: @link.id
    assigns(:link).id.must_equal @link.id
    assert_response :success
  end

  it "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: @valid_params
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  it "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  it "should update comment" do
    patch :update, id: @comment, comment: @valid_params
    @comment.reload
    @comment.body.must_equal @valid_params[:body]
    assert_redirected_to comment_path(assigns(:comment))
  end

  it "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to link_path(assigns(:link))
  end
end
