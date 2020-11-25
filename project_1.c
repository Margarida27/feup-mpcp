/*
 ============================================================================
 Name        : project_1.c
 Author      : Margarida Jorge Cerqueira Vieira
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
extern int SOMA(int a, int b);
extern int F2EX3D(int *v, int dim);
extern int F3EX1A(int *v, int dim);
extern int F3EX1B(int *v, int dim);
extern int F3EX3B(char *a, char b);
extern void F3EX4B(int *v1, long int *v2, int dim);
extern int F3EX5A(long int n);
extern int F3EX5B(char *a);
extern int F3EX5C(int n);
extern int fourxintab(int *vec, int tamv, int a, int b);
extern int CheckRange(int lim, int tam, int *seq);
extern int F3EX7D(int *v1, int *v2, int dim);
extern int F3EX7E(int *v1, int *v2, int dim);
extern unsigned int CountCommon(unsigned int N, int *seqA, unsigned int M, int *seqB);
extern void F4EX4A(char *a);
extern int F4EX4B(char *a);
extern int Calculator(unsigned int N, char *seq_OP, int *seq_B, int *seq_A);
extern int power(int base, int exp);
extern float F5EX2A(float a, float b, float c, float d);
extern double F5EX2B(double raio);
extern double F5EX5(float *X, float *Y, int n);
extern long int F5EX6(float *V, long int n, float a, float b);
extern double F5EX9A(double x);
extern double F5EX9B(double x);
extern void eStep(unsigned int N, float *seq_P , unsigned int M, double *seq_C, unsigned int *seq_Out);
extern void F6EX1A(float *P, float *Q, float *R, int n);
extern void F6EX1B(float *vec, int size, float k);
extern long int F6EX2(int *vec1, int *vec2, int size);
extern long int F6EX3(char *v, long int size, char val);
extern void F6EX4(int *z, int n, int x);
extern double F6EX6(double *v, long int size);
extern void F6EX9(float *Z1, float *Z2, float *Z, long int size);
extern char freqchars(unsigned int N, char *text, char nl, char *lett, float *freq);
extern int t2_ex13_2018_2019(int *seq, int size);
extern char freqchars2(unsigned int N, char *text, char nl, char *lett, float *freq);

int main(void)
{
	/*
	int a = 5;
	int b = 10;
	int ca = 0;
	ca = SOMA(a,b);
	printf("A soma é %d\n", ca);
	*/

//---------- FICHA 2 ----------

//EX 3 D)
	/*
	int v[] = {1, 2, 3, 4};
	int dim = 4;
	int result;
	result = F2EX1D(v, dim);
	printf("O número de pares é %d\n", result);
	*/

//---------- FICHA 3 (EXS ADICIONAIS) ----------

//EX 1 A)
	/*
	int a[] = {3, -1, 8, 0, -3};
	int dimF3EX1A = 5;
	int resF3EX1A;
	resF3EX1A = F3EX1A(a, dimF3EX1A);
	printf("soma dos elementos = %d\n", resF3EX1A);
	*/

//EX 1 B)
	/*
	long int b[] = {3, -1, 8, 0, -3};
	int dimF3EX1B = 5;
	int resF3EX1B;
	resF3EX1B = F3EX1B(b, dimF3EX1B);
	printf("soma dos elementos = %d\n", resF3EX1B);
	*/

//EX 3 B)
	/*
	char frase2[] = "frasedeteste2";
	char caracter = 't';
	int resF3EX3B;
	resF3EX3B = F3EX3B(frase2, caracter);
	printf("Quantos caracteres? %d\n", resF3EX3B);
	*/

//EX 4 B)
	/*
	int dimF3EX4B = 5;
	int v_int[] = {3, -1, 400000, 0, -3};
	long int v_longint = {0, 0, 0, 0, 0};
	F3EX4B(v_int, v_longint, dimF3EX4B);
	printf("##########\n");
	printf("NOVO VETOR\n");
	for(int i = 0; i < dimF3EX4B; i++)
	{
		printf("%d ", v_longint[i]);
	}
	*/

//EX 5 A)
	/*
	long int n = 1024;
	int resF3EX5A;
	resF3EX5A = F3EX5A(n);
	printf("O primeiro 1 está na posição %d\n", resF3EX5A);
	*/

//EX 5 B)
	/*
	char a[] = "aabsbbaa";
	int resF3EX5B;
	resF3EX5B = F3EX5B(a);
	if (resF3EX5B == 0)
		printf("It is not a palindrome.\n");
	else
		printf("It is a palindrome.\n");
	*/

//EX 5 C)
	/*
	int n = 2147483649; //10000000000000000000000000000001
	int resF3EX5C;
	resF3EX5C = F3EX5C(n);
	if (resF3EX5C)
		printf("The binary number is a capicua.\n");
	else
		printf("The binary number is not a capicua.\n");
	*/

