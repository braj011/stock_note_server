class Api::V1::NewsApisController < ApplicationController

  include HTTParty

  def index
      def business_headlines
        base_business_news_url = "https://newsapi.org/v2/everything?q=%22business%22,%20%22stocks%22&pageSize=100&sortBy=publishedAt&sources=bbc-news,%20cnbc,%20bloomberg,%20cnbc,%20crypto-coins-news,%20business-insider,%20financial-post,%20%20financial-times,%20fortune,%20techcrunch,%20the-wall-street-journal"
        request = HTTParty.get(base_business_news_url + '&apiKey='+ ENV['NEWS_KEY']).to_json
        @request_hash = JSON.parse(request)
      end 

    render json: business_headlines
 end

 def create 

    def profile_news
      base_profile_news_url = "https://newsapi.org/v2/everything?q="
      number_of_results = "&pageSize=100"
      news_sources = "&sources=bbc-news,%20cnbc,%20bloomberg,%20cnbc,%20crypto-coins-news,%20business-insider,%20financial-post,%20%20financial-times,%20fortune,%20techcrunch,%20the-wall-street-journal"
      query = params[:query]
      sort = params[:sort]
      request = HTTParty.get(base_profile_news_url + query + '&sortBy=' + sort + number_of_results + news_sources + '&apiKey=' + ENV['NEWS_KEY']).to_json
      JSON.parse(request)
    end 
    render json: profile_news
 end 

  
end


# https://newsapi.org/v2/everything?q=%22business%22,%20%22stocks%22&pageSize=100&sortBy=relevancy&sources=bbc-news,%20cnbc,%20bloomberg,%20cnbc,%20crypto-coins-news,%20business-insider,%20financial-post,%20%20financial-times,%20fortune,%20techcrunch,%20the-wall-street-journal&apiKey=4504a69831fd40fb967a5cd2328c3e58