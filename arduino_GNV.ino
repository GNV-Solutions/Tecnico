int PinA0 = A0; //PINO UTILIZADO PELO SENSOR MQ-2
int leitura_sensor = 200; //DEFININDO UM VALOR LIMITE (NÍVEL de GÁS NORMAL 0 - 1023)

void setup() {
pinMode(PinA0, INPUT); //DEFINE O PINO DE ENTRADA
Serial.begin(9600); //INICIALIZA O SERIAL(INICIAR A COMUNICAÇÂO COM O PC)

}

void loop() {
int valor_analogico = analogRead(PinA0); //VARIÁVEL RECEBE O VALOR LIDO NO PINO ANALÓGICO
float tensao = (float)valor_analogico * 5.0 / 1023.0; // CONVERTER O VALOR ANALOGICO EM TEMPERATURA
float temperaturaC = tensao * 100.0; // TRANSFORMAR A TEMPERATURA EM PORCENTAGEM
 int percentualGases = map(temperaturaC, 0, 1023, 0, 255); // Mapeamento para a escala de 0-100%
  percentualGases = constrain(percentualGases, 0, 100); // Limita a percentagem entre 0 e 100%
  Serial.print("Leitura: "); //EXIBE O TEXTO NO MONITOR SERIAL
  Serial.print(percentualGases); //MOSTRA NO MONITOR SERIAL O VALOR LIDO DO PINO ANALÓGICO
  Serial.println("%");
  delay(100); //INTERVALO DE 100 MILISSEGUNDOS 
}
  