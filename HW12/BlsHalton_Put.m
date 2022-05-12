% BlsHalton_Put.m
function Price = BlsHalton_Put(S0,X,r,T,sigma,NPoints,Base1,Base2)
nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);

% Use Box Muller to generate standard normals
H1 = GetHalton(ceil(NPoints/2),Base1);
H2 = GetHalton(ceil(NPoints/2),Base2);

VLog = sqrt(-2*log(H1));
Norm1 = VLog .* cos(2*pi*H2);
Norm2 = VLog .* sin(2*pi*H2);
Norm = [Norm1 ; Norm2];
%
DiscPayoff = exp(-r*T) * max( 0 , X-S0*exp(nuT+siT*Norm));
Price = mean(DiscPayoff);
end


