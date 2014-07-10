package hr.fleetman.common.taglib

class PanelTagLib {
    //static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']
	static namespace = "fm"
	def panelHeader = { attrs, body ->
		out << '<div>'+attrs.title+'</div>'
	}
}
