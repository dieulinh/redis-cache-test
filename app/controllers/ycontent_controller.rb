class YcontentController < ApplicationController
  def index
    cache_key = "best-posts-ycombinator"
    if articles = Rails.cache.redis.get(cache_key)
      content = JSON.parse(articles)
      @readable_content = content["pages"]
    else
      readable_content = WebsiteScaper.read_page_content('https://news.ycombinator.com/best')
      content = readable_content.stringify_keys
      @readable_content = content["pages"]
      Rails.cache.redis.set(cache_key, content.to_json)
      Rails.cache.redis.expire(cache_key, 24.hours)
    end
  end
  def get_post
    url = params[:url]
    @post = WebsiteScaper.parse_article(url)
  end
  def welcome
  end
end
