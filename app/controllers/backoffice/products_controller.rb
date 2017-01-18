class Backoffice::ProductsController < BackofficeController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    if @product.save
      redirect_to backoffice_products_path, notice: "O produto #{@product.name} foi cadastrado com sucesso."
    else
      :new
    end
  end

  def edit
  end

  def update
    if @product.update(params_product)
      redirect_to backoffice_products_path, notice: "O produto #{@product.name} foi atualizado com sucesso."
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
