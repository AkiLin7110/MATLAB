function lattice  = SimplifiedTree(S0,N)
step = 1/sqrt(N+7);
lattice = ones(N+1,N+1)*S0;

%first column 歸零
for i= 2:N+1
    lattice(i,1) = 0; 
end

for j = 2:1:N+1
    %遞加
   for i = 1:j-1
       lattice(i,j) = lattice(i,j-1)+step;
   end
   %對角遞減
   lattice(j,j) = lattice(j-1,j-1)-step;
   
    for i = j+1:N+1
        lattice(i,j) = 0;
    end
end