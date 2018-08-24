.text

.globl calc1
calc1:

	pushq %rbp
	movq %rsp, %rbp
	
	cvtss2sd %xmm1, %xmm1
	
	movsd %xmm0, %xmm10
	
	addsd %xmm1,  %xmm0
	
	subsd %xmm1, %xmm10
	
	mulsd %xmm10, %xmm0
	
	cvtsd2ss %xmm0, %xmm0
	
	leave
	ret
	
	
	
	 
