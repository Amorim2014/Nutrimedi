class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  # GET /products
  # GET /products.json
  def index

    if params[:search]
      @products = Product.search(params[:search]).page(params[:page])
   else
      @products = Product.order(:name).page(params[:page])
    end
      @user = User.where(email: current_user.email).first

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Produto excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # Os valores vem assim R$ 1.245,35 e deve ficar assim para gravar: 1245.35
      params[:product][:store_price].gsub!(/[R$.\s]/, '').gsub!(',', '.') if params[:product][:store_price].present?
      params[:product][:price_one].gsub!(/[R$.\s]/, '').gsub!(',', '.') if params[:product][:price_one].present?
      params[:product][:price_two].gsub!(/[R$.\s]/, '').gsub!(',', '.') if params[:product][:price_two].present?
      params.require(:product).permit(:name, :store_price, :price_one, :price_two, :inactive)
    end 
end
