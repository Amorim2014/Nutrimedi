class Orders::OrderItemsController < ApplicationController
  before_action :set_order, except: [:unit_price, :total_price]
  before_action :set_order_item, except: [:new, :create, :unit_price, :total_price]
  
  def unit_price
   #binding.pry
    @unit_price = Product.find(params[:id]).get_price(current_user.costumer_type)
  end

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
    
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new(order_item_params)
    @order_item.order = @order
    @order_item.total_price =  @order_item.valor_total
    
    
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: 'Item incluido com sucesso.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    title = @order_item.product.name

    if @order_item.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @order
    else
      flash[:error] = "There was an error deleting the item."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params[:order_item][:unit_price].gsub!(/[R$.\s]/, '').gsub!(',', '.') if params[:order_item][:unit_price].present?
      params[:order_item][:total_price].gsub!(/[R$.\s]/, '').gsub!(',', '.') if params[:order_item][:total_price].present?
      params.require(:order_item).permit(:product_id, :quantity, :unit_price, :total_price)
    end
end