import 'dart:isolate';

const String scope = 'GetXHome';

const Map strings = {
  '$scope/changeTheme': "Change Theme",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
