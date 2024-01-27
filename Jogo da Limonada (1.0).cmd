@echo off
chcp 65001
mkdir %appdata%\JogoLimonada >nul 2>nul
set version=1.0
set build=45
cls
title Jogo da Limonada (Versão 1.0)
:menu
cls
color f
Echo ╭──────────────────╮
echo │ Jogo da Limonada │
Echo ╰──────────────────╯
echo.
echo S = Começar o jogo:
echo M = Manual:
echo C = Créditos:
echo E = Sair:
echo.
echo Aperte a tecla correspondente:
choice /c SMCE /n >nul
if %errorlevel% EQU 1 goto jogo0
if %errorlevel% EQU 2 goto manual
if %errorlevel% EQU 3 goto creditos
if %errorlevel% EQU 4 goto sair
:sair
cls
color 7
title C:\WINDOWS\System32\cmd.exe
cmd & exit
:creditos
color b
cls
echo.
echo ╭──────────────────────────────────────────────────────────────────────╮
echo │                            Feito por HenMe                           │
echo │                Versão do jogo: %version% (Final, build %build%),                │
echo │                       construído dia 01-07-22.                       │
echo │   Inspirado pelo jogo "Lemonade Stand" de 1979, feito pela Apple.    │
echo │                                                                      │
echo │         'Jogo de Limonada em ".cmd"', Set. 2021 - Jun. 2022          │
echo │                                                                      │
echo │       Aperte qualquer tecla para poder voltar ao menu inicial:       │
echo ╰──────────────────────────────────────────────────────────────────────╯
pause >nul
cls
goto menu
:manual
cls
echo.
Echo ╭──────────────────────────────────────────────────────────────────────╮
echo │                            Manual do jogo                            │
echo │             Aperte a tecla correspondente à sua dúvida:              │
echo │                                                                      │
echo │                          G = Começo do jogo                          │
echo │                      W = Sobre o clima do jogo                       │
echo │                        S = Salvamento do jogo                        │
echo │                                                                      │
echo │                          M = Voltar ao menu                          │
Echo ╰──────────────────────────────────────────────────────────────────────╯
choice /c GWSM /n >nul
if %errorlevel% EQU 1 goto strtgmetuto
if %errorlevel% EQU 2 goto weathertuto
if %errorlevel% EQU 3 goto savegmetuto
if %errorlevel% EQU 4 goto menu
:strtgmetuto
cls
echo.
echo O jogo começa em um dia ensolarado, você tem apenas R$2 na carteira,
echo cada limonada custa 5 centavos, e esse preço sobe com o tempo.
echo.
echo Você escolhe quantas limonadas quer produzir e o preço de cada uma,
echo e no final, você escolhe se quer mudar algo.
echo No final do dia, os resultados finais são revelados.
echo.
echo.
echo Aperte qualquer tecla para voltar ao menu do manual:
pause >nul
cls
goto manual
:weathertuto
cls
echo Existem 3 temperaturas possíveis no dia:
echo Ensolarado, quente, e nublado.
echo.
echo A temperatura também afeta as suas vendas, Ex.: Em um dia nublado,
echo você faz aproximadamente 50% menos vendas que em um dia ensolarado.
echo.
echo.
echo Aperte qualquer tecla para voltar ao menu do manual:
pause >nul
cls
goto manual
:savegmetuto
cls
echo O jogo possui uma forma de salvamento.
echo.
echo Quando chegar à frase "Deseja mudar alguma coisa?", pressione "E"
echo para sair, e salvar o jogo.
echo.
echo O jogo também possui uma forma de converter os saves antigos(1.0 Build 19
echo ou anterior) em saves atuais, e compatíveis.
echo.
echo.
echo Aperte qualquer tecla para voltar ao menu do manual:
pause >nul
cls
goto manual
:jogo0
rem Vê se existe o arquivo "saved.lnmd" nos arquivos do jogo
if not exist %appdata%\JogoLimonada\saved.lmnd (goto jogo)
rem seta o a variável "ifsaved1" com o valor do arquivo "saved.lmnd"(que mostra se o jogo foi salvo ou não)
set /p ifsaved1=<%appdata%\JogoLimonada\saved.lmnd
rem Se o valor da variável(do arquivo "saved.lmnd") for "1", ele vai para a parte "avançada" do jogo, se não, ele vai para o começo do jogo.
if [%ifsaved1%]==[1] (goto jogo1N) else (goto jogo)
:jogo
cls
set /a days=1
set /a newdays=%days%+1
set cents=5
set /a maxfl=40
echo.
echo Dia 1:
color 9e
echo ╭───────────────────────────────────────────────────────────────╮
echo │                 Hoje está um dia ensolarado...                │
echo │                                                               │
echo │                ───              ===                           │
echo │               │===│            =====         ==               │
echo │                ───                          ====              │
echo │                                                               │
echo │                                                               │
echo │===============================================================│
echo ╰───────────────────────────────────────────────────────────────╯
echo.
timeout /t 5 /nobreak >nul
color f
:jogoP
cls
echo.
echo Dia 1:
echo Hoje está um dia ensolarado.
echo Limonada custando %cents% centavos.
echo R$2,00 na carteira.
echo.
echo Máximo de limonadas que poderá produzir: %maxfl% limonadas.
set /p nl1=Insira aqui a quantidade de limonadas que irá produzir:
if %nl1% GTR %maxfl% echo Você não pode gastar mais do que você tem na carteira! & pause & goto jogoP
echo.
set /p ml1=Insira de 1 a 99 (centavos) o valor da limonada:
echo. 
:mudar
echo Deseja mudar alguma coisa? │ Y(Sim) │ N(Não) │
choice /c YN /n >nul
if %errorlevel% EQU 1 goto jogoP
if %errorlevel% EQU 2 goto 14
:14
if %ml1% LSS 5 (set pnl1=100 & goto 14.1)
if %ml1% LSS 10 (set pnl1=95 & goto 14.1)
if %ml1% LSS 15 (set pnl1=80 & goto 14.1)
if %ml1% LSS 20 (set pnl1=65 & goto 14.1)
if %ml1% LSS 30 (set pnl1=50 & goto 14.1)
if %ml1% LSS 40 (set pnl1=40 & goto 14.1)
if %ml1% LSS 50 (set pnl1=31 & goto 14.1)
if %ml1% LSS 75 (set pnl1=9 & goto 14.1)
if %ml1% LSS 100 (set pnl1=4 & goto 14.1)
:14.1
set /a vl=%nl1%*%pnl1%/100
set /a gs=%nl1%*%cents%
set /a vnd=%vl%*%ml1%
set /a lc=%vnd%-%gs%
set /a ctnv=200+%lc%
cls
echo.
echo ─────────────────────────────────────
echo Vendas:                              
echo %vl% limonadas vendidas,             
echo na qual geraram: R$%vnd:~0,-2%,%vnd:~-2%!
echo ─────────────────────────────────────
echo Gastos:                              
echo %nl1% limonadas produzidas,              
echo na qual gastaram: R$%gs:~0,-2%,%gs:~-2%! 
echo ─────────────────────────────────────
echo Lucro do dia %days%: R$%lc:~0,-2%,%lc:~-2%!        
echo Carteira: R$%ctnv:~0,-2%,%ctnv:~-2%! 
echo ─────────────────────────────────────
pause
goto jogo1
:jogo1N
rem ESSA PARTE SERVE PARA CARREGAR OS SAVES E SEREM SETADOS COMO VARIÁVEIS, MAS SE NÃO EXISTIR CERTOS ARQUIVOS DOS SAVES, SUBSTITUIR POR VALORES PADRÃO
if exist %appdata%\JogoLimonada\days.lmnd (set /p newdays=<%appdata%\JogoLimonada\days.lmnd)
if exist %appdata%\JogoLimonada\money.lmnd (set /p ctnv=<%appdata%\JogoLimonada\money.lmnd)
rem #1: A PARTE "SET /A CENTS=%DAYS%/10+5" PODE SER USADA PARA CALCULAR OS CENTAVOS SEM O SAVE
if exist %appdata%\JogoLimonada\weather.lmnd (set /p tipodianum=<%appdata%\JogoLimonada\weather.lmnd) else (set tipodianum=0)
:jogo1
cls
set /a days=%newdays%
set /a newdays=%days%+1
set /a cents=%days%/10+5
set /a maxfl=%ctnv%/%cents%
rem Vê se existe o arquivo "weather.lnmd" nos arquivos do jogo, e pula para a seleção do clima(sem parar pela geração de números)
if exist %appdata%\JogoLimonada\weather.lmnd (goto ifweather)
rem Gera um número aleatória e decide qual o tipo de dia que será.
set /a tipodianum=%RANDOM% * (2 - 0 + 1) / 32768 + 0
:ifweather
if [%tipodianum%] == [0] (set tipodia=ensolarado&goto ensolarado)
if [%tipodianum%] == [1] (set tipodia=quente&goto quente)
if [%tipodianum%] == [2] (set tipodia=nublado&goto nublado)
:ensolarado
echo.
echo Dia %days%:
color 9e
echo ╭───────────────────────────────────────────────────────────────╮
echo │                 Hoje está um dia ensolarado...                │
echo │                                                               │
echo │                ───              ===                           │
echo │               │===│            =====         ==               │
echo │                ───                          ====              │
echo │                                                               │
echo │                                                               │
echo │===============================================================│
echo ╰───────────────────────────────────────────────────────────────╯
echo.
timeout /t 5 /nobreak >nul
color f
goto jogo1R
:quente
echo.
echo Dia %days%:
color 94
echo ╭───────────────────────────────────────────────────────────────╮
echo │                   Hoje está um dia quente...                  │
echo │                                                               │
echo │                ───                                            │
echo │               │===│                                           │
echo │                ───                                            │
echo │                                                               │
echo │                                                               │
echo │===============================================================│
echo ╰───────────────────────────────────────────────────────────────╯
echo.
timeout /t 5 /nobreak >nul
color f
goto jogo1R
:nublado
echo.
echo Dia %days%:
color 17
echo ╭───────────────────────────────────────────────────────────────╮
echo │                  Hoje está um dia nublado...                  │
echo │                                                               │
echo │              ====           ====                              │
echo │             ======        ========             ==             │
echo │                                               ====            │
echo │                                                               │
echo │                                                               │
echo │===============================================================│
echo ╰───────────────────────────────────────────────────────────────╯
echo.
timeout /t 5 /nobreak >nul
color f
goto jogo1R
:jogo1R
cls
echo.
echo Dia %days%:
echo Hoje está um dia %tipodia%.
echo Limonada custando %cents% centavos.
echo R$%ctnv:~0,-2%,%ctnv:~-2% na carteira.
echo.
echo Máximo de limonadas que poderá produzir: %maxfl% limonadas.
set /p nl1=Insira aqui a quantidade de limonadas que irá produzir:
if /i %nl1% GTR %maxfl% echo Você não pode gastar mais do que você tem na carteira! & pause & goto jogo1R
echo.
set /p ml1=Insira de 1 a 99 (centavos) o valor da limonada:
echo.
:mudar1 
echo Deseja mudar alguma coisa? │ Y(Sim) │ N(Não) │ E(Sair e salvar) │
choice /c YNE /n >nul
if %errorlevel% EQU 1 goto jogo1R
if %errorlevel% EQU 2 goto 13
if %errorlevel% EQU 3 goto terminar
:13
rem Vê qual o tipo de dia, e varia o valor das vendas.
if [%tipodianum%] == [1] goto 13Q
if [%tipodianum%] == [2] goto 13N
if %ml1% LSS 10 (set pnl1=95 & goto 13.1)
if %ml1% LSS 20 (set pnl1=65 & goto 13.1)
if %ml1% LSS 40 (set pnl1=40 & goto 13.1)
if %ml1% LSS 50 (set pnl1=31 & goto 13.1)
if %ml1% LSS 51 (set pnl1=12 & goto 13.1)
if %ml1% LSS 100 (set pnl1=4 & goto 13.1)
:13Q
if %ml1% LSS 10 (set pnl1=100 & goto 13.1)
if %ml1% LSS 20 (set pnl1=74 & goto 13.1)
if %ml1% LSS 40 (set pnl1=51 & goto 13.1)
if %ml1% LSS 50 (set pnl1=39 & goto 13.1)
if %ml1% LSS 51 (set pnl1=20 & goto 13.1)
if %ml1% LSS 100 (set pnl1=8 & goto 13.1)
:13N
if %ml1% LSS 10 (set pnl1=43 & goto 13.1)
if %ml1% LSS 20 (set pnl1=31 & goto 13.1)
if %ml1% LSS 40 (set pnl1=25 & goto 13.1)
if %ml1% LSS 50 (set pnl1=14 & goto 13.1)
if %ml1% LSS 51 (set pnl1=9 & goto 13.1)
if %ml1% LSS 100 (set pnl1=1 & goto 13.1)
:13.1
set /a vl=%nl1%*%pnl1%/100
set /a gs=%nl1%*%cents%
set /a vnd=%vl%*%ml1%
set /a lc=%vnd%-%gs%
set /a ctnv=%ctnv%+%lc%
cls
echo.
echo ─────────────────────────────────────
echo Vendas:                              
echo %vl% limonadas vendidas,             
echo na qual geraram: R$%vnd:~0,-2%,%vnd:~-2%!
echo ─────────────────────────────────────
echo Gastos:                              
echo %nl1% limonadas produzidas,              
echo na qual gastaram: R$%gs:~0,-2%,%gs:~-2%! 
echo ─────────────────────────────────────
echo Lucro do dia %days%: R$%lc:~0,-2%,%lc:~-2%!        
echo Carteira: R$%ctnv:~0,-2%,%ctnv:~-2%! 
echo ─────────────────────────────────────
pause
goto jogo1
:terminar
rem Substituição do save antigo com o nome(o save que mostra que está salvo o jogo)
del %appdata%\JogoLimonada\saved.lmnd >nul 2>nul
>%appdata%\JogoLimonada\saved.lmnd echo 1
rem Substituição do save antigo com o nome(o save que mostra o dias do jogo até o usuário parar)
del %appdata%\JogoLimonada\days.lmnd >nul 2>nul
set /a newdaysforecho=%newdays%-1
>%appdata%\JogoLimonada\days.lmnd echo %newdaysforecho%
>>%appdata%\JogoLimonada\days.lmnd echo %version%
>>%appdata%\JogoLimonada\days.lmnd echo %build%
rem Substituição do save antigo com o nome(o save que mostra o dinheiro do jogo até o usuário parar)
del %appdata%\JogoLimonada\money.lmnd >nul 2>nul
>%appdata%\JogoLimonada\money.lmnd echo %ctnv%
>>%appdata%\JogoLimonada\money.lmnd echo %version%
>>%appdata%\JogoLimonada\money.lmnd echo %build%
rem Substituição do save antigo com o nome(o save que mostra o clima do jogo até o usuário parar)
del %appdata%\JogoLimonada\weather.lmnd >nul 2>nul
>%appdata%\JogoLimonada\weather.lmnd echo %tipodianum%
>>%appdata%\JogoLimonada\weather.lmnd echo %version%
>>%appdata%\JogoLimonada\weather.lmnd echo %build%
cls
goto menu