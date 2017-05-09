class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = Video.new
  end

  def create
      binding.pry
      resource = params
      video = Yt::Video.new url: resource.link
      resource.uid = video.id
      resource.title = video.title
      resource.likes = video.like_count
      resource.dislikes = video.dislike_count
      resource.published_at = video.published_at
    # rescue Yt::Errors::NoItems
      resource.title = ''


    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end
