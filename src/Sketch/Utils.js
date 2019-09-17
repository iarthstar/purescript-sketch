"use strict";

var paste = NSPasteboard.generalPasteboard();

exports.copyToPasteboard = function (str) {
    return function () {
        paste.clearContents();
        paste.setString_forType(str, "public.utf8-plain-text");
        return {};
    };
};