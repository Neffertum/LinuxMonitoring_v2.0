#! /bin/bash

answer_code=(200 201 400 401 403 404 500 501 502 503)
methods=("GET" "POST" "PUT" "PATCH" "DELETE")
user_date="$(date +"%F %H:%M:%S")"
user_url=("/code" "/project" "/home" "/log" "/main")
user_agents=("Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0"
            "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:109.0) Gecko/20100101 Firefox/109.0"
            "Opera/9.80 (Windows NT 6.1; WOW64; MRA 8.2 (build 7100)) Presto/2.12.388 Version/12.17"
            "Opera/9.80 (Windows NT 6.2; Win64; x64) Presto/2.12.388 Version/12.17"
            "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/62.0"
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.69"
            "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 YaBrowser/20.9.3.136 Yowser/2.5 Safari/537.36"
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Vivaldi/5.6.2867.62")

function create_log {
my_sec=0
random_count=$(shuf -i 100-1000 -n 1)
for (( i = 0; i < $random_count; i++ )); do
  log_ip="$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1)"
  log_date="[$(date -d "$user_date ${my_sec}"sec"" +"%d/%b/%Y:%H:%M:%S") +0300]"
  ((my_sec++))
  log_method="$(shuf -e -n 1 "${methods[@]}")"
  log_url="$(shuf -e -n 1 "${user_url[@]}")"
  log_code="$(shuf -e -n 1 "${answer_code[@]}")"
  log_size="$(shuf -i 11-999 -n 1)"
  log_agent="$(shuf -e -n 1 "${user_agents[@]}")"
  echo "$log_ip - - ${log_date} \"${log_method} ${log_url} HTTP/1.1\" $log_code $log_size \"-\" \"${log_agent}\"">>$1
done
}

for i in 1 2 3 4 5; do
  touch log_$i.log
  user_date="$(date -d "$user_date 24hour" +"%F %H:%M:%S")"
  create_log log_$i.log
done


#               STATUS CODE SENSE
# 200 OK                    | 201 Created
# 400 Bad Request           | 401 Unauthorized
# 403 Forbidden             | 404 Not Found
# 500 Internal Server Error | 501 Not Implemented
# 502 Bad Gateway           | 503 Service Unavailable