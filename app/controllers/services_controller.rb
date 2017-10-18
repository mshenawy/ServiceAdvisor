class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  
  def index
     search = params[:search].present? ? params[:search] : nil
    @services = if search
      # Service.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
      # Service.search(search, where: { year: { gt: 2000 } })
      Service.search(search)
    else
     @services= Service.all
    end
  end

  def show
    @reviews = Review.where(service_id: @service.id).order("created_at DESC")
    if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
    end
  end


  # GET /services/new
  def new
    @service = current_user.services.build
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = current_user.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:title, :description, :rating, :image)
    end

    def correct_user
      @service = current_user.services.find_by(id: params[:id])
      redirect_to root_url if @service.nil?
    end

    def caluclateReviews
    end
end
