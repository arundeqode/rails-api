class ProductsController < SecuredController
	# before_action :authorize_request, only: [:index]

	def index
		products = Product.all
		render json: {products: products, :each_serializer => ProductSerializer}
	end

end
