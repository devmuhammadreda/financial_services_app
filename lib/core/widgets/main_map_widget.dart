import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMapWidget extends StatefulWidget {
  const MainMapWidget({
    super.key,
    required this.location,
  });
  final LatLng location;

  @override
  State<MainMapWidget> createState() => _MainMapWidgetState();
}

class _MainMapWidgetState extends State<MainMapWidget>
    with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  late AnimationController _animationController;
  late Animation<double> _zoomAnimation;
  bool _isAnimating = false;

  void addMarker() async {
    double startLatitude = widget.location.latitude;
    double startLongitude = widget.location.longitude;

    String startCoordinatesString = '($startLatitude, $startLongitude)';
    Marker startMarker = Marker(
      markerId: MarkerId(startCoordinatesString),
      position: LatLng(startLatitude, startLongitude),
      infoWindow: InfoWindow(
        title: 'Start $startCoordinatesString',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      markers.add(startMarker);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _startZoomAnimation();
  }

  void _startZoomAnimation() {
    if (_isAnimating) return;
    _isAnimating = true;

    _animationController.forward().then((_) {
      _isAnimating = false;
    });
  }

  void _animateToMarker(double zoom) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: zoom,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    addMarker();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create a tween animation from zoom level 10 to 17
    _zoomAnimation = Tween<double>(begin: 10.0, end: 17.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Add listener to update camera position during animation
    _zoomAnimation.addListener(() {
      _animateToMarker(_zoomAnimation.value);
    });
  }

  @override
  void dispose() {
    markers.clear();
    mapController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: Set<Marker>.from(markers),
      initialCameraPosition: CameraPosition(
        target: widget.location,
        zoom: 10,
      ),
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      scrollGesturesEnabled: false,
      mapType: MapType.normal,
      zoomGesturesEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
    );
  }
}
