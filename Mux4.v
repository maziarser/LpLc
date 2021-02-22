module Mux4(a,b,c,d,s1,s2,q);
input a,b,c,d;
input s1,s2;  
   
output q;
    
wire a,b,c,d;
wire s1,s2;
wire q,q1,q2,q3,q4;

nand n1(notS1,s1);
nand n2(notS2,s2);

nand m1(q1,notS1,notS2,a);
nand m2(q2,notS1,s2,b);
nand m3(q3,s1,notS2,c);
nand m4(q4,s1,s2,d);

nand o1(q, q1, q2, q3, q4);

endmodule