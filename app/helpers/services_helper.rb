module ServicesHelper
	def getServiceAvgReviews(service)
    	@reviews = Review.where(service_id: service.id).order("created_at DESC")
    	if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
    	end
    	return @avg_review
  	end

  	def getReviewsLength(service)
  		@reviews = Review.where(service_id: service.id)
  		if @reviews.blank?
  			return 0;
  		else
  		 return @reviews.length
  		end
  	end	

  end
