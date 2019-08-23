"use strict";

require("regenerator-runtime/runtime");

var ui = require('sketch/ui');

const doSomethingAsync = async function(message,inputType, cb) {
    let options = {}
    if (inputType.tag == "STRING"){
        options = {
            type : ui.INPUT_TYPE.string,
            initialValue : inputType.contents[0],
            description : inputType.contents[1]
        };
    } else if (inputType.tag == "SELECTION") {
        options = {
            type : ui.INPUT_TYPE.selection,
            possibleValues : inputType.contents[0],
            description : inputType.contents[1]
        };
    }
    if (inputType.contents[2] != null){
        options.numberOfLines = inputType.contents[2];
    }
    ui.getInputFromUser( message, options, function (err, value) {
        if (err) cb(true, err); 
        else cb(false, value);
    });
}

exports.alert = function (title) {
    return function (helpText) {
        return function () {
            ui.alert(title, helpText);
            return {};
        };
    };
};

exports.message = function (text) {
    return function () {
        ui.message(text);
        return {};
    };
};

exports._getTheme = function () {
    return ui.getTheme().toUpperCase();
};

exports._getInputFromUser = function (message) {
    return function (inputType) {
        return function (onError, onSuccess) {
            let cancel = doSomethingAsync(message, inputType, function (err, res) {
                if (err) {
                    onError(res);
                } else {
                    onSuccess(res);
                }
            });
            return function (cancelError, onCancelerError, onCancelerSuccess) {
                cancel();
                onCancelerSuccess();
            }
        }
    }
}