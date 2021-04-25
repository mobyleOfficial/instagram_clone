import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/presentation/common/subscription_holder.dart';
import 'package:rxdart/rxdart.dart';

// Listen to the stream outside the main widget
class EventHandler<T> extends StatefulWidget {
  const EventHandler(
    this.actionStream,
    this.eventsStream, {
    this.child,
  });

  final Stream<T> actionStream;
  final ValueChanged<T> eventsStream;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _EventHandlerState<T>();
}

class _EventHandlerState<T> extends State<EventHandler<T>> with SubscriptionHolder {
  @override
  void initState() {
    super.initState();

    widget.actionStream
        .listen(widget.eventsStream)
        .addTo(subscriptions);
  }

  @override
  Widget build(BuildContext context) => widget.child ?? Container();
}
