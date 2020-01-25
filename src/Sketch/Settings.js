"use strict";

var settings = require('sketch/settings');

exports._globalSettingForKey = key => () => settings.globalSettingForKey(key);

exports._setGlobalSettingForKey = key => data => () => settings.setGlobalSettingForKey(key, data || {} );

exports._settingForKey = key => () => settings.settingForKey(key);

exports._setSettingForKey = key => data => () => settings.setSettingForKey(key, data || {} );

exports._sessionVariable = key => () => settings.sessionVariable(key);

exports._setSessionVariable = key => data => () => settings.setSessionVariable(key, data || {} );
