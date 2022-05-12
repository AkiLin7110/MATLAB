%BlsRandom
function Price = BlsRandom(S0,X,r,T,sigma,NPoints,Base1,Base2)
nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);

% Use Box Muller to generate standard normals
H1 = rand(ceil(NPoints/2),1);
H2 = rand(ceil(NPoints/2),1);

VLog = sqrt(-2*log(H1));
Norm1 = VLog .* cos(2*pi*H2);
Norm2 = VLog .* sin(2*pi*H2);
Norm = [Norm1 ; Norm2];
%
DiscPayoff = exp(-r*T) * max( 0 , S0*exp(nuT+siT*Norm) - X);
Price = mean(DiscPayoff);
end

