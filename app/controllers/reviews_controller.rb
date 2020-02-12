class ReviewsController < ApplicationController
    # methods run before a controller action
    # before halts the request cycle
    # find_review is a method which will always call before show, edit, update, destroy
    before_action :find_review, only: [:show, :edit, :update, :destroy]

    # update_review is a method which will always call before show, edit, update, destroy
    before_action :update_review, only: [:edit]

    def index
        @reviews = Review.all
    end

    def show
    end

    def new
        @review = Review.new
    end

    def edit
    end

    def create
        @review = Review.create(review_params)
        @review.user_id = current_user.id 
        if @review.save
            redirect_to @review
        else
            # If the review is invalid, hold on to @review, because it is now full of
            # useful error messages, and re-render the :new page, which knows how
            # to display them alongside the user's entries.
            render :new 
        end
    end

    def update
        if @review.update(review_params)
            redirect_to @review
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        flash[:danger] = "This review has been permanently deleted."
        redirect_to user_path(current_user.id)
    end

    private
    
    # tells Rails which parameters are allowed to be submitted
    # through the form to the database
    def review_params
      params.require(:review).permit(:content, :book_id)
    end

    def find_review
        @review = Review.find(params[:id])
    end

    def update_review
      unless logged_in? && current_user[:id] == @review.user_id
        flash[:danger] =  "So sorry, you are not allowed to edit this review."
        redirect_to user_path
      end
    end
end
