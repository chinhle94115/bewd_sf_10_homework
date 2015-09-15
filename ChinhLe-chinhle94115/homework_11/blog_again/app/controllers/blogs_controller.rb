class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = get_blog
  end

  def edit
    @blog = get_blog
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render 'new'
    end
  end

  def update
    @blog = get_blog
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @article.destroy

    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :date, :body, :author, :private)
  end

  def get_blog
    Blog.find(params[:id])
  end

end
