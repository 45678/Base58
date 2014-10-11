Base58
======

Add a `<script src="base58.js" charset="UTF-8"></script>` to your web page.
`window.Base58` is defined when the script is executed.

    Base58.encode(new Uint8Array) returns a String
    Base58.decode(String) returns a Uint8Array

`npm install 45678/base58` to add the module to your package.
Require it in your program with `Base58 = require("base58")`.

    Base58.encode(new Buffer) returns a String
    Base58.decode(String) returns a Buffer

Credits
-------
- [Mike Hearn](https://github.com/mikehearn) for original Java implementation.
- [Stefan Thomas](https://github.com/justmoon) for porting to JavaScript.
- [Stephan Pair](https://github.com/gasteve) for buffer improvements.
- [Daniel Cousens](https://github.com/dcousens) for cleanup and merging improvements from bitcoinjs-lib.
- [Jared Deckard](https://github.com/deckar01) for killing `bigi` as a dependency.
- [cryptocoinjs](https://github.com/cryptocoinjs/bs58) for the original package.
- [Js2coffee](http://js2coffee.org/) for conversion to CoffeeScript.
