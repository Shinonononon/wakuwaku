class BlogsController < ApplicationController

  def index
    @blogs = user.blogs.all
  end

  def new
    @blog = user.blogs.build(user_id:user.id)
  end

  def create
    @blog = user.blogs.build(user_id:user.id)
    if @blog.create
      redirect_to new_blog_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

end
