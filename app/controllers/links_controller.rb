class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy, :add_point, :remove_point]

  # GET /links
  def index
    @links = Link.all
  end

  # GET /links/1
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
    redirect_to links_url
  end

  def add_point
    if @link.add_point
      msg = {notice: "Successfully gave #{@link.name} the thumbs up."}
    else
      msg = {alert: "Could not give #{@link.name} the thumbs up."}
    end

    redirect_to root_url, msg
  end

  def remove_point
    if @link.remove_point
      msg = {notice: "Successfully gave #{@link.name} the thumbs down."}
    else
      msg = {alert: "Could not give #{@link.name} the thumbs down."}
    end

    redirect_to root_url, msg
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:name, :uri, :username)
  end
end
