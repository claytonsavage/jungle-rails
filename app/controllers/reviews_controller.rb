class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to product_path(@review.product_id)
    else
      # redirect_to '/signup'
      redirect_to product_path(@review.product_id)
      # redirect_to :back
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  private 

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end

end
