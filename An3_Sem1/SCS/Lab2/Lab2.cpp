#include <iostream>
#define rdtsc __asm __emit 0fh __asm __emit 031h
#define cpuid __asm __emit 0fh __asm __emit 0a2h
unsigned cycles_high1 = 0, cycles_low1 = 0, cupid_time = 0;
unsigned cycles_high2 = 0, cycles_low2 = 0;
unsigned __int64 temp_cycles1 = 0, temp_cycles2 = 0;
__int64 total_cycles = 0;
unsigned cpuid_time = 0;
int main() {
	//compute the CPUID overhead
	__asm {
		pushad
		CPUID
		RDTSC
		mov cycles_high1, edx
		mov cycles_low1, eax
		popad
		pushad
		CPUID
		RDTSC
		popad
		pushad
		CPUID
		RDTSC
		mov cycles_high1, edx
		mov cycles_low1, eax
		popad
		pushad
		CPUID
		RDTSC
		popad
		pushad
		CPUID
		RDTSC
		mov cycles_high1, edx
		mov cycles_low1, eax
		popad
		pushad
		CPUID
		RDTSC
		sub eax, cycles_low1
		mov cupid_time, eax
		popad
	}
	cycles_high1 = 0;
	cycles_low1 = 0;
	//Measure the code sequence
	__asm {
		pushad
		CPUID
		RDTSC
		mov cycles_high1, edx
		mov cycles_low1, eax
		popad
	}
	//Section of code to be 
	int a = 10, b = 20;
	for (size_t i = 0; i < 10; i++)
	{
		__asm {
			//ADD variable
			//add ebx, b

			// ADD register
			//add ebx, ecx

			// MUL
			//mul cx

			// FSUB 
			//fsub a

			// FDIV
			//fdiv a
		}
	}
	// static
	//int v[] = { 1,2,3,4,5,6,7,8,9,10 };

	//dynamic
	//int* v = (int*)malloc(10 * sizeof(int));
	__asm {
		pushad
		CPUID
		RDTSC
		mov cycles_high2, edx
		mov cycles_low2, eax
		popad
	}
	temp_cycles1 = ((unsigned __int64)cycles_high1 << 32) | cycles_low1;
	temp_cycles2 = ((unsigned __int64)cycles_high2 << 32) | cycles_low2;
	total_cycles = temp_cycles2 - temp_cycles1 - cpuid_time;
	std::cout << total_cycles / 10;
}