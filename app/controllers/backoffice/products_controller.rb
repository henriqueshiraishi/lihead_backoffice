class Backoffice::ProductsController < BackofficeController
  before_action :set_product, only: [:edit, :destroy]

  def index
    @products = Product.all
  end

  def create
    if params[:'product-id'].to_i > 0
      @product = Product.find(params[:'product-id'])
      if @product.update(name: params[:'product-name'], version: params[:'product-version'], link: params[:'product-link'], category: params[:'product-category'])
        redirect_to backoffice_products_path, notice: "O produto #{@product.name} foi atualizado com sucesso."
      else
        :edit
      end
    else
      @product = Product.new( name: params[:'product-name-new'], version: params[:'product-version-new'], link: params[:'product-link-new'], category: params[:'product-category-new'])
      if @product.save
        redirect_to backoffice_products_path, notice: "O produto #{@product.name} foi cadatrado com sucesso."
      else
        :index
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def destroy
    product_name = @product.name
    if @product.destroy
      redirect_to backoffice_products_path, notice: "O produto #{product_name} foi deletado com sucesso."
    else
      :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
