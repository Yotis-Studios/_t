function _deepSearchJSON(json, key) {
	var value = undefined;

	if (json == undefined || json == -1 || key == undefined) return undefined;

	if (json[? key] != undefined) {
		return json[? key];
	}

	var keyLen = string_length(key);
	var char;
	var iKey = "";
	var curMap = json;
	for (var i = 1; i <= keyLen; i++) {
		char = string_char_at(key, i);
		if (char != ".") {
			iKey = iKey + char;
		} 
		if (char == "." || i == keyLen) {
			value = curMap[? iKey];
			if (value == undefined) return value;
			curMap = value;
			iKey = "";
		}
	}


	return value;
}