
require_relative '../lib/usecka'
require_relative '../lib/minimalni_pokryti'

# zpracování vstupu a start úlohy
poc_uloh = readline.to_i          # naète poèet úloh
poc_zprac = 0

while(poc_zprac < poc_uloh) do
  radek = readline                # prázdný øádek
  m = readline.to_i               #naètu velikost úseèky
  pole_usecek = [] # prázdné pole
  
  while((radek = readline.chop) != "0 0")do
    data = radek.split(' ')                 # vytvoøí z øetìzce pole, kde oddìlovaè prvkù je mezera
    pole_usecek[pole_usecek.length] = Usecka.new(data[0].to_i, data[1].to_i) # vloží úseèku do pole 
  end
  
  uloha = MinimalniPokryti.new(m, pole_usecek)
  print uloha.dej_reseni                #spustí hledání min. pokrytí a vypíšed výsledek

  poc_zprac +=1                     # zvýším poèet zpracovaných úloh
end
