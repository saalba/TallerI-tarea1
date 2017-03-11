class HomeController < ApplicationController
  def index
    @articles = Article.last(10).reverse
  end
end
