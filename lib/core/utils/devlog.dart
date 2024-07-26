import 'dart:developer' as dev;

void devlog(String msg, {String? name}) {
  dev.log("--> --> -->  $msg", name: name ?? " LOG ");
}

void devlogError(String error) {
  dev.log("==> ==> ==> * $error", name: " ERROR ");
}

void devlogApi(String msg) {
  dev.log(" == == == >>> $msg", name: "[ API LOG ]");
}