class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
    @blogger = Blogger.find_by(id: params[:id])
    @featured_post = @blogger.featured_post
    @most_written_destinations = @blogger.most_written_destinations
  end

  private

  def blogger_params
    params.require(:blogger).permit(
      :name,
      :bio,
      :age
    )
  end

end
