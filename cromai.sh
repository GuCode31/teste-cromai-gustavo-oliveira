#!/bash/bin

FILENAME="pid" #CRIANDO VARIÁVEL FILENAME
ERROR_LOG_FILE="cromai.log"
SCRIPT_PYTHON_NAME="cromai.py" #CRIA VARIÁVEL DE NOME DO ARQUIVO PYTHON
TIME=2 #CRIA VARIAVEL DE TEMPO DE ESPERA
ALIVE="1: It is alive"
DEAD="1: It is dead"

while true; do #INICIA LOOP INFINITO
   
    if [ -f "$FILENAME" ]; then #VERIFICA SE O ARQUIVO EXISTE
       
        PID=$(cat $FILENAME) #REALIZA LEITURA DO ARQUIVO
        
        if ps -p "$PID" > /dev/null 2>&1; then #VERIFICA SE EXISTE UM PROCESSO COM O PID LIDO
            kill --stop $PID > /dev/null 2>&1 #GARANTIR QUE APENAS UM APLICAÇÃO TENHA ACESSO AO TERMINAL
            echo $ALIVE #IMPRIME NA TELA A MENSAGEM ALIVE CASO EXISTA O PROCESSO
            kill --continue $PID > /dev/null 2>&1 #GARANTIR QUE APENAS UM APLICAÇÃO TENHA ACESSO AO TERMINAL
        else
            echo $DEAD #IMPRIME NA TELA A MENSAGEM DEAD CASO NÃO EXISTA O PROCESSO
            
            python3 $SCRIPT_PYTHON_NAME & #EXECUTA O SCRIPT cromai.py
            
            echo $! > $FILENAME #SALVA O ARQUIVO
        fi
    else

        current_datetime=$(date "+%Y-%m-%d %H:%M:%S")
        echo $current_datetime ":" "Arquivo 'pid' não encontrado. Criando um novo processo..." >> $ERROR_LOG_FILE #CASO O ARQUIVO NÃO SEJA ENCONTRADO PRINTA MENSAGEM DE CRIAÇÃO DE NOVO PROCESSO
        
        python3 $SCRIPT_PYTHON_NAME #EXECUTA SCRIPT PYTHON ATÉ FINALIZAR
       
        echo $! > $FILENAME  # SALVA O PID DO NOVO PROCESSO NO ARQUIVO
    fi

    sleep $TIME #AGUARDA "TIME" SEGUNDOS ATÉ PROXIMA INTERAÇÃO
done
