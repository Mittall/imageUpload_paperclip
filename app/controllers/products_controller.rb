class ProductsController < ApplicationController
	#require 'RMagick'
	before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
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
		if @product.save
			redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

  def upload_file 
  @product = Product.new(product_params)
     respond_to do |f|
        if @product.save
					f.html { redirect_to @product, notice: 'Product was successfully updated.' }
          f.json
       else
          f.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
       end
     end
   end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
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
      params.require(:product).permit(:name, :avatar, :resume)
    end
end
