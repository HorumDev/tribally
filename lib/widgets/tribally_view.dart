import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tribally.dart';

class TriballyView extends StatefulWidget {
  const TriballyView({
    Key? key,
    required this.displayName,
    required this.uid,
    this.avatarUrl = '',
    this.fullscreen = false,
    this.gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
  }) : super(key: key);

  final String displayName;
  final String uid;
  final String avatarUrl;
  final bool fullscreen;

  /// Which gestures should be consumed by the map.
  ///
  /// When this set is empty, the map will only handle pointer events for gestures that
  /// were not claimed by any other gesture recognizer.
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  static const String _viewType = 'tribally';

  @override
  _TriballyViewState createState() => _TriballyViewState();
}

class _TriballyViewState extends State<TriballyView> {
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_isLoading) {
      Tribally.userLogin(
              uid: widget.uid,
              displayName: widget.displayName,
              avatar: widget.avatarUrl)
          .then((value) => setState(() => _isLoading = false));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const CircularProgressIndicator();
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: TriballyView._viewType,
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: _creationParams(),
      );
    } else {
      return UiKitView(
        viewType: TriballyView._viewType,
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: _creationParams(),
      );
    }
  }

  Future<void> _onPlatformViewCreated(int id) async {
    // final controller = await YandexMapController._init(id, this);
    //
    // _controller.complete(controller);
    //
    // if (widget.onMapCreated != null) {
    //   widget.onMapCreated!(controller);
    // }
  }

  Map<String, dynamic> _creationParams() {
    final viewOptions = {
      'displayName': widget.displayName,
      'uid': widget.uid,
      'fullscreen': widget.fullscreen,
      'avatar': widget.avatarUrl
    };

    return {
      'viewOptions': viewOptions,
    };
  }
}
