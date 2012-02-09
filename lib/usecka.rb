
class Usecka
  attr_accessor :pocatek, :konec         # vygeneruje gettry 
  #@@pocet=0                              # tøídní prom.
  def initialize(pocatek, konec)         # zavolá se pøi tvorbì obìktu
    #@@pocet+=1
    #@poradi = @@pocet
    @pocatek = pocatek
    @konec = konec
  end
  
  def to_s   
    "#{@pocatek} #{@konec}"
  end
   
end
