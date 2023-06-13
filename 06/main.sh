#! /bin/bash

if [[ $# -ne 0 ]]; then
  echo "Please, NO argument"
else
  goaccess ../04/log_*.log -o sort_code_report.html --log-format=COMBINED --sort-panel=STATUS_CODES,BY_DATA,ASC
  goaccess ../04/log_*.log -o uniq_ip_report.html --log-format=COMBINED --sort-panel=VISITORS,BY_VISITORS,ASC
  goaccess ../04/log_*.log -o error_code_report.html --log-format=COMBINED --ignore-status=200 --ignore-status=201
  goaccess ../04/log_*.log -o error_uniq_ip_report.html --log-format=COMBINED --ignore-status=200 --ignore-status=201 \
  --sort-panel=VISITORS,BY_VISITORS,ASC
fi