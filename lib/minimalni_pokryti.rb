require_relative './usecka'

class MinimalniPokryti
  def initialize(m, pole_usecek)
    @m = m
    @pole_usecek = pole_usecek
  end
  
  def dej_reseni
    pocatek_pokryvani = 0 # nejprve po��tek nastav�m na po��tek pokr�van� �se�ky (tj. na 0)
    pole_reseni = []
    vysledek = ""
    
    while(true)do # nekone�n� cyklus
      mezireseni = nil       # nutn� vynulovat p�i p�enastaven� po��tku
      
      for x in 0...@pole_usecek.length #hledej nejlep�� mezi�e�en� v poli �se�ek
        if((@pole_usecek[x].pocatek <= pocatek_pokryvani) && (@pole_usecek[x].konec > pocatek_pokryvani))then
          if(mezireseni==nil || (mezireseni.konec < @pole_usecek[x].konec))then   #pokud neex. n�jak� mezi�e�en� nebo je hor��
            mezireseni = @pole_usecek[x]  # nastav nov� 
            if(mezireseni.konec >= @m)then # je pokryto
              pole_reseni[pole_reseni.length] = mezireseni # m�m ��st �e�en�
              vysledek += zapis_pole(pole_reseni)
              return vysledek
            end
          end # pokud existuje a je lep�� -> tak ponech
        end    
      end  
      
      if(mezireseni == nil)then # nebylo nalezen� vhodn� mezi�e�en�
        vysledek += "0\n\n" #nem� �e�en�
        return vysledek 
      end
      
      pole_reseni[pole_reseni.length] = mezireseni # m�m ��st �e�en�  
      pocatek_pokryvani = pole_reseni[pole_reseni.length-1].konec # zm�n�m po��tek pokr�v�n� a �e��m znovu �lohu
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
