% Template per la presentazione di alcuni risultati di un compito 
% d'esame di Controlli Automatici
%
% Il nome di questo file dovra' contenere il proprio cognome ed il numero
% di matricola nel formato 'Risultati_ca_Cognome_matricola.m'
%
% Nella riga sottostante riportare il proprio Cognome ed il numero di
% matricola separati da un semplice spazio
%
nome=['Tumminelli 274608'];
%
% Nella riga sottostante, riportare il controllore analogico Gc progettato nella
% forma a costanti di tempo, indicando come variabile complessa la 's' e 
% usando i soliti operatori di matlab (* per la moltiplicazione ecc...). 
% Per esempio:
% Gc=50*(1+s/10)*(1+s/40)/(s*(1+s/160)*(1+s/400));
%
s=tf('s');
%
Gc= (3.85e06*s^2-.155e08*s-4.812e08)/(125*s^2+43750*s)  ;
%
% Nella riga sottostante, riportare il valore del periodo di campionamento
% in secondi; 
%
T= 0.005 ;
%
% Nella riga sottostante, riportare il valore della pulsazione di crossover
% di progetto assunta nel progetto: wcdes in rad/s.
%
wcdes= 30;
%
% Nelle righe sottostanti, riportare le prestazioni ottenute, nel
% dominio del tempo. Riportare il valore nullo (cioè "0") nel caso di
% prestazioni non dichiarate. "0" è la risposta di default.
%
% Nella riga sottostante, riportare il tempo di salita (in secondi)
% (specifica (S5))
%
tr=0.05;
%
% Nella riga sottostante, riportare il tempo di assestamento (in secondi)
% (specifica (S6))
%
ts=0.321;
%
% Nella riga sottostante, riportare la sovraelongazione massima, relativa
% percentuale (specifica (S7))
%
sovr=9.9;
%
% Nella riga sottostante, riportare l'ampiezza dell'errore 
% sull'uscita, in regime permanente, a causa del disturbo sinusoidale d_s
% (specifica (S4))
%
e_yds=1.1371e-07;
