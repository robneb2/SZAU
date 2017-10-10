clear;clc;

% Stałe
A2 = 310;
C1 = 0.75;
alfa1 = 16;
alfa2 = 19;

% punkty poczatkowe
%F1 = 51; FD = 7; tau = 150; h2 = 9.3186;
F1_0 = 51;
FD = 7;
tau = 150;
h2_0 = 9.3186;

%% wektory danych
Tp = 1;
czas_symulacji = 8000;
l_iter = czas_symulacji/Tp;
iter_opoznienia = tau/Tp;

h1 = ones(l_iter, 1);
h2 = h2_0 * ones(l_iter, 1);
F1 = F1_0 * ones(l_iter, 1);

%% Symulacja
for k = 1:l_iter
    h1(k+1) =  1/(3*h1(k)*C1)*(F1(k)+FD-alfa1*sqrt(h1(k)));
    h2(k+1) = 1/A2*(alfa1*sqrt(h1(k))-alfa2*sqrt(h2(k)));
    
end