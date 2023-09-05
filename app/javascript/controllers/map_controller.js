import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static targets = ["map"]

  static values = {
    apiKey: String,
    markers: Array,
    type: String,
    coordinates: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/cameliaasb/cll0p0q0z009h01pmetfpa29d"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#geolocalisation()


    if (this.typeValue) {
      this.map.on('load', () => {
        this.map.addSource('route', {
          'type': 'geojson',
          'data': {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': this.typeValue,
              'coordinates': this.coordinatesValue
            },
          }
        });
        this.map.addLayer({
          'id': 'route',
          'type': 'line',
          'source': 'route',
          'layout': {
            'line-join': 'round',
            'line-cap': 'round'
          },
          'paint': {
            'line-color': '#FD1015',
            'line-width': 6
          }
        });
      });
    }

  //   this.map.on('load', () => {
  //     this.map.addSource('contours', {
  //       type: 'vector',
  //       url: 'mapbox://cameliaasb.anhs7m1u'
  //     });
  //     this.map.addLayer({
  //       'id': 'cameliaasb.anhs7m1u',
  //       'type': 'fill',
  //       'source': 'cameliaasb.anhs7m1u',
  //       // 'source-layer': 'cameliaasb.anhs7m1u',
  //       'layout': {
  //       // // Make the layer visible by default.
  //       'visibility': 'visible',
  //       // 'line-join': 'round',
  //       // 'line-cap': 'round'
  //       },
  //       // 'paint': {
  //       // 'line-color': '#877b59',
  //       // 'line-width': 2
  //       // }
  //     });
  //   });

  //   this.map.on('idle', () => {
  //     // If these two layers were not added to the map, abort
  //     // if (!this.map.getLayer('contours')) {
  //     //   return;
  //     // }

  //     // Enumerate ids of the layers.
  //     const toggleableLayerIds = ['contours'];

  //     // Set up the corresponding toggle button for each layer.
  //     for (const id of toggleableLayerIds) {
  //       const link = document.getElementById(id)
  //       console.log(link)

  //       // Show or hide layer when the toggle is clicked.
  //       link.onclick = function (e) {
  //         console.log(e.currentTarget);

  //         const clickedLayer = id;
  //         e.preventDefault();
  //         e.stopPropagation();

  //         const visibility = this.map.getLayoutProperty(
  //           clickedLayer,
  //           'visibility'
  //         );

  //       // Toggle layer visibility by changing the layout object's visibility property.
  //         if (visibility === 'visible') {
  //           this.map.setLayoutProperty(clickedLayer, 'visibility', 'none');
  //           this.className = '';
  //         } else {
  //           this.className = 'active';
  //           this.map.setLayoutProperty(
  //             clickedLayer,
  //             'visibility',
  //             'visible'
  //           );
  //         }
  //       };

  //       const layers = document.getElementById('menu');
  //       layers.appendChild(link);
  //     }
  //   });
  }


  #geolocalisation() {
    this.map.addControl(
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true
      })
    );
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({closeButton: false}).setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    if (this.typeValue) {
      const boundsOptions = { padding: 70, maxZoom: 11.5, duration: 0 }
      this.map.fitBounds(bounds, boundsOptions)
    } else {
      const boundsOptions = { padding: 70, maxZoom: 14, duration: 0 }
      this.map.fitBounds(bounds, boundsOptions)
    }
  }

  // updateMarkers(event) {
  //   console.log("update markers")
  //   console.log(event.currentTarget.dataset.type);
  //   console.log(event.currentTarget.dataset.value);
  //   // récupérer la valeur du nouveau filtre

  //   // fetch vers l'index de walks avec le filter, récuperer en json les markers
  //   const url = `/dogs/29/walks?${event.currentTarget.dataset.type}=${event.currentTarget.dataset.value}`

  //   fetch(url)
  //     .then(response => response.json())
  //     .then(data => {
  //       // data.forEach(marker)

  //       console.log(data);
  //     })




  // }




    // mettre à jour la map avec les markers
    // this.map.markers
}
