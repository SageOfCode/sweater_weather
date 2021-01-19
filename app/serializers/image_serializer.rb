class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :image_url, :location, :credit
end
