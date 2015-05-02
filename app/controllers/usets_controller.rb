class UsetsController < ApplicationController
  before_action :set_uset, only: [:show, :edit, :update, :destroy]

  # GET /usets
  # GET /usets.json
  def index
    @usets = Uset.order(:name)
  end

  # GET /usets/1
  # GET /usets/1.json
  def show
  end

  # GET /usets/new
  def new
    @uset = Uset.new
  end

  # GET /usets/1/edit
  def edit
  end

  # POST /usets
  # POST /usets.json
  def create
    @uset = Uset.new(uset_params)

    respond_to do |format|
      if @uset.save
        format.html { redirect_to usets_url, notice: "User #{@uset.name} was successfully created." }
        format.json { render action: 'show', status: :created, location: @uset }
      else
        format.html { render action: 'new' }
        format.json { render json: @uset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usets/1
  # PATCH/PUT /usets/1.json
  def update
    respond_to do |format|
      if @uset.update(uset_params)
        format.html { redirect_to usets_url, notice: "User #{@uset.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usets/1
  # DELETE /usets/1.json
  def destroy
    begin
      @uset.destroy
      flash[:notice] = "User #{@uset.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to usets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uset
      @uset = Uset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uset_params
      params.require(:uset).permit(:name, :password, :password_confirmation)
    end
end
