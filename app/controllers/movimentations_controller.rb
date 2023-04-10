class MovimentationsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @movimentations = get_current_trasactions.filter_for_date(search_date)
    if current_user.present?
      @sources = current_user.sources
      @total_in_month = get_current_trasactions.where(operation: 'in').filter_atual_month_trasactions.sum_value
      @total_out_month = get_current_trasactions.where(operation: 'out').filter_atual_month_trasactions.sum_value
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @movimentation = Movimentation.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @movimentation = Movimentation.new(transaction_params)
    @movimentation.user = current_user

    respond_to do |format|
      if @movimentation.save
        format.html { redirect_to movimentation_url(@movimentation), notice: "movimentation was successfully created." }
        format.json { render :show, status: :created, location: @movimentation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movimentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @movimentation.update(transaction_params)
        format.html { redirect_to movimentation_url(@movimentation), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @movimentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movimentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @movimentation.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @movimentation = Movimentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:movimentation).permit(:operation, :description, :value, :user_id, :source_id, :date_transaction)
    end

    def get_current_trasactions
      current_user.movimentations
    end

    def search_date
      return DateTime.iso8601(params[:search]) if params[:search].present?
      Time.now
    end

    def sum_value
      pluck(:value).sum
    end
end
