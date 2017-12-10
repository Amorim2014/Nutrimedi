class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json

  def send_order_mail
    @order = Order.find(params[:id])
    User.where(admin: true).each do |admin|
      AdminMailer.welcome_email(current_user, @order, admin).deliver_now
    end
    flash[:notice] = "O Pedido de N° \"#{@order.id}\" foi enviado com sucesso!"      
    redirect_to orders_path
  end

  def index
    @order = if params[:search]
        #AQUI VOC~E POE A PESQUISA
        if current_user.admin? 
          @orders = Order.all.search(params[:search]).order(id: :desc).page(params[:page])
        else
          @orders = Order.search(params[:search]).where(user: current_user).order(id: :desc).page(params[:page])
        end
    else # DAqui para baixo não tem pesquisa
      if current_user.admin? 
        @orders = Order.all.order(id: :desc).page(params[:page])
      else
        @orders = Order.where(user: current_user).order(id: :desc).page(params[:page])
      end
    end

  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

  end

  # GET /orders/new
  def new
    @order = Order.create(user: current_user)

    redirect_to @order
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Pedido criado com sucesso.' }
        # AdminMailer.welcome_email(current_user, @order).deliver_later
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Pedido atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Pedido excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
     params.require(:order).permit(:user_id, order_items_attributes: [:product_id, :quantity, :unit_price, :total_price])
   end

 end
