class BlogsController < ApplicationController

  before_filter :find_blog, :only => [ :show, :edit, :update, :destroy ]

  #show all blogs
  def index
    # @blogs = Blogs.all
    @blogs = Blogs.page(params[:page]).per(5)
    @page_title = 'Blogs List'
  end
  #new blog
  def new
    @blog = Blogs.new
    @page_title = 'New a Blog'
  end

  #create
  def create
    @blog = Blogs.new(params[:blogs])
    # @blog.save
    # redirect_to :action => 'index'
    if @blog.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end

  #show a blog
  def show
    # @blog = Blogs.find(params[:id])
    @page_title = @blog.title
  end

  #edit a blog
  def edit
    # @blog = Blogs.find(params[:id])
    @page_title = 'Edit blog - ' + @blog.title
  end

  #update a blog
  def update
    # @blog = Blogs.find(params[:id])
    # @blog.update_attributes(params[:blogs])
    # redirect_to :action => :show, :id => @blog
    if @blog.update_attributes(params[:blogs])
      redirect_to :action => :show, :id => @blog
    else
      redirect_to :action => :edit, :id => @blog
    end
  end

  #destroy a blog
  def destroy
    # @blog = Blogs.find(params[:id])
    @blog.destroy

    redirect_to :action => 'index'
  end

  #find a blog
  protected

  def find_blog
    @blog = Blogs.find(params[:id])
  end
end
