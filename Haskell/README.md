## Instruções para instalação:

* Download do [Haskell](https://www.haskell.org/platform/)
* Download do [Stack](https://docs.haskellstack.org/en/stable/README/)

**Para importar bibliotecas como Data.List.Split e System.IO.Strict com o stack, rode o seguinte no Terminal dentro do diretório do projeto:**

	stack setup
	
	stack init
	
	stack build split

	stack build strict
	
	stack build brick

**Finalmente, para iniciar o BloodLife:**

	stack main.hs
