Geocoder.configure(
    :api_key => ENV['google_maps'],
    :use_https => true,
    :timeout => 3
)