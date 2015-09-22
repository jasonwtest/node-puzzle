exports.encrypt = (string, secret = 1) ->
  result = ''
  for char in string
    code = char.charCodeAt(0)
    if code <= 41
      result += char
    else
      result += String.fromCharCode(code - secret)

  return result


exports.decrypt = (string, secret = 1) ->
  de_result = ''
  for char in string
    code = char.charCodeAt(0)
    if code <= 41
      de_result += char
    else
      de_result += String.fromCharCode(code + secret)

  return de_result
