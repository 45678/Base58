
# Base58 encoding/decoding
# Originally written by Mike Hearn for BitcoinJ
# Copyright (c) 2011 Google Inc
# Ported to JavaScript by Stefan Thomas
# Merged Buffer refactorings from base58-native by Stephen Pair
# Copyright (c) 2013 BitPay Inc

Base58 = (module?.exports) or (window.Base58 = {})

ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

ALPHABET_MAP = {}
i = 0
while i < ALPHABET.length
  ALPHABET_MAP[ALPHABET.charAt(i)] = i
  i++

Base58.encode = (buffer) ->
  return ""  if buffer.length is 0
  i = undefined
  j = undefined
  digits = [0]
  i = 0
  while i < buffer.length
    j = 0
    while j < digits.length
      digits[j] <<= 8
      j++
    digits[0] += buffer[i]
    carry = 0
    j = 0
    while j < digits.length
      digits[j] += carry
      carry = (digits[j] / 58) | 0
      digits[j] %= 58
      ++j
    while carry
      digits.push carry % 58
      carry = (carry / 58) | 0
    i++

  # deal with leading zeros
  i = 0
  while buffer[i] is 0 and i < buffer.length - 1
    digits.push 0
    i++
  digits.reverse().map((digit) ->
    ALPHABET[digit]
  ).join ""

Base58.decode = (string) ->
  return []  if string.length is 0
  i = undefined
  j = undefined
  bytes = [0]
  i = 0
  while i < string.length
    c = string[i]
    throw new Error("Non-base58 character")  unless c of ALPHABET_MAP
    j = 0
    while j < bytes.length
      bytes[j] *= 58
      j++
    bytes[0] += ALPHABET_MAP[c]
    carry = 0
    j = 0
    while j < bytes.length
      bytes[j] += carry
      carry = bytes[j] >> 8
      bytes[j] &= 0xff
      ++j
    while carry
      bytes.push carry & 0xff
      carry >>= 8
    i++

  # deal with leading zeros
  i = 0
  while string[i] is "1" and i < string.length - 1
    bytes.push 0
    i++
  bytes.reverse()
