L.mapbox.accessToken = 'pk.eyJ1IjoiYXNhYmFub3ZpYyIsImEiOiJjaXVvNGM4anowMDE2Mm9vZTFvMmJuMHp0In0.JNevwoK-hgiEEW0Bsu26Cw';

var map = L.mapbox.map('map', 'mapbox.streets')
    .setView([40, -74.50], 9)
    .addControl(L.mapbox.geocoderControl('mapbox.places'));

var geocoder = L.mapbox.geocoder('mapbox.places');

geocoder.query('sarajevo', showMap);

function showMap(err, data) {
    // The geocoder can return an area, like a city, or a
    // point, like an address. Here we handle both cases,
    // by fitting the map bounds to an area or zooming to a point.
    if (data.lbounds) {
        map.fitBounds(data.lbounds);
    } else if (data.latlng) {
        map.setView([data.latlng[0], data.latlng[1]], 19);
    }
}


