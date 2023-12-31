class NewsController < ApplicationController
  before_action :set_news, only: %i[ edit update destroy ]
  before_action :set_my_news, only: %i[ show ]
before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /news or /news.json
  def index
    @news = News.all.mostrecent
    render :show
    Viewnews.create(news_id: @news.id)
    @lastnew=@news.lastnew
    @othernew=@news.othernew(@lastnew)
  end

  # GET /news/1 or /news/1.json
  def show
Viewnews.create(news_id: @news.id)
@lastnew=@news.lastnew
@othernew=@news.othernew(@lastnew)
  end

  # GET /news/new
  def new
    @news = News.new(user_id: current_user.try(:id))
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news or /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_url(@news.title.parameterize), notice: "News was successfully created." }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1 or /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to news_url(@news.title.parameterize), notice: "News was successfully updated." }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1 or /news/1.json
  def destroy
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url, notice: "News was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end
    def set_my_news
      @news = News.findnews(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:title, :user_id, :content, :image)
    end
end
