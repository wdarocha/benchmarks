#!/bin/bash

# ---------------- Configuração ----------------
JOBS=7
CMD_FILE="command.txt"
LOGDIR="logs"
THREADS=1  # Número de threads por processo
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir -p "$LOGDIR"
MASTER_LOG="$LOGDIR/master_$TIMESTAMP.log"
PID_FILE="run_parallel.pid"
# ---------------------------------------------

echo "Iniciando execução paralela com $JOBS jobs e $THREADS threads por processo" | tee "$MASTER_LOG"

# Função para controlar número máximo de processos simultâneos
function limiter() {
    while [ "$(jobs -rp | wc -l)" -ge "$JOBS" ]; do
        sleep 1
    done
}

# Ler e executar os comandos
i=0
grep -vE '^\s*#|^\s*$' "$CMD_FILE" | while read -r CMD; do
    limiter  # Aguarda até ter vaga para mais um processo

    i=$((i+1))
    LOGFILE="$LOGDIR/job_${i}_$TIMESTAMP.log"
    CMD_FILE_LOG="$LOGDIR/job_${i}_$TIMESTAMP.cmd"

    echo "$CMD" > "$CMD_FILE_LOG"

    (
        export MKL_NUM_THREADS=$THREADS
        export OMP_NUM_THREADS=$THREADS
        export GOTO_NUM_THREADS=$THREADS
        echo "[$(date +%T)] Executando: $CMD"
        bash -c "$CMD"
    ) > "$LOGFILE" 2>&1 &

    echo "[$(date +%T)] Job $i iniciado: $CMD" | tee -a "$MASTER_LOG"
done

# Salva o PID do processo pai
echo $$ > "$PID_FILE"

# Espera todos terminarem
wait
echo "[$(date +%T)] Todos os jobs concluídos." | tee -a "$MASTER_LOG"

