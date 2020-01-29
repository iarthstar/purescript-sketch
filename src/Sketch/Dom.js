"use strict";

var dom = require('sketch/dom');

exports._getDocuments = () => dom.getDocuments();

exports._getSelectedDocument = () => dom.getSelectedDocument();

exports._getSelection = () => dom.getSelectedDocument().selectedLayers.layers;

exports._getLayerWithID = id => () => dom.getLayerWithID(id);

exports._setPropsForLayer = ({ id }) => path => data => () => {
    var layer = dom.getSelectedDocument().getLayerWithID(id);
    try {
        eval("layer." + path.join(".") + " = data;");
    } catch (e) {
        console.log(e.message);
    }
    return {};
}
