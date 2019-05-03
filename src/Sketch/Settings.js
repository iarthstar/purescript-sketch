"use strict";

var settings = require('sketch/settings');

exports["globalSettingForKey"] = function (key) {
    return function () {
        return settings.globalSettingForKey(key);
    }
}

exports["setGlobalSettingForKey"] = function (key) {
    return function (data) {
        return function() {
            settings.setGlobalSettingForKey(key, data);
            return {};
        }
    }
}