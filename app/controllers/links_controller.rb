class LinksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def go
    @link = Link.find_by_in_url!(params[:in_url])
    out = @link.out_url
    out = "http://#{out}" unless out.index("http") == 0
    @link.update_analytics
    redirect_to out, :status => @link.http_status
  end

  def create
    @link = current_user.links.build(params[:link])
    if @link.save
      flash[:success] = "Link created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end
	
  private

    def correct_user
      @link = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @link.nil?
    end
end