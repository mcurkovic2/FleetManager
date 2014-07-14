package hr.fleetman.common.taglib

class PanelTagLib {
    //static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']
	static namespace = "fm"
	
	/**
	 * NOT FINISHED Displays pklain title enclosed in div element
	 * @attrs title expects message key of title
	 */
	def panelHeader = { attrs, body ->
		out << '<div>'+attrs.title+'</div>'
	}
	
	/**
	 * Renders the bootstrap empty row.
	 */
	def emptyRow = {
		attrs, body ->
		out << '''
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>'''
	}
}
