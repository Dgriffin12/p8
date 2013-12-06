require 'open-uri'
class ReviewsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]  
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :update_movies, only: [:new, :edit, :update]
  def correct_user
	@review = current_user.reviews.find_by(id: params[:id])
	if @review == nil
		redirect_to root_url, alert: "Invalid User!"
	end
  end

 def update_movies
	movies_page = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/"))
	movies_to_parse = movies_page.css('h4 a') 
	@movies = []
	movies_to_parse.each do |movie|
		@movies.push(movie["title"])
	end
 end

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.search(params[:search])
	if @reviews == nil
		@reviews = Review.all
	end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
	@review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = current_user.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:id, :title, :body, :movie, :user_id)
    end

    def sort_column
      params[:sort] || "movie title"
    end

    def sort_direction
      params[:direction] || "asc"
    end

end
