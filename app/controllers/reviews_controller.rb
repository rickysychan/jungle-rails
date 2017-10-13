require "pry"

class ReviewsController < ApplicationController
    def create
      
        @review = Review.new(review_params)
        @review.product_id = params[:product_id]
        @review.user = current_user


        if @review.save
            redirect_to :back, notice: 'review created!'
          else
            redirect_to :back, notice: 'You are missing information!'
          end
      end

      def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to :back, notice: 'Review deleted!'
      end

private

def review_params
    params.require(:review).permit(:description, :rating, :product_id)
end 

end
