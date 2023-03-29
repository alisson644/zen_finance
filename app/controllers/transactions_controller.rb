class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    search = params[:search].present? ? DateTime.iso8601(params[:search]): Time.now
    @transactions = get_current_trasactions.where('date_transaction >= :start_date AND date_transaction <= :end_date',
      {:start_date => Time.new(search.year, search.month, search.day) - 3.hours, :end_date => Time.new(search.year, search.month, search.day, 20, 59)})
    @sources = current_user.sources
    @total_in_month = get_current_trasactions.where(operation: 'in').where('date_transaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month).pluck(:value).sum
    @total_out_month = get_current_trasactions.where(operation: 'out').where('date_transaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month).pluck(:value).sum
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:operation, :description, :value, :user_id, :source_id, :date_transaction)
    end

    def get_current_trasactions
      current_user.transactions
    end

    def search_month
      where('date_transaction BETWEEN ? AND ?', Date.today.beginning_of_month, Date.today.end_of_month)
    end

    def sum_value
      pluck(:value).sum
    end
end
