
class Usecka
  attr_accessor :pocatek, :konec         # vygeneruje gettry 
  #@@pocet=0                              # t��dn� prom.
  def initialize(pocatek, konec)         # zavol� se p�i tvorb� ob�ktu
    #@@pocet+=1
    #@poradi = @@pocet
    @pocatek = pocatek
    @konec = konec
  end
  
  def to_s   
    "#{@pocatek} #{@konec}"
  end
   
end
