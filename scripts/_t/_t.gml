function _t(key){	
	var langStr = _deepSearchJSON(global.langJSON, key);

	if (langStr == undefined) {
		langStr = _deepSearchJSON(global.fallbackLangJSON, key);
	}

	return langStr == undefined ? _T_UNKNOWN_STRING : langStr;
}

function _t_setLang(lang) {
	var filename = _T_LANG_DIR + "/" + lang + ".json";
	var _file = file_text_open_read(filename);
	var json = "";
	if (_file != -1) {
		while (!file_text_eof(_file)) {
			json += file_text_readln(_file);
		}
		file_text_close(_file);

		global.lang = lang;
		if (global.langJSON != undefined) {
			ds_map_destroy(global.langJSON);
		}
		global.langJSON = json_decode(json);
	
		return true;
	} else {
		return false;
	}
}

function _t_getLangIndex(lang) {	
	for (var i = 0; i < ds_list_size(global.langList); i++) {
		if (lang == global.langList[| i]) return i;
	}

	return 0;
}