"use strict";

var ui = require('sketch/ui');

exports["alert"] = function(title) {
  return function(helpText) {
    return function () {
      ui.alert(title, helpText);
      return {};
    };
  };
};

exports["message"] = function(text) {
  return function() {
    ui.message(text);
    return {};  
  };
};
