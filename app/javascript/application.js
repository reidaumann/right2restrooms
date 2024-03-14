// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import mapboxgl from 'https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.js';

mapboxgl.accessToken = '${{ secrets.MAPBOX_API_TOKEN }}';
