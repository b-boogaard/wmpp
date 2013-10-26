.class public test0
.super java/lang/Object

; default constructor
.method public <init>()V
	aload_0 ; push this
	invokespecial java/lang/Object/<init>()V ; call super
	return
.end method

.method public static main([Ljava/lang/String;)V
begin:
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 1
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 5
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 3.2
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 0.8
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 2
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 7
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 7
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 3
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   
ldc 8.6
   
   ; invoke println
   invokevirtual java/io/PrintStream/println(F)V
   
   ; terminate main
   return
end:
.end method
