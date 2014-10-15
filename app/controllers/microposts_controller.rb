class MicropostsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

def index
  if !params[:tag].blank?
    @microposts = Micropost.tagged_with(params[:tag])
  else
    @microposts = Micropost.all
  end
end

def show
    @micropost = User.find(1).microposts.find_by(id: params[:id])
end




    def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.tag_list = params[:micropost][:tag_list] # ここでタグを設定する

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

 def destroy
    @micropost.destroy
    redirect_to root_url
  end

  def tag_cloud
    @tags = Micropost.tag_counts_on(:tags)
  end



  private

    def micropost_params
      params.require(:micropost).permit(:content,:title,:tag_list)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end