class BlogsController < ApplicationController

  def index
  end #index

  def new
    @blog = Blog.new 
  end #new

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog)
    else
      @blog = Blog.new
      render :new
    end
  end #create

  def show
    set_blog 
  end #show

  def edit
    set_blog
  end #edit

  def update
    set_blog
    if @blog.update_attributes(blog_params)
        redirect_to blog_path(@blog)
    else
        render :edit 
    end
  end #update

  def destroy
    Blog.find(params[:id]).destroy 
    redirect_to root_path 
  end #destroy 

  private

  def set_blog
    @blog = Blog.find_by(id: params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

end
