
require_relative '../lib/usecka'
require_relative '../lib/minimalni_pokryti'

# zpracov�n� vstupu a start �lohy
poc_uloh = readline.to_i          # na�te po�et �loh
poc_zprac = 0

while(poc_zprac < poc_uloh) do
  radek = readline                # pr�zdn� ��dek
  m = readline.to_i               #na�tu velikost �se�ky
  pole_usecek = [] # pr�zdn� pole
  
  while((radek = readline.chop) != "0 0")do
    data = radek.split(' ')                 # vytvo�� z �et�zce pole, kde odd�lova� prvk� je mezera
    pole_usecek[pole_usecek.length] = Usecka.new(data[0].to_i, data[1].to_i) # vlo�� �se�ku do pole 
  end
  
  uloha = MinimalniPokryti.new(m, pole_usecek)
  print uloha.dej_reseni                #spust� hled�n� min. pokryt� a vyp�ed v�sledek

  poc_zprac +=1                     # zv���m po�et zpracovan�ch �loh
end
