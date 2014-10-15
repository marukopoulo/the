class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @microposts = User.find(1).microposts.all
  end

  def tag_index
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
