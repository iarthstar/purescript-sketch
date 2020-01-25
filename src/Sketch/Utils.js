"use strict";

exports.copyToPasteboard = (str) => () => {
    const paste = NSPasteboard.generalPasteboard();
    paste.clearContents();
    paste.setString_forType(str, "public.utf8-plain-text");
    return {};
};