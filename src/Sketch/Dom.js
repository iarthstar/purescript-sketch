"use strict";

var dom = require('sketch/dom');

exports["_getDocuments"] = function () {
    return dom.getDocuments();
};

exports["_getSelectedDocument"] = function () {
    return dom.getSelectedDocument();
};

exports["_getSelection"] = function () {
    return dom.getSelectedDocument().selectedLayers.layers;
};

exports["setPropsForLayerID"] = function (id) {
    return function (path) {
        return function (data) {
            return function () {
                var layer = dom.getSelectedDocument().getLayerWithID(id);
                try {
                    eval("layer." + path.join(".") + " = data;");
                } catch (e) {
                        console.log(e.message);
                }
                return {};
            }
        }
    }
}