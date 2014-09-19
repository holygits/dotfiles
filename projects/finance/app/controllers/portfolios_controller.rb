class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def show
    @p = @portfolio

    @goal = Goal.find(1)
    @p.income = Win.sum(:amount)
    @p.expense_total = Expense.sum(:cost)
    @left_overs = @p.income - @p.expense_total

    # Pretty print values.
    @forecast = ((@goal.price / (@p.savings_rate * @left_overs * 2)).ceil).to_s + " weeks"
    @weekly_value = "$" + (@p.savings_rate * @left_overs).to_s + " per week"
    @rate = "(" + (@p.savings_rate * 100).to_s + "%)"

    # freedom items
    @allocated = FreedomItem.sum(:amount)
    @remaining = "$" + (@left_overs - @allocated - (@p.savings_rate * @left_overs)).to_s

  end

  def new
    @portfolio = Portfolio.new
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params[:name]
    end
end
