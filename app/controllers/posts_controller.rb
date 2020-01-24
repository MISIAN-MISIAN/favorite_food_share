class PostsController < ApplicationController

  def index
    @breakfast      = Post.order(created_at:"desc").where(meals: "Breakfast")
    @lunch          = Post.order(created_at:"desc").where(meals: "Lunch")
    @afternoonsnack = Post.order(created_at:"desc").where(meals: "Afternoon Snack")
    @dinner         = Post.order(created_at:"desc").where(meals: "Dinner")
    @restaurant     = Post.order(created_at:"desc").where(meals: "Favorite Restaurant")
    @random = Post.order("RAND()").limit(1)
  end

  def breakfast
    @breakfast      = Post.all.order(created_at:"desc").where(meals: "Breakfast")
  end

  def lunch
    @lunch          = Post.all.order(created_at:"desc").where(meals: "Lunch")
  end

  def afternoonsnack
    @afternoonsnack = Post.all.order(created_at:"desc").where(meals: "Afternoon Snack")
  end

  def dinner
    @dinner         = Post.all.order(created_at:"desc").where(meals: "Dinner")
  end

  def restaurant
    @restaurant     = Post.all.order(created_at:"desc").where(meals: "Favorite Restaurant")
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
