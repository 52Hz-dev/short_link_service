class UrlsController < ApplicationController
  # POST /encode
  def encode
    # find or create new url with (original & short url)
    url = Url.find_or_create_by(original_url: params[:original_url])

    if url.save
      render json: { short_url: request.base_url + "/" + url.short_code }, status: :created
    else
      render json: { error: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /decode
  def decode
    # find the original code in the database or return not found
    url = Url.find_by_short_code(params[:short_code])

    if url
      render json: { original_url: url.original_url }, status: :ok
    else
      render json: { error: "Short URL not found" }, status: :not_found
    end
  end
end
