class PostsController < ApplicationController

  def index
    @breakfast      = Post.all.order(id:"desc").where(meals: "Breakfast")
    @lunch          = Post.all.order(id:"desc").where(meals: "Lunch")
    @afternoonsnack = Post.all.order(id:"desc").where(meals: "Afternoon Snack")
    @dinner         = Post.all.order(id:"desc").where(meals: "Diner")
    @random = Post.order("RAND()").limit(1)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "出品完了やで！！！"
    else 
      render :new, alert: '出品できませんでした'
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :meals, :description).merge(user_id: current_user.id)
  end
end
