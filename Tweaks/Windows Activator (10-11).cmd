@echo off
:: Start Powershell Command -ExecutionPolicy Bypass
echo Starting Activation Windows Script...
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"