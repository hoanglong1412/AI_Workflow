@echo off
rem Usage: build_run.bat [Debug|Release|Both]   (default: Both)
set CFG=%~1
if "%CFG%"=="" set CFG=Both
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build_run.ps1" -Config %CFG%
