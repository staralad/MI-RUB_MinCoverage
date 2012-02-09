require_relative './usecka'

class MinimalniPokryti
  def initialize(m, pole_usecek)
    @m = m
    @pole_usecek = pole_usecek
  end
  
  def dej_reseni
    pocatek_pokryvani = 0 # nejprve poèátek nastavím na poèátek pokrývané úseèky (tj. na 0)
    pole_reseni = []
    vysledek = ""
    
    while(true)do # nekoneèný cyklus
      mezireseni = nil       # nutné vynulovat pøi pøenastavení poèátku
      
      for x in 0...@pole_usecek.length #hledej nejlepší meziøešení v poli úseèek
        if((@pole_usecek[x].pocatek <= pocatek_pokryvani) && (@pole_usecek[x].konec > pocatek_pokryvani))then
          if(mezireseni==nil || (mezireseni.konec < @pole_usecek[x].konec))then   #pokud neex. nìjaké meziøešení nebo je horší
            mezireseni = @pole_usecek[x]  # nastav nové 
            if(mezireseni.konec >= @m)then # je pokryto
              pole_reseni[pole_reseni.length] = mezireseni # mám èást øešení
              vysledek += zapis_pole(pole_reseni)
              return vysledek
            end
          end # pokud existuje a je lepší -> tak ponech
        end    
      end  
      
      if(mezireseni == nil)then # nebylo nalezené vhodné meziøešení
        vysledek += "0\n\n" #nemá øešení
        return vysledek 
      end
      
      pole_reseni[pole_reseni.length] = mezireseni # mám èást øešení  
      pocatek_pokryvani = pole_reseni[pole_reseni.length-1].konec # zmìním poèátek pokrývání a øeším znovu úlohu
    end

  end
  
  def zapis_pole(pole)
    vystup = ""
    vystup += "#{pole.length}\n"
    pole.each_index do |i|
      vystup += "#{pole[i].to_s}\n"
    end
    vystup += "\n"
    return vystup
  end
  
end
