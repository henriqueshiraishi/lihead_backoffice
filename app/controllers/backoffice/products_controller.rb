class Backoffice::ProductsController < BackofficeController
  before_action :set_product, only: [:edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @product = Product.new( name: params[:'product-name'], version: params[:'product-version'], link: params[:'product-link'], category: params[:'product-category'])
    if @product.save
      # respond_to do |format|
      #   format.js
      # end
      redirect_to backoffice_products_path, notice: "O produto foi cadatrado com sucesso."
    else
      :new
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @product = Product.find(id: params[:'product-id'])
    if @product.update(name: params[:'product-name'], version: params[:'product-version'], link: params[:'product-link'], category: params[:'product-category'])
      redirect_to backoffice_products_path, notice: "O produto foi atualizado com sucesso."
    else
      :edit
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

  def params_product
    params.require(:product).permit(:name, :version, :link, :category)
  end
end
