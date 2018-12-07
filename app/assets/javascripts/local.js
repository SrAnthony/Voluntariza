function initMap2() {

    var lat = document.getElementById('event_latitude').value;
    var lng = document.getElementById('event_longitude').value;

    // if not defined create default position
    if (!lat || !lng){
        lat=-27.104629;
        lng=-52.614600;
        document.getElementById('event_latitude').value = lat;
        document.getElementById('event_longitude').value = lng;
    }

    var myCoords = new google.maps.LatLng(lat, lng);

    var mapOptions = {
    center: myCoords,
    zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('mapouter2'), mapOptions);

    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
    });

    // refresh marker position and recenter map on marker
    function refreshMarker(){
        var lat = document.getElementById('event_latitude').value;
        var lng = document.getElementById('event_longitude').value;
        var myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());
    }

    // when input values change call refreshMarker
    document.getElementById('event_latitude').onchange = refreshMarker;
    document.getElementById('event_longitude').onchange = refreshMarker;

    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('event_latitude').value = newlat;
        document.getElementById('event_longitude').value = newlng;
    });

    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());
    });

}

function initMap() {
  var myLatLng = {
    lat: parseFloat(document.getElementById('event_latitude').innerHTML),
    lng: parseFloat(document.getElementById('event_longitude').innerHTML)
  };

  document.getElementById("event_latitude").style.display = "none";
  document.getElementById("event_longitude").style.display = "none";
  window.onload = function() {
    var lati = parseFloat(document.getElementById('event_latitude').innerHTML);
    var long = parseFloat(document.getElementById('event_longitude').innerHTML);
    myLatLng = {lat: lati, lng: long };
    var center = {lat: lati, lng: long };
    placeMarker(center);
  };

  var map = new google.maps.Map(document.getElementById('mapouter'), {
    zoom: 13,
    center: myLatLng
  });
  var markers = [];
  var infowindow = new google.maps.InfoWindow({maxWidth: 300});

  function geocodeLatLng(location,title,body) {
    var geocoder = new google.maps.Geocoder;
    var input = location;
    var latlngStr = input.split(',', 2);
    var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
    geocoder.geocode({'location': latlng}, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        if (results[1]) {
          var marker = new google.maps.Marker({
            position: latlng,
            map: map
          });
          markers.push(marker);

          marker.addListener('click', function() {
            infowindow.setContent("<h3>" + title + "</h3>" + "<p>" + body + "</p>");
            infowindow.open(map, marker);
          });

        } else {
          window.alert('No results found');
        }
      } else {
        window.alert('Geocoder failed due to: ' + status);
      }
    });
  }
  google.maps.event.addListener(map, 'click', function(event) {
    if(document.getElementById('changes').innerHTML === "yes"){
      if(markers.length == 0){
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();
        document.getElementById('event_latitude').value = lat;
        document.getElementById('event_longitude').value = lng;
        placeMarker(event.latLng);
      } else {
        alert("Já foi adicionada uma localização\nUtilize o botão direito para remover e adicionar outra!");
      }
    }
  });
  google.maps.event.addListener(map, 'rightclick', function(event) {
    if(document.getElementById('changes').innerHTML === "yes"){
      removeLast();
      document.getElementById('event_latitude').value = 0;
      document.getElementById('event_longitude').value = 0;
    }
  });
  function removeLast(location) {
    markers[markers.length-1].setMap(null);
    markers.pop();
  }

  function placeMarker(location) {
    var marker = new google.maps.Marker({
      position: location,
      map: map
    });
    markers.push(marker);
  }

  $(".btn").click(function(){
    if(markers.length == 0){
      alert("É necessário adicionar um marcador para seu evento");
    }
  });
}
