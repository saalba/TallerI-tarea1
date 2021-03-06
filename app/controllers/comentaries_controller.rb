class ComentariesController < ApplicationController
  before_action :set_comentary, only: [:show, :edit, :update, :destroy]

  # GET /comentaries
  # GET /comentaries.json
  def index
    @comentaries = Comentary.all
  end

  # GET /comentaries/1
  # GET /comentaries/1.json
  def show
  end

  # GET /comentaries/new
  def new
    @comentary = Comentary.new
  end

  # GET /comentaries/1/edit
  def edit
  end

  # POST /comentaries
  # POST /comentaries.json
  def create
    @article = Article.where(id: params[:comentary][:article_id]).first()
    @comentary = Comentary.new(article: @article,
                                user: params[:comentary][:user],
                                body: params[:comentary][:body])

    respond_to do |format|
      if @comentary.save
        format.html { redirect_to @article, notice: 'Comentary was successfully created.' }
        format.json { render :show, status: :created, location: @comentary }
      else
        format.html { redirect_to @article, notice: @comentary.errors}
      end
    end
  end

  # PATCH/PUT /comentaries/1
  # PATCH/PUT /comentaries/1.json
  def update
    respond_to do |format|
      if @comentary.update(comentary_params)
        format.html { redirect_to @comentary, notice: 'Comentary was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentary }
      else
        format.html { render :edit }
        format.json { render json: @comentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentaries/1
  # DELETE /comentaries/1.json
  def destroy
    @comentary.destroy
    respond_to do |format|
      format.html { redirect_to comentaries_url, notice: 'Comentary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentary
      @comentary = Comentary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentary_params
      params.require(:comentary).permit(:user, :body)
    end
end
