class MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to(root_url)
    else
      @feed_items = []
      render("staticpages/home")
    end
  end

  def destroy
    @micropost.destroy
    redirect_to(root_url)
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      recirect_to(root_url) if @micropost.nil?
    end
end