### IDEX на прошивке <a href="https://www.reprapfirmware.org/">RepRap</a>
Рабочая конфигурация для сборки (или переделки) 3д принтара с двумя головами на кинематике Markforged

Репозиторий создан в дополнение к данному <a href="https://youtu.be/QxSq5uRTmJw/">ВИДЕО</a> на канале <a href="https://www.youtube.com/c/%D0%A3%D0%B3%D0%BE%D0%BB%D0%BE%D0%BA%D1%82%D0%B5%D1%85%D0%BD%D0%B0%D1%80%D1%8F">Уголок Технаря</a>

### ЖЕЛЕЗО
* Конфиг собран для работы на плате управления <a href="https://alii.pub/6imgx4/">Octopus Pro</a> с контроллером STMF429

### ЗАМЕЧАНИЯ ПО НАСТРОЙКЕ ПРОШИВКИ
* Правильная работа гарантирована с версией прошивки  3.4.0beta6_1 (2021-11-06), найти и скачать можно <a href="https://github.com/gloomyandy/RepRapFirmware/releases">ЗДЕСЬ</a>
* Просьба учесть, что на оси X, Y, U  задействованы драйвера TMC5160, остальные TMC2209. Работа по SPI и UART настраивается в файле <a href="https://github.com/Technarrus/RepRap_IDEX/blob/main/sys/board.txt">boards.txt</a>
* Подробное описание по установке и настройке прошивки: https://teamgloomy.github.io/

###НЕ НАСТРОЕНО




```
serial: /dev/ttyS3
```

это вариант подключения по uart с Orange Pi 3 LTS, при подключении по USB содержимое должно быть другим.
И разделы вывода температуры так же возможно придется поменять:
```[temperature_sensor orange_pi]
sensor_type: temperature_host
min_temp: 10
max_temp: 100
```
```[temperature_sensor mcu_temp]
sensor_type: temperature_mcu
min_temp: 0
max_temp: 100
```
Если прошивка будет ругаться на них, просто удалите или закомментируйте их.

### КАК НАСТРОИТЬ КОНФИГ КОМПИЛЯЦИИ ПРОШИВКИ ДЛЯ ПЛАТЫ УПРАВЛЕНИЯ
![Настройка конфига компиляции](https://github.com/Technarrus/Klipper_FBG6/blob/main/menu_config.jpg)

### INPUT SHAPING
Я не калибровал значения которые находятся в конфиге, они не мои, но они прекрасно справляются с эхо на швах и углах. Это не правильно, советую провести калибровку индивидуально! Если не используете стоковый экран, руководствуйтесь этой статьей - https://fdmprint.ru/2022/11/02/podkljuchenie-adxl345-akselerometr-i-orange-pi-3-lts/

Если стоковый экран задействован, этой - https://github.com/Tombraider2006/klipperFB6/tree/main/adxl345_2_mcu

### РЕСУРСЫ И СТАТЬИ КОТОРЫЕ ВАМ ПОМОГУТ
* Много полезного по FlyingBear Ghost6 в репозиториях товарища Том Томича: https://github.com/Tombraider2006
* Общие пояснения о прошивке и установке на хосты: https://klipper.wiki/
* Установка прошивки Klipper и прочие инструкции по настройкам полезного на сайте Кирилла OxyGena: https://fdmprint.ru/category/poleznoe/klipper/
* Подключение стокового экрана MKS к хосту и вывод на него KlipperScreen: https://sergey1560.github.io/fb4s_howto/mks_ts35/

### Связь
Вопросы, обсуждения, предложения через следующие сообщества:
* [Telegram группа](https://t.me/technarr)
* [Группа в VK](https://vk.com/technarrus)
