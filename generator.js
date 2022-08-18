#!/usr/bin/env node

var defaults = {
    "ownable": { "wrap": {owner: "0x1", address: "0x2"} },
    "timelock": {"wrap": {unlock_time: 1111}}
};

function merge_json_objects(call, name, json_in) {
    var new_object = structuredClone(json_in);

    if (typeof defaults[name] !== "undefined" && call !== "") {
        if (typeof (defaults[name])[call] !== "undefined") {
            var default_object = structuredClone((defaults[name])[call]);
            new_object = {...new_object, ...default_object};
        }
    }

    for (o in new_object) {
        if (typeof new_object[o] === "object") {
            new_object[o] = merge_json_objects(call, o, new_object[o]);
        }
    }

    return new_object;
}

function generate_call(name, call, json_in) {
    var generated_call = "";

    // Check if object is empty (https://stackoverflow.com/a/32108184/7455119)
    if (json_in && Object.keys(json_in).length === 0 && Object.getPrototypeOf(json_in) === Object.prototype) {
        return name;
    }

    if (name !== "") {
        generated_call = "TaoHe::" + name + "::" + call + "(";
    }

    var first_argument = true;
    for (o in json_in) {
        if (first_argument) {
            first_argument = false;
        } else {
            generated_call += ", ";
        }

        if (typeof json_in[o] === "object") {
            generated_call += generate_call(o, call, json_in[o]);
        } else {
            generated_call += json_in[o];
        }
    }

    if (name !== "") {
        generated_call += ")";
    }

    return generated_call;
}

function generate_script(script_type, json_in) {
    var generated_script = "";
    var json_out = merge_json_objects(script_type, "", json_in);

    generated_script += "script { fun " + script_type + "(account: signer) {";

    generated_script += "TaoHe::root::create(&account, " + generate_call("", script_type, json_out) + ");";

    generated_script += "}}";

    return generated_script;
}

// This is run if used as a CLI tool:
/////////////////////////////////////////////////////////

// Reading from piped input
var fs = require("fs");
const { json } = require("stream/consumers");
var input = process.stdin.fd; // Stdin if no file provided
if (process.argv.length > 2) {
    input = process.argv[2];
}
var stdinBuffer = fs.readFileSync(input);

var json_in = JSON.parse(stdinBuffer.toString());

var generated_wrap = generate_script("wrap", json_in);
//var generated_unwrap = generate_script("unwrap", json_in);

console.log(generated_wrap);
//console.log(generated_unwrap);