//EX 7 D)
	/*
	int dimF3EX7D = 5;
	// int v1[] = {3, -1, 40, 0, -3};
	// int v2[] = {3, -1, 4, 0, 1};
	int v1[] = {-3, -1, -4, 0, -3};
	int v2[] = {3, 1, 4, 0, 1};
	int resF3EX7D;
	resF3EX7D = F3EX7D(v1, v2, dimF3EX7D);
	printf("O produto interno é = %d\n", resF3EX7D);
	*/

//EX 7 E)
	/*
	int dimF3EX7E = 5;
	int v1[] = {3, -1, 40, 0, -3};
	int v2[] = {3, -1, 4, 0, 1};
	int resF3EX7E;
	resF3EX7D = F3EX7D(v1, v2, dimF3EX7E);
	printf("O produto interno é = %d\n", resF3EX7D);
	*/

//---------- FICHA 4 ----------

//EX 4 A)
	/*
	char fraseF4EX4A[] = "Frasedeteste2";
	printf("ANTES: %s\n", fraseF4EX4A);
	F4EX4A(fraseF4EX4A);
	printf("DEPOIS: %s\n", fraseF4EX4A);
	*/

//EX 4 B)
	/*
	char string[] = "[e(){(abc]}]";
	int paired = F4EX4B(string);
	if (paired == 0)
		printf("Os caracteres não estão corretamente emparelhados.");
	else if (paired == 1)
		printf("Os caracteres estão corretamente emparelhados.");
	*/

//---------- FICHA 5 ----------

//EX 2 A)
	/*
	float a = 3.64, b = 2.8, c = 5.12, d = 1.25;
	float resF5EX2A = F5EX2A(a, b, c, d);
	printf("resultado = %f\n", resF5EX2A);
	*/

//EX 2 B)
	/*
	double raio;
	double resF5EX2B = F5EX2B(raio);
	printf("área do círculo = %f\n", resF5EX2B);
	*/

//EX 5
	/*
	int size = 3;
	float x[] = {3.5, 0.9, -2.1};
	float y[] = {4.3, 0.1, 3.7};
	double resF5EX5 = F5EX5(x, y, size);
	printf("produto interno = %f\n", resF5EX5);
	*/

//EX 6
	/*
	float v[]= {40.36, 5.9, 3, 12.93, 13.1, 21.0};
	long int size = 6;
	float lower = 13.2;
	float upper = 84.95;
	long int between = F5EX6(v, size, lower, upper);
	printf("%d números percentem ao intervalo\n", between);
	*/

//EX 9
	/*
	double x;
	double result;
	for(int i = 0; i <= 90; i++)
	{
		x = i;
		result = F5EX9B(x);
		printf("100 + 50 x cos(%d) = %f\n", i, result);
	}
	*/

//---------- FICHA 6 ----------

//EX 1 A)
	/*
	float p[] = { 3.4, 5.3, -1.0, -2.1, 3.4, 5.3, -1.0, -2.1, 3.4, 5.3, -1.0, -2.1, 3.4, 5.3, -1.0, -2.1};
	float q[] = { 1.4, 1.3, 1.0, 1.1, 1.4, 1.3, 1.0, 1.1, 1.4, 1.3, 1.0, 1.1, 1.4, 1.3, 1.0, 1.1};
	float r[] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	int size = 16;
	F6EX1A(p, q, r, size);
	for (int i = 0; i < 16; i++)
	{
		printf("R[%d] = %f\n", i, r[i]);
	}
	*/

//EX 1 B)
	/*
	float vec[] = { 3.4, 5.3, -1.0, -2.1, 3.4, 5.3, -1.0, -2.1, 3.4, 5.3, -1.0, -2.1, 3.4, 5.3, -1.0, -2.1};
	int size = 16;
	float k = 2.0;
	F6EX1B(vec, size, k);
	for(int i = 0; i < 16; i++)
	{
		printf("vec[%d]= %f\n", i, vec[i]);
	}
	*/

//EX 2
	/*
	int vec1[] = { 3, 5, 1, 1, 3, 5, 1, 1, 3, 5, 1, 1, 3, 5, 1, 1};
	int vec2[] = { 2, 3, 1, 1, 2, 3, 1, 1, 2, 3, 1, 1, 2, 3, 1, 1};
	int size = 16;
	long int product = 0;
	product = F6EX2(vec1, vec2, size);
	printf("produto interno = %ld\n", product);
	*/

//EX 3
	/*
	char frase[] = "1margaridavieira";
	long int size = 16;
	char val = 'a';
	long int result = 0;
	result = F6EX3(frase, size, val);
	printf("elementos encontrados = %d\n", result);
	*/

//EX 4
	/*
	int zf[8] __attribute__((aligned(16))) = { 0x7FFFFFFF, 0x80000000, 0x7FFFFF00, 0x7FFFFFF0, 0x8000003, 0x80000009, 0x7FF00000, -3};
	int wf[8] __attribute__((aligned(16))) = { 0x7FFFFFFF, 0x80000000, 0x7FFFFF00, 0x7FFFFFF0, 0x8000003, 0x80000009, 0x7FF00000, -3};
	F6EX4(zf, 8, 32);
	for (int i=0; i<8; i++)
		printf("%d (0x%08X) ", zf[i], zf[i]);
	puts("");
	F6EX4(wf, 8, -32);
	for (int i=0; i<8; i++)
		printf("%d (0x%08X) ", wf[i], wf[i]);
	puts("");
	*/

