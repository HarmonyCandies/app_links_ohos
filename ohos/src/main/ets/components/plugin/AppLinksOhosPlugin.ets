import {
  AbilityAware,
  AbilityPluginBinding,
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
  NewWantListener,
} from '@ohos/flutter_ohos';
import EventChannel, { EventSink, StreamHandler } from '@ohos/flutter_ohos/src/main/ets/plugin/common/EventChannel';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';

const MESSAGES_CHANNEL = "com.llfbandit.app_links/messages";
const EVENTS_CHANNEL = "com.llfbandit.app_links/events";

/** AppLinksOhosPlugin **/
export default class AppLinksOhosPlugin implements FlutterPlugin, MethodCallHandler, StreamHandler, AbilityAware, NewWantListener {
  private methodChannel: MethodChannel | null = null;
  private eventChannel: EventChannel | null = null;
  private eventSink: EventSink | null = null;
  private binding: AbilityPluginBinding | null = null;
  private initialLink: string | null = null;
  private latestLink: string | null = null;

  getUniqueClassName(): string {
    return "AppLinksOhosPlugin";
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.methodChannel = new MethodChannel(binding.getBinaryMessenger(), MESSAGES_CHANNEL);
    this.methodChannel.setMethodCallHandler(this);

    this.eventChannel = new EventChannel(binding.getBinaryMessenger(), EVENTS_CHANNEL);
    this.eventChannel.setStreamHandler(this);
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    this.methodChannel?.setMethodCallHandler(null);
    this.eventChannel?.setStreamHandler(null);

    this.initialLink = null;
    this.latestLink = null;
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "getLatestAppLink") {
      result.success(this.latestLink);
    } else if (call.method == "getInitialAppLink") {
      result.success(this.initialLink);
    } else {
      result.notImplemented();
    }
  }

  onAttachedToAbility(binding: AbilityPluginBinding): void {
    this.binding = binding;
    this.binding.addOnNewWantListener(this);

    this.handleWant(binding.getAbility().launchWant);
  }

  onDetachedFromAbility(): void {
    this.binding?.removeOnNewWantListener(this);
    this.binding = null;
  }

  onListen(args: ESObject, events: EventSink): void {
    this.eventSink = events;
  }

  onCancel(args: ESObject): void {
    this.eventSink = null;
  }

  onNewWant(want: Want, _: AbilityConstant.LaunchParam): void {
    this.handleWant(want);
  }

  private handleWant(want: Want) {
    if (!want.uri) {
      return;
    }

    if (!this.initialLink) {
      this.initialLink = want.uri;
    }

    this.latestLink = want.uri;

    this.eventSink?.success(want.uri);
  }
}