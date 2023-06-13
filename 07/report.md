## Prometheus и Grafana

#### Установить и настроить Prometheus и Grafana на виртуальную машину

Устанавливаем Prometheus как в инстуркции оффициального сайта (https://prometheus.io/docs/prometheus/latest/getting_started/)

Проверяем статус

![Prometheus_Status](Screenshots/Prometheus_Status.png)

Скачиваем Node-Exporter для работы с метриками по инструкции офф сайта (https://prometheus.io/docs/guides/node-exporter/)

![Node_Exporter](Screenshots/Node_Exporter.png)

Устанавливаем Grafana по инструкции с офф сайта (grafana.com/grafana/download)

Проверяем статус

![Grafana_Status](Screenshots/Grafana_Status.png)

#### Получить доступ к веб интерфейсам Prometheus и Grafana с локальной машины

Открываем в браузере страницу localhost:9090

![Prometheus_Web](Screenshots/Prometheus_Web.png)

Открываем в браузере страницу localhost:3000 (log: admin pass:admin)

![Grafana_Web](Screenshots/Grafana_Web.png)

#### Добавить на дашборд Grafana отображение ЦПУ, доступной оперативной памяти, свободное место и кол-во операций ввода/вывода на жестком диске

![Grafana_Graph](Screenshots/Grafana_Graph.png)

#### Запустить ваш bash-скрипт из Части 2

Посмотреть на нагрузку жесткого диска (место на диске и операции чтения/записи)

![Grafana_Shell](Screenshots/Grafana_Shell.png)
![Shell](Screenshots/Shell.png)

#### Установить утилиту stress и запустить команду stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s

Посмотреть на нагрузку жесткого диска, оперативной памяти и ЦПУ

![Grafana_Stress](Screenshots/Grafana_Stress.png)
