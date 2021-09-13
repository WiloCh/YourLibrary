import 'dart:convert';

const _mapStyle = [
  {
    "featureType": "all",
    "elementType": "labels.text.fill",
    "stylers": [
      {"saturation": 36},
      {"color": "#8e8065"},
      {"lightness": 40}
    ]
  },
  {
    "featureType": "all",
    "elementType": "labels.text.stroke",
    "stylers": [
      {"visibility": "on"},
      {"color": "#000000"},
      {"lightness": 16}
    ]
  },
  {
    "featureType": "all",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#443b32"}
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#000000"},
      {"lightness": 17},
      {"weight": 1.2}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "geometry",
    "stylers": [
      {"color": "#565048"},
      {"lightness": "-22"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "geometry.fill",
    "stylers": [
      {"lightness": "45"},
      {"color": "#2e2925"},
      {"saturation": "0"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-100"},
      {"lightness": "-54"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"},
      {"lightness": "0"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {"color": "#2e2925"},
      {"lightness": "5"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-89"},
      {"lightness": "-55"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#8f7a5b"},
      {"lightness": "0"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#8f7a5b"},
      {"lightness": "0"},
      {"weight": 0.2}
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {"color": "#8f7a5b"},
      {"lightness": "0"}
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry",
    "stylers": [
      {"color": "#565048"},
      {"lightness": "0"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {"color": "#443b32"},
      {"lightness": "12"}
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "on"},
      {"saturation": "-100"},
      {"lightness": "-51"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {"color": "#443b32"},
      {"lightness": "15"}
    ]
  }
];

final mapStyle = jsonEncode(_mapStyle);
