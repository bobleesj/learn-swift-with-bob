# C Programming
Program is a latin word for writing in advance.

원시 프로그램은 컴파일 과정을 거쳐야만 실행 가능한 프로그램으로 만들어진다. 프로그래밍 언어는 수천가지가 있다.

Letter등은 1byte로 표현된다. ASCII로 약속되어 있다.

| 데이터 형 | 크기 (byte) | 표현 값의 범위 |
|-----------|-------------|----------------|
| Int       | 4           | -2^31 - 2^31   |
| Double    | 8           | 1.7 x 10^-308  |
| Char      | 1           | -128(-2^7)     |

 - int 4(2)
 - short int 2
 - unsigned int 4(2)
 - unsigned short int 2
 - long 4
 - unsigned long int 4
 - float 4
 - double 4
 - long double 10
 - char, signed char, unsigned char 1



## Header files
| 헤어 파일 | 함수들의 기능 | 정의가 포함된 함수 |
|-----------|-------------|----------------|
| stdio.h   | 표준 입출력           | printf, scanf   |
| ctype.h    | 문자 퍼리           | isalpha, tolower |
| math.h      |  수학, 수치 계산           | sin, log, sqrt |
| string.h | 문자열 처리 | strcpy, strlen |
| stdlib.h | 메모리 관리 유용한 함수 | rand, malloc |
| time.h | 날짜와 시간 | time, asctime |
