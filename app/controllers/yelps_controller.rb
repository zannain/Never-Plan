class YelpsController < ApplicationController
  def index
    @user = current_user
    @yelps = @user.yelps
  end

  def new
    @yelp = Yelp.new
  end

  def create
    @yelp = current_user.yelps.build(yelp_params)
    if @yelp.save
      redirect_to search_path
    end

  end

  
  def search
    if params
       opts = {
        term: params[:term],
        location: params[:location]
     }  
     @response = Yelp.search_path(opts)
      end
    end

    def destroy
      Yelp.find(des_params).destroy
      redirect_to user_yelps_path
    end


    private
    def yelp_params
      params.require(:result).permit(:phone,:address,:name, :price, :image,:review_count)
    end
    def des_params
      params.require(:yelp_id)
    end
end
  


