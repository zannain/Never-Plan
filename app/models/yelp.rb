class Yelp < ApplicationRecord
 belongs_to :user

	API_HOST = "https://api.yelp.com"
	SEARCH_PATH = "/v3/businesses/search"
	BUSINESS_PATH = "/v3/businesses/"
	TOKEN_PATH = "/oauth2/token"
	GRANT_TYPE = "client_credentials"		
	CLIENT_ID = "Uj4wStxhDH0vywJ7TnFFog"
	CLIENT_SECRET = "lPWGWvhAFSr0fJR5pTwhkgbhXuqjalHmI7lWAeMB8yNtD5wJ08CT0EqeM2eQHaQu"
	SEARCH_LIMIT = 50 #search limit

  def self.search_path(opts={})
		verify_url = "#{API_HOST}#{TOKEN_PATH}"	 # Put the url together
		verify_params = { # Build our params hash
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      grant_type: GRANT_TYPE
    }
    verified_response = HTTP.post(verify_url, params: verify_params)
    parsed = verified_response.parse
    "#{parsed['token_type']} #{parsed['access_token']}"
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: opts[:term],
      location: opts[:location],
      limit: SEARCH_LIMIT
    }
    response = HTTP.auth("#{parsed['token_type']} #{parsed['access_token']}").get(url, params: params)
    response.parse
end

end

