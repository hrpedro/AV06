program movimento
  IMPLICIT NONE
  INTEGER, PARAMETER :: N=10000, J=200
  INTEGER :: I
  REAL :: PI, DT, T, JDT
  REAL, DIMENSION (N+1):: X, V

  ! Variáveis para o temporizador
  INTEGER :: start_clock, end_clock, clock_rate
  REAL :: elapsed_time_ms

  CALL SYSTEM_CLOCK(start_clock, clock_rate)

  ! Inicializações
  PI   = 4*ATAN(1.0)
  DT   = 2*PI/N
  X(1) = 0
  V(1) = 1

  ! Cálculo das posições e velocidades
  DO I = 1, N
    X(I+1) = X(I)+V(I)*DT
    V(I+1) = V(I)-X(I)*DT
  END DO

  ! Impressão dos resultados (opcional — pode remover para não afetar o tempo)
  T = 0
  JDT = J*DT
  DO I = 1, N, J
    WRITE (6,"(3F16.8)") T, X(I), V(I)
    T = T + JDT
  END DO

  CALL SYSTEM_CLOCK(end_clock)

  ! Tempo decorrido em milissegundos
  elapsed_time_ms = REAL(end_clock - start_clock) / REAL(clock_rate) * 1000.0
  PRINT *, 'Execution time (ms): ', elapsed_time_ms

end program movimento
