clear;clc;

% Sta³e
A2 = 310;
C1 = 0.75;
alfa1 = 16;
alfa2 = 19;
tau=150;

% punkty poczatkowe
F1_0 = 51;
FD = 7;
h2_0 = 9.3186;

%Okres prób.
Tp = 1;

%% wektory danych
czas_symulacji = 1000;
l_iter = czas_symulacji/Tp;
% iter_opoznienia = opoznienie/Tp;
h2 = h2_0 * ones(l_iter, 1);
h1 = ones(l_iter, 1);
% F1 = F1_0 * ones(l_iter, 1);
F1=[zeros(tau+1,1)' (F1_0.*ones(l_iter-tau,1))'];
F1=F1';
%% Symulacja (z opoznieniem sterowania F1)
for k = 1:l_iter
%     h1(k+1) =  1/(3*h1(k)*C1)*(F1(k)+FD-alfa1*sqrt(h1(k)));
%     h2(k+1) = 1/A2*(alfa1*sqrt(h1(k))-alfa2*sqrt(h2(k)));

    h1(k+1) = h1(k) + (Tp/C1*(F1(k)+FD-alfa1*sqrt(h1(k))))^1/3;
    h2(k+1) = h2(k) + Tp/A2*(alfa1*sqrt(h1(k))-alfa2*sqrt(h2(k)));
    
end
%% rysowanie wykresów
% F1=[F1_0; F1];
czas=0:Tp:czas_symulacji;
figure
stairs(czas,h2);
ylabel('Wysokosc'); xlabel('czas');
figure
stairs(czas,F1);
ylabel('Sterowanie F1'); xlabel('czas');




