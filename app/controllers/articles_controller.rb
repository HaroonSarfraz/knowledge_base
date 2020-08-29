class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:show]
  before_action :set_sub_categories, only: [:show]
  before_action :set_articles, only: [:show]
  before_action :set_sub_categories_options, only: [:edit, :new]

  def index
    redirect_to categories_path
    return
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :sub_category_id)
    end

    def set_categories
      @categories = Category.all
    end

    def set_sub_categories
      @sub_categories = SubCategory.where(category: @article.sub_category.category)
    end

    def set_articles
      @articles = Article.where(sub_category: @article.sub_category)
    end

    def set_sub_categories_options
      @sub_categories = SubCategory.includes(:category).all.map{ |sub_cat| ["#{sub_cat.category.name} | #{ sub_cat.name}", sub_cat.id] }
    end
end
