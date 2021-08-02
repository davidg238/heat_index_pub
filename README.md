### Background

[Beyond human endurance, How climate change is making parts of the world too hot and humid to survive](https://www.washingtonpost.com/world/interactive/2021/climate-change-humidity/)  

[The emergence of heat and humidity too severe for human tolerance](https://advances.sciencemag.org/content/6/19/eaaw1838/tab-pdf)

## Boards
[Adafruit HUZZAH32 - ESP32 Feather Board](https://www.adafruit.com/product/3405)  
[Adafruit BME280](https://www.adafruit.com/product/2652)

## Connections
| BME280 | HUZZAH32 ESP32 | Description | 
|:-----------------:|:----------------:|:-----------:|
| Vin | 3V  | 3v power from Huzzah |
| 3Vo |     | n/c |
| GND | GND | GND from Huzzah |
| SCK | SCL | I2C clock |
| SDO |     | n/c |
| SDI | 21  | I2C data |
| CS  |     | n/c |

* n/c Not Connected

## References

Toit [Weather Station](https://docs.toit.io/platform/tutorials/starter/weatherstation) example