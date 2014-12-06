class LicenseAgreementsController < ApplicationController
  before_action :set_license_agreement, only: [:show, :edit, :update, :destroy]

  # GET /license_agreements
  # GET /license_agreements.json
  def index
    @license_agreements = current_user.license_agreements
  end

  # GET /license_agreements/1
  # GET /license_agreements/1.json
  def show
    @license_agreements_term = @license_agreement.license_agreement_terms.order('sort')
    redirect_to license_agreements_path unless !@license_agreement || @license_agreement.user_id == current_user.id
  end

  # GET /license_agreements/new
  def new
    @license_agreement = LicenseAgreement.new
  end

  # GET /license_agreements/1/edit
  def edit
  end

  # POST /license_agreements
  # POST /license_agreements.json
  def create
    @license_agreement = LicenseAgreement.new(license_agreement_params)

    respond_to do |format|
      if @license_agreement.save
        format.html { redirect_to license_agreements_path, notice: 'License agreement was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /license_agreements/1
  # PATCH/PUT /license_agreements/1.json
  def update
    respond_to do |format|
      if @license_agreement.update(license_agreement_params)
        format.html { redirect_to license_agreements_path, notice: 'License agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @license_agreement }
      else
        format.html { render :edit }
        format.json { render json: @license_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /license_agreements/1
  # DELETE /license_agreements/1.json
  def destroy
    @license_agreement.destroy
    respond_to do |format|
      format.html { redirect_to license_agreements_url, notice: 'License agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license_agreement
      @license_agreement = LicenseAgreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_agreement_params
      la = params.require(:license_agreement).permit(:name, :domain, :user_id,
        license_agreement_terms_attributes: [:id, :code, :text, :sort, :_destroy])
      la[:user_id] = current_user.id
      la
    end
end
