"use strict";

require("regenerator-runtime/runtime");

var ui = require('sketch/ui');

const doSomethingAsync = async function (message, inputType, cb) {
    var options = {}
    if (inputType.tag == "STRING") {
        options = {
            type: ui.INPUT_TYPE.string,
            initialValue: inputType.contents[0],
            description: inputType.contents[1]
        };
    } else if (inputType.tag == "SELECTION") {
        options = {
            type: ui.INPUT_TYPE.selection,
            possibleValues: inputType.contents[0],
            description: inputType.contents[1]
        };
    }
    if (inputType.contents[2] != null) {
        options.numberOfLines = inputType.contents[2];
    }
    ui.getInputFromUser(message, options, (err, value) => {
        if (err) cb(true, err);
        else cb(false, value);
    });
}

exports.alert = title => helpText => () => {
    ui.alert(title, helpText);
    return {};
};

exports.message = text => () => {
    ui.message(text);
    return {};
};

exports._getTheme = () => ui.getTheme().toUpperCase();

exports._getInputFromUser = message => inputType => (onError, onSuccess) => {
    var cancel = doSomethingAsync(message, inputType, (err, res) => {
        if (err) onError(res);
        else onSuccess(res);
    });
    return (cancelError, onCancelerError, onCancelerSuccess) => {
        cancel();
        onCancelerSuccess();
    }
};