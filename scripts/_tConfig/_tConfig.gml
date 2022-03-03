// Directory containing JSON files
#macro _T_LANG_DIR "lang"

// String to display when a translation is not found
#macro _T_UNKNOWN_STRING "???"

// Default language
#macro _T_DEFAULT_LANG "english"

// Language to fallback on when translation is unavailable in current language
#macro _T_DEFAULT_FALLBACK_LANG _T_DEFAULT_LANG

function _tInit() {
	global.lang = _T_DEFAULT_LANG;
	global.langJSON = undefined;

	global.langList = ds_list_create();
	var fileName = file_find_first(working_directory + _T_LANG_DIR + "/*.json", 0);

	var lang;
	while (fileName != "") {
		lang = string_copy(fileName, 1, string_pos(".json", fileName)-1);
		show_debug_message("Found language: " + lang);
		ds_list_add(global.langList, lang);
	    fileName = file_find_next();
	}

	// Set fallback language
	_t_setLang(_T_DEFAULT_FALLBACK_LANG);
	global.fallbackLangJSON = global.langJSON;
	global.langJSON = undefined;

	// load default language
	_t_setLang(_T_DEFAULT_LANG);

}