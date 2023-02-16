module Response
  DEFAULT_PER_PAGE = 20
  DEFAULT_PAGE = 1
  include Pagy::Backend

  def response_success(data = {}, options = {})
    render({ json: data, status: :ok, **options })
  end

  def response_list(data, options = {})
    default_options = { adapter: :json, meta: meta_data }
    response_success(data, options.merge(default_options))
  end

  def response_error(error = {}, status = :unprocessable_entity)
    render json: error, status: status
  end

  def response_not_found(message = "Not found")
    render json: { message: message }, status: :not_found
  end

  def meta_data
    {
      total: @pagy.count,
      page: @pagy.page,
      from: @pagy.from,
      to: @pagy.to,
      pages: @pagy.pages,
      perpage: @pagy.in
    }
  end
end
