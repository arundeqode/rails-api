class ProductsController < SecuredController
	skip_before_action :authorize_request, only: [:index]

	def index
		products = Product.all
		if products.present?
			render json: {products: ActiveModel::ArraySerializer.new(products, each_serializer: ProductSerializer)}
		else
			render json: {errors: ["doesn't have any product."]}
		end
	end

	def create
		product = Product.new(product_params)
		if product.save
			render json: product, root: 'product', serializer: ProductSerializer
		else
			render json: {errors: product.errors}
		end
	end

	private

	def product_params
		params.require(:product).permit(:name, :price)
	end

end
