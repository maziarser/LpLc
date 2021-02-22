module Xor(a,b,q);
input a,b;    
output q;
    
wire a,b;
wire q,q1,q2,q3;

nand m1(q1,a,b);
nand m2(q2,a,q1);
nand m3(q3,b,q2);

nand o1(q,q2,q3);

endmodule

