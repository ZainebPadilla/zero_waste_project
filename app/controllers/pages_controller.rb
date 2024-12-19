class PagesController < ApplicationController
  def team
  end

  def contact
  end

  def legal
  end

  def news
    # API key from .env
    api_key = ENV['NEWS_API_KEY']

    # Define the API URL with parameters
    # Define the API URL with query parameters
    # 'q=environment' searches for articles related to the environment
    # 'language=fr' limits results to articles in French
    # 'apiKey' includes the API key for authentication
    url = URI("https://newsapi.org/v2/everything?q=environment&language=fr&apiKey=#{api_key}")

    # Make the HTTP GET request to the API
    response = Net::HTTP.get(url)

     # Parse the JSON response into a Ruby object
    data = JSON.parse(response)

   # Extract the list of articles from the API response
    @articles = data['articles']
  rescue => e
      # Handle any errors that occur during the API request or processing
  # Set an error message and ensure @articles is an empty array
    @error_message = "Erreur lors de la récupération des actualités : #{e.message}"
    @articles = []
  end

end
