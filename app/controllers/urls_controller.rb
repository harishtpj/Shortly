class UrlsController < ApplicationController
  def home
    @url = Url.new
  end

  def about
  end

  def create
    @url = Url.new(url_params)
    Url.create!(url: request.base_url + '/about') if (Url.last.id.succ == Base62.decode('about'))
    if @url.save
      flash[:success] = "URL shortened successfully!"
      flash[:shortened_url] = Base62.encode(@url.id)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    url = Url.find(Base62.decode(params[:url_id]))
    redirect_to url.url, allow_other_host: true
  end

  private
    def url_params
      params.expect(url: [:url])
    end
end
