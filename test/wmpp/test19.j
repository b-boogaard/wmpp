.class public test19
.super java/lang/Object

; default constructor
.method public <init>()V
	aload_0 ; push this
	invokespecial java/lang/Object/<init>()V ; call super
	return
.end method

.method public static main([Ljava/lang/String;)V
begin:
	.limit stack 100
	.limit locals 100
.var 0 is ans F from begin to end
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 1.0
ldc 5.0
ldc 3.7
ldc 7.0
fadd
ldc 0.0
ldc 1.0
fdiv
fmul
ldc 4.0
ldc 1.0
fdiv
ldc 8.0
ldc 800.671
fsub
fsub
fsub
fadd
ldc 311.0
ldc 8.1
fmul
ldc 9.0
fmul
ldc 269.0
ldc 783.0
fadd
ldc 1.0
fdiv
fmul
ldc 1.0
fdiv
fsub
ldc 0.0
ldc 2.6
fmul
ldc 0.0
ldc 1.0
fdiv
fadd
ldc 1.0
fdiv
ldc 0.0
ldc 1.0
fdiv
ldc 8.0
ldc 1.0
fdiv
fadd
ldc 1.7
ldc 2.0
ldc 1.0
fsub
fsub
fmul
fsub
ldc 4.4
ldc 6.3
fsub
ldc 1.0
fdiv
ldc 185.51
ldc 263.0
fadd
ldc 0.0
ldc 1.0
fdiv
fsub
fadd
ldc 344.0
ldc 2.0
ldc 3.8
fadd
ldc 4.9
ldc 0.0
fadd
fmul
fmul
fmul
fsub
fmul
ldc 812.0
fsub
ldc 9.5
ldc 6.0
ldc 3.4
fmul
ldc 0.1
ldc 3.7
fadd
fsub
ldc 1.1
ldc 1.0
fdiv
ldc 7.0
ldc 902.0
fmul
fsub
fadd
ldc 457.0
ldc 8.5
fsub
ldc 1.0
fdiv
ldc 7.9
fadd
fadd
ldc 7.9
fmul
ldc 9.0
fmul
fsub
fmul
fmul
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 2.0
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; terminate main
   return
end:
.end method
