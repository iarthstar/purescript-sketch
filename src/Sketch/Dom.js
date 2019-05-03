"use strict";

var dom = require('sketch/dom');

exports["selection"] = function () {
    return dom.getSelectedDocument().selectedLayers.layers;
};