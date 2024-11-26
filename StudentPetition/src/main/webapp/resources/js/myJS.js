/**
 * 
 */

let checkBlacnk = function(tag, msg) {
	if(tag.value == '') {
		alert(msg)
		tag.focus()
		return true
	}
	return false
}