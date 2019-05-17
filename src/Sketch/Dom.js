"use strict";

var dom = require('sketch/dom');

exports["_getDocuments"] = function () {
    return dom.getDocuments();
};

exports["_getSelectedDocument"] = function () {
    console.log(dom.getSelectedDocument().pages[0].layers);
    return dom.getSelectedDocument();
};

exports["selection"] = function () {
    return dom.getSelectedDocument().selectedLayers.layers;
};