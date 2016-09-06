/**
 * Expression handler for "Current page is/is not all/any of the following types: {type list}"
 *
 */
component {

	/**
	 * @expression          true
	 * @expressionContexts  webrequest,page
	 * @pagetypes.fieldType pagetype
	 */
	private boolean function webRequest(
		  required string  pagetypes
		,          boolean _is  =true
	) {
		var currentPageType = payload.page.page_type ?: "";
		var found           = pageTypes.len() && ListFindNoCase( pageTypes, currentPageType );

		return _is ? found : !found;
	}

}