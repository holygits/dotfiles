class FreedomItemsController < ApplicationController
  before_action :set_freedom_item, only: [:show, :edit, :update, :destroy]

  def index
    @freedom_items = FreedomItem.all
  end

  def show
  end

  def new
    @freedom_item = FreedomItem.new
  end

  def edit
  end

  def create
    @freedom_item = FreedomItem.new(freedom_item_params)

    respond_to do |format|
      if @freedom_item.save
        format.html { redirect_to root_path, notice: 'Freedom item was successfully created.' }
        format.json { render :show, status: :created, location: @freedom_item }
      else
        format.html { render :new }
        format.json { render json: @freedom_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @freedom_item.update(freedom_item_params)
        format.html { redirect_to root_path, notice: 'Freedom item was successfully updated.' }
        format.json { render :show, status: :ok, location: @freedom_item }
      else
        format.html { render :edit }
        format.json { render json: @freedom_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @freedom_item.destroy
    respond_to do |format|
      format.html { redirect_to freedom_items_url, notice: 'Freedom item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freedom_item
      @freedom_item = FreedomItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def freedom_item_params
      params.require(:freedom_item).permit(:name, :amount)
    end
end
