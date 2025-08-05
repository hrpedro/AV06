// Fisica Computacional - 2018.2 
// Prof. Pedro Alves da Silva Autreto

// Exemplo: Movimento de uma particula em 1-D 
// // sob acao de forca elastica (f(x) = -kx). Metodo de Euler.
//
public class Movimento {
    static final int n = 10000, j = 200;
    public static void main(String argv[]) {
        long startTime = System.nanoTime(); // Início da contagem do tempo

        double x[] = new double[n+1];
        double v[] = new double[n+1];
        //
        // Determina o intervalo de tempo (dt) e posicao e velocidade iniciais 
        double dt = 2*Math.PI/n;
        x[0] = 0;
        v[0] = 1;

        // Calcula posicao e velocidade recursivamente
        for (int i=0; i<n; ++i) {
            x[i+1] = x[i]+v[i]*dt;
            v[i+1] = v[i]-x[i]*dt;
        }

        // Escreve o resultado a cada j intervalo de tempo
        double t = 0;
        double jdt = j*dt;
        for (int i=0; i<=n; i+=j) {
            System.out.println(t +" " + x[i] + " " + v[i]);
            t += jdt;
        }

        long endTime = System.nanoTime(); // Fim da contagem do tempo
        double elapsedTime = (endTime - startTime) / 1e6; // tempo em milissegundos
        System.out.println("Tempo de execução: " + elapsedTime + " ms");
    }
}