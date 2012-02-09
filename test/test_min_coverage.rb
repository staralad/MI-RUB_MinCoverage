require 'test/unit'
require_relative '../lib/usecka'
require_relative '../lib/minimalni_pokryti'

class TestMinPokryti < Test::Unit::TestCase
  
  def setup
    #definování spoleèných prostøedkù
      @spolecna_usecka = Usecka.new(0,2)
      @spol_pole = [@spolecna_usecka, Usecka.new(2,8)] 
  end
  
  def teardown
    # zde by bylo uvolòování spoleèných prostøedkù
  end
  
  def test_usecka_vytvoreni
    usecka = Usecka.new(0,2)
    refute_nil(usecka, "Objekt usecka ze tridy Usecka by mel byt vytvoren.")
  end
  
  def test_usecka_nastaveni_parametru
    assert_equal(0, @spolecna_usecka.pocatek)
    assert_equal(2, @spolecna_usecka.konec)
  end
  
  def test_usecka_to_s
    assert_equal("0 2", @spolecna_usecka.to_s)
  end
  
  def test_minimalni_pokryti_vytvoreni
    min_pokryti = MinimalniPokryti.new(10,@spol_pole)
    refute_nil(min_pokryti, "Objekt min_pokryti ze tridy MinimalniPokryti by mel byt vytvoren.")
  end
  
  def test_minimalni_pokryti_zapis_pole
    min_pokryti = MinimalniPokryti.new(10,@spol_pole)
    assert_equal("2\n0 2\n2 8\n\n", min_pokryti.zapis_pole(@spol_pole))
  end
  
  def test_minimalni_pokryti_zadani
    pole = [Usecka.new(-1,0), Usecka.new(-5,-3), Usecka.new(2,5)]
    min_pokryti = MinimalniPokryti.new(1,pole)
    assert_equal("0\n\n", min_pokryti.dej_reseni)
    
    pole = [Usecka.new(-1,0), Usecka.new(0,1)]
    min_pokryti = MinimalniPokryti.new(1,pole)
    assert_equal("1\n0 1\n\n", min_pokryti.dej_reseni)
    
    pole = [Usecka.new(-2,5), Usecka.new(-1,6), Usecka.new(-1,3),Usecka.new(0,4), Usecka.new(1,5), Usecka.new(2,6),Usecka.new(3,7), Usecka.new(7,8), Usecka.new(8,10),Usecka.new(8,9)]
    min_pokryti = MinimalniPokryti.new(10,pole)
    assert_equal("4\n-1 6\n3 7\n7 8\n8 10\n\n", min_pokryti.dej_reseni)
    
    pole = [Usecka.new(-2,5), Usecka.new(-1,6), Usecka.new(-1,3),Usecka.new(0,4), Usecka.new(1,5), Usecka.new(2,6),Usecka.new(3,7), Usecka.new(8,10),Usecka.new(8,9)]
    min_pokryti = MinimalniPokryti.new(10,pole)
    assert_equal("0\n\n", min_pokryti.dej_reseni)
    
    pole = [Usecka.new(2,5), Usecka.new(5,3), Usecka.new(2,3),Usecka.new(2,5)]
    min_pokryti = MinimalniPokryti.new(10,pole)
    assert_equal("0\n\n", min_pokryti.dej_reseni)
    
    pole = [Usecka.new(0,10), Usecka.new(0,10)]
    min_pokryti = MinimalniPokryti.new(10,pole)
    assert_equal("1\n0 10\n\n", min_pokryti.dej_reseni)
    
    pole = [Usecka.new(0,2), Usecka.new(2,4), Usecka.new(4,6), Usecka.new(6,8)]
    min_pokryti = MinimalniPokryti.new(6,pole)
    assert_equal("3\n0 2\n2 4\n4 6\n\n", min_pokryti.dej_reseni)
  end
  
end