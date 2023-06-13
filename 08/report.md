## Готовый дашборд

#### Установить готовый дашборд Node Exporter Quickstart and Dashboard с официального сайта Grafana Labs

![Node_Quickstart](Screenshots/Node_Quickstart.png)

#### Провести те же тесты, что и в Части 7

Запустить ваш bash-скрипт из Части 2
Посмотреть на нагрузку жесткого диска

![Node_Shell](Screenshots/Node_Shell.png)

Запустить команду stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s
Посмотреть на нагрузку жесткого диска, оперативной памяти и ЦПУ

![Node_Stress](Screenshots/Node_Stress.png)

#### Запустить ещё одну виртуальную машину, находящуюся в одной сети с текущей

![Ip_R](Screenshots/Ip_R.png)

#### Запустить тест нагрузки сети с помощью утилиты iperf3

![Iperf3_Term](Screenshots/Iperf3_Term.png)

#### Посмотреть на нагрузку сетевого интерфейса

![Iperf3_Grafana](Screenshots/Iperf3_Grafana.png)
