.text
.global Calculator
.type Calculator, "function"
// (unsigned int N, char *seq_OP, int *seq_B, int *seq_A)

// todos os valores usados pela caller (rotina calculator) foram movidos para os registos x19-x28
// porque são os que, de certeza, mantêm o seu valor quando a callee (sub-rotina power) é invocada

Calculator:
	mov x19, x3                // x19 - endereço da sequência A
	mov x20, x2                // x20 - endereço da sequência B
	mov x21, x1                // x21 - endereço da sequência OP
	mov x22, x0                // x22 - número de elementos das sequências A e B
	mov w23, #0                // w23 - guarda a posição (1-N) para retornar no caso de ocorrer overflow

Loop:
	cbz w22, EndNoOverflow      // se chegou ao fim das sequências com sucesso, significa que não ocorreu overflow
	add w23, w23, #1

	ldr w24, [x19]              // w24 - valor de A
	ldr w25, [x20]              // W25 - valor de B
	ldrb w26, [x21], #1         // w26 - operação a realizar
                                // w27 - resultado
	cmp w26, '+'
	b.eq Add
	cmp w26, '-'
	b.eq Sub
	cmp w26, '*'
	b.eq Mult
	cmp w26, 'P'
	b.eq Power

Add:                           // operação de soma: w27 = w24 + w25
	adds w27, w24, w25         // adds atualiza as flags, o que permite verificar se ocorreu overflow
	b.vs EndOverflow           // vs - overflow (flag v = 1)
	b UpdateValues

Sub:                           // operação de subtração: w27 = w24 - w25
	subs w27, w24, w25         // subs atualiza as flags, o que permite verificar se ocorreu overflow
	b.vs EndOverflow           // vs - overflow (flag v = 1)
	b UpdateValues

Mult:                          // operação de multiplicação: w27 = w24 * w25
	smull x27, w24, w25
	cls x28, x27
	cmp x28, #32
	b.lt EndOverflow
	b UpdateValues

Power:                         // operação de potência: w27 = w24 ^ w25
	mov w0, w24                // base da potência
	mov w1, w25                // expoente da potência
	stp x29, x30, [sp, #-16]!  // fp e lr são guardados na pilha
	mov x29, sp
	bl power                   // os argumentos da sub-rotina power têm que estar guardados nos registos w0 e w1 (ints)
	ldp x29, x30, [sp], #16
	mov w27, w0                // a verificação da ocorrência de overflow já é assegurada pela sub-rotina power
	cbz w27, EndOverflow       // no caso de ter ocorrido overflow na operação de potência, a sub-rotina retorna o valor 0
	b UpdateValues

UpdateValues:
	str w27, [x19]             // o resultado da operação é guardado na posição correspondente da sequência A
	add x19, x19, #4           // próxima posição da sequência A
	add x20, x20, #4           // próxima posição da sequência B
	sub x22, x22, #1
	b Loop

EndNoOverflow:                 // no caso de não ocorrer overflow
	mov w0, #0
	ret

EndOverflow:                   // no caso de ocorrer overflow
	mov w0, w23                // retorna a posição na qual ocorreu overflow
	ret


