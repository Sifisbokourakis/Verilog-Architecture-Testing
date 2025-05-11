module example1(a,b,c,d);
  input a,b,c;
  output d;
  wire a,b,c,d,e,f;
  
  and E1(e,a,b);
  not E2(f,c);
  and E3(d,f,e);
endmodule
