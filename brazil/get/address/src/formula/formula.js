const clc = require("cli-color")
const axios = require('axios')


function Run(address) {

	axios.get("http://viacep.com.br/ws/"+ address + "/json")
	.then((result) => {
		console.log("Result address for cep: " + address + " is: " + result.toString())
	})
}

const formula = Run
module.exports = formula