//EX 6
	/*
	double v[] = { 3.4, 5.3, -1.0, -2.1};
	long int size = 4;
	double result = 0.0;
	result = F6EX6(v, size);
	printf("Norma do vector = %f\n", result);
	*/

//EX 9
	/*
	float Z[] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
	float Z1[] = { 2.0, 5.0, 4.0, 3.0, 6.0, -3.0, 10.0, 10.0 };
	float Z2[] = { 1.0, -2.0, 2.0, 6.0, -3.0, 7.0, 10.0, -10.0};
	long int size = 4;
	F6EX9(Z1, Z2, Z, size);
	for(int i = 0; i < 8; i++)
	{
		printf("R[%d]= %f\n",i, Z[i]);
	}
	*/

//---------- TRABALHOS SEMANAIS ----------

//SEMANA 0
	/*
	int vecint[]= {40, 5, 3, 12, 13, 21};
	int tamvec = 6;
	int inflim2 = 13;
	int suplim2 = 84;
	int fourxintabresult = fourxintab(vecint, tamvec, inflim2, suplim2);
	printf("fourxintabresult = %d\n", fourxintabresult);
	// para este exemplo fourxintabresult = 4
	// P(X): 4 * x ainda está no intervalo [a;b] - unsigned word
	 */

//SEMANA 1
	/*
	int limiar = 20;
	int tamanho = 8;
	int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};
	int res;
	res = CheckRange(limiar, tamanho, ve);
	printf("Foram modificados %d elementos da sequencia ve[].", res);
	*/

//SEMANA 2
	/*
	unsigned int tamA = 8, tamB = 3;
	int vectA[] =  {7, -8, -5, -2, -5, -2, 40, 7};
	int vectB[] = {5, 7, -2};
	unsigned int res;
	res = CountCommon(tamA, vectA, tamB, vectB);
	printf("Número de elementos de vectA[] em vectB[]: %u\n", res);
	*/

//SEMANA 3
	/*
	unsigned int size = 6;
	char vectOP[] = {'-', '+', '+', '-', '-', '+'};
	int vectB[] = {1, 2, 3, 0, 1, -25};
	int vectA[] = {13, 2, 8, 4, 5, 25};
	int execucao = Calculator(size, vectOP, vectB, vectA);
	int i;
	if (execucao)
	{
	    printf("Overflow na operação %d\n", execucao);
	    for (i = 1; i < execucao; i++)
	        printf("elemento %d resultado = %d\n", i, vectA[i-1]);
	}
	else
	{
	    for (i = 1; i <= size; i++)
	        printf("elemento %d resultado = %d\n", i , vectA[i-1]);
	}
	*/

//SEMANA 4
	/*
	unsigned int N = 5, M = 3;
	float seq_P[] = {-3.1, 0, 2.5, -2, 3, 2, 0.5, 1, -5, -1};
	double seq_C[] = {-2, -2, 0, 0, 2, 2};
	unsigned int seq_Out[N];
	eStep(N, seq_P, M, seq_C, seq_Out);
	for (int i = 0; i < N; i++)
	{
		printf("O ponto %d da seq_P (%f, %f) tem como ponto da seq_C mais próximo o ponto de índice %d (%f, %f)\n",
				i, seq_P[i*2], seq_P[i*2 + 1], seq_Out[i], seq_C[seq_Out[i]*2], seq_C[seq_Out[i]*2 + 1]);
	}
	*/

//SEMANA 5
	/*
	unsigned int N = 48;
	char text[] = "A funcao retorna a frequencia absoluta da letra ";
	char nl = 4;
	char lett[] = {'p', 'a', 'u', 'r'};
	float freq[nl];
	char buf[10];
	char res = freqchars(N, text, nl, lett, freq);
	if (nl)
		for(int i = 0; i < nl; i++) {
			gcvt(freq[i], 3, buf); // para contornar o bug do printf ao imprimir floats
			printf("A letra '%c' ocorre em %s%% do texto.\n", lett[i], buf); }
	if (res)
		printf("Das letras pesquisadas no texto, '%c' é a mais frequente.\n", res);
	// neste exemplo, 'freq' deverá conter {0, 18.8, 6.25, 8.33} após a execução da sub-rotina
	// e 'a' é o char mais frequente
	*/

//---------- TESTES E EXAMES ----------
	/*
	int seq[] = {0, 8, 4, 12, 2, 10, 7, 15, 3};
	int size = 9;
	int result = t2_ex13_2018_2019(seq, size);
	printf("maior soma de três elementos consecutivos -> %d", result);
	*/

	//return EXIT_SUCCESS;
}
