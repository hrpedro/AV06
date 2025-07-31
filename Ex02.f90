!Fisica Computacional - 2018.2 
!Prof: Pedro Alves da Silva Autreto


!Exemplo: Movimento de uma partícula em 1-d
!         sob acao de forca elastica (f(x)=-kx). Metodo de Euler.

program movimento
  IMPLICIT NONE
  INTEGER, PARAMETER :: N=10000, J=200
  INTEGER :: I
  REAL :: PI, DT, T, JDT
  REAL, DIMENSION (N+1):: X, V
!
! Determina o intervalo de tempo (dt) e posicao e velocidade iniciais
!
  PI   = 4*ATAN(1.0)
  DT   = 2*PI/N
  X(1) = 0
  V(1) = 1
!
! Calcula posicao e velocidade recursivamente
!
  DO I = 1, N
    X(I+1) = X(I)+V(I)*DT
    V(I+1) = V(I)-X(I)*DT
  END DO
!
! Escreve o resultado a cada j intervalo de tempo
!
  T = 0
  JDT = J*DT
  DO I = 1, N, J
    WRITE (6,"(3F16.8)") T, X(I), V(I)
    T = T + JDT
  END DO
!
end program movimento
