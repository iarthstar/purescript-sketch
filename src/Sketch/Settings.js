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

exports["settingForKey"] = function (key) {
    return function () {
        return settings.settingForKey(key);
    }
}

exports["setSettingForKey"] = function (key) {
    return function (data) {
        return function() {
            settings.setSettingForKey(key, data);
            return {};
        }
    }
}

exports["sessionVariable"] = function (key) {
    return function () {
        return settings.sessionVariable(key);
    }
}

exports["setSessionVariable"] = function (key) {
    return function (data) {
        return function() {
            settings.setSessionVariable(key, data);
            return {};
        }
    }
}