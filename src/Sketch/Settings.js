"use strict";

var settings = require('sketch/settings');

exports._globalSettingForKey = function (key) {
    return function () {
        return settings.globalSettingForKey(key);
    }
}

exports._setGlobalSettingForKey = function (key) {
    return function (data) {
        return function() {
            
            settings.setGlobalSettingForKey(key, data != "undefined" ? data : {} );
            return {};
        }
    }
}

exports._settingForKey = function (key) {
    return function () {
        return settings.settingForKey(key);
    }
}

exports._setSettingForKey = function (key) {
    return function (data) {
        return function() {
            settings.setSettingForKey(key, data != "undefined" ? data : {} );
            return {};
        }
    }
}

exports._sessionVariable = function (key) {
    return function () {
        return settings.sessionVariable(key);
    }
}

exports._setSessionVariable = function (key) {
    return function (data) {
        return function() {
            settings.setSessionVariable(key, data != "undefined" ? data : {} );
            return {};
        }
    }
}