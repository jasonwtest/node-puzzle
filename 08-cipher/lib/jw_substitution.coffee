
alphabet0 = 'ᐁᐂᐃᐄᐅᐆᐇᐈᐉᐊᐋᐌᐍᐎᐏᐐᐑᐒᐓ⊟ᐔᐕᐖᐗᐘᐙᐚᐛᐜᐝᐞᐟ⋇⋈⋉⋊⋋⋌⊏⊐'
alphabet1 = 'abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ'


exports.encrypt = (string) ->
  #
  # Here is my solution - from JW TEST
  #
  en_result = ''
  for char in string
    index = alphabet1.indexOf char
    if index is -1
      en_result += char
    else
      en_result += alphabet0[index]


  return en_result
  # End of encryption


exports.decrypt = (string) ->
  result = ''
  for char in string
    index = alphabet0.indexOf char
    if index is -1
      result += char
    else
      result += alphabet1[index]

  return result
