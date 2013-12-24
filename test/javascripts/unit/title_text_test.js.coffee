module "title text"

for id in ["three", "four", "five", "six"]
  test id, ->
    assertLocalizedTitleText id


assertLocalizedTitleText = (id) ->
  momentFormat = "MMMM D, YYYY h:mma"
  compare = "toString"

  el = document.getElementById id

  ok datetime = el.getAttribute "datetime"
  ok local = el.title

  datetimeParsed = moment datetime
  localParsed = moment local, momentFormat

  ok datetimeParsed.isValid()
  ok localParsed.isValid()
  equal datetimeParsed.toString(), localParsed.toString()
  equal getText(el), "Unchanged contents"
