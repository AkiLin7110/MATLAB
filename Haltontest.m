%Haltontest.m
seq=zeros(10,1);
for i=1:10
    seq(i) = Halton(i,2);
end
seq
hseq = GetHalton(10,2)