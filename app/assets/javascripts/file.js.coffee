$ ->
	$(document).on("click", ".edit-file", (event) ->

		box = $(this).parents(".file-box")
		id = $(this).attr("id")
		form = $(".file-form[id=" + id + "]")

		if(box.hasClass("active"))
			box.removeClass("active")
			form.hide()
		else
			box.addClass("active")
			form.show()

	)

	$(document).on("click", ".update-file", (event) ->
		box = $(this).parents(".file-box")
		id = $(this).attr("id")
		form = $("form[data-id=" + id + "]")
		form.submit()
	)