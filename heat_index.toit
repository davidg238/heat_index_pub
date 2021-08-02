// Copyright (c) 2021 Ekorau LLC

import gpio.adc as adc
import gpio
import i2c
import bme280
import encoding.json show *

import pubsub
import .hicalculator
import .lipo

main:
 
  bus := i2c.Bus
    --sda=gpio.Pin 21
    --scl=gpio.Pin 22
  // Battery voltage supported on Adafruit Huzzah32 https://learn.adafruit.com/adafruit-huzzah32-esp32-feather/pinouts 
  adc := adc.Adc (gpio.Pin 35)

  device := bus.device 0x77
  bme := bme280.Driver device

  v := adc.get * 2
  
  now := Time.now
  t_c := bme.read_temperature  // in C
  t   := (9*t_c)/5 + 32
  rh  := bme.read_humidity     // in %
  p   := bme.read_pressure/100 // in hPa

  heat_index := HICalculator.index t rh
  rating := HICalculator.rating t rh
  rating_txt := HICalculator.lookup_txt rating
  battery := LiPo.capacityAt v

  message ::= "{\"time\": $now, \"t\": $(t.round), \"rh\": $(rh.round), \"p\": $(p.round), \"hi\": $heat_index, \"rating\": $rating, \"txt\": $rating_txt, \"v\": $(%.3f v), \"batt\": $(%.1f battery)}"
  print message

  map := {
    //"time": Time.now,
    "t": t.round,
    "rh": rh.round,
    "p": p.round,
    "hi": heat_index,
    "rating": rating,
    "txt": rating_txt,
    "v": v,
    "battery": battery,
  }

  topic ::= "cloud:heat_index"
  pubsub.publish topic (encode map)

  bme.close
  adc.close