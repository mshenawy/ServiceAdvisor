class PagesController < ApplicationController

	def welcome
		  if logged_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)
    end
	end

	def about
		@title = 'About US' ; 
		@content = 'This is the about Page ' ;
	end

	def help
  	end

    def contact
    end
end
