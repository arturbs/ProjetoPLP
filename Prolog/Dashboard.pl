dashboardIni(A,AM,B,BM,AB,ABM,O,OM,AnoPassado,Agenda,Escala,QtdEnfermeiros,QtdImpedimentos,QtdDoadores,QtdRecebedores):-
    MlAtual is (A+AM+B+BM+AB+ABM+O+OM),
    write("
─────────────────────────────────────────────────────────────────── 𝙳𝚊𝚜𝚑𝚋𝚘𝚊𝚛𝚍 ─────────────────────────────────────────────────────────────────────"), nl,
write("┌──────────────────────────────────────────────────────────────────────┬──┬─────────────────────────────── Estoque ───────────────────────────────┐"),nl,
write("│                                                                      │  "), write("     "),desenhaEstoque(0),nl,
write("│                     _                       _                        │  "), nl,  
write("│                    │_) │  _   _   _│ │  o _│_ _                      │  "), write("     "),desenhaEstoque(1),nl,
write("│                    │_) │ (_) (_) (_│ │_ │  │ (/_                     │  "), nl,                                                                
write("│                                                                      │  "), write("     "),desenhaEstoque(2),nl,                                                              
write("│                                                                      │  "), nl,
write("│                                                                      │  "), write("     "),desenhaEstoque(3),nl,                                                                   
write("└──────────────────────────────────────────────────────────────────────┘  "), nl,                                                               
write("                                                                          "), write("     "),desenhaEstoque(4),nl,                                                                                             
 write("┌──────────────────────── Histórico de Estoque ────────────────────────┐"),  nl,                                      
 write("│                                                                      │"), write("       "),desenhaEstoque(5),nl,                                                                 
format("               Estoque no Ano Passado: ~w mililitros (ml)             ",[AnoPassado]), nl,
 write("                                                                        "),  write("       "),desenhaEstoque(6),nl, 
format("                    Estoque Atual: ~w mililitros (ml)                 ",[MlAtual]), nl,
 write("│                                                                      │"),  write("       "),desenhaEstoque(7),nl, 
 write("└──────────────────────────────────────────────────────────────────────┘  └───────────────────────────────────────────────────────────────────────┘"),  nl,nl,                                                    

    write("─────────────────────────────────────────────────────────────── Agenda para Hoje ──────────────────────────────────────────────────────────────────"),nl,nl,
    write(Agenda), nl, nl,
    write("───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"),nl, nl,
    
    write("─────────────────────────────────────────────────────── Escala de Enfermeiros para Hoje ───────────────────────────────────────────────────────────"),nl,nl,
    write(Escala), nl, nl,
    write("───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"),nl, nl,

    format(    
"──────────────────────────────────────────────────────────── Usuários Cadastrados ─────────────────────────────────────────────────────────────────

┌────────── Enfermeiro(s) ──────────┐┌───────── Impedimento(s) ──────────┐┌─────────── Doadore(s) ────────────┐┌───────── Recebedore(s) ──────────┐
│                                   ││                                   ││                                   ││                                  │
│  ~w  Enfermeiro(s)  Cadastrado(s)  ││ ~w  Impedimento(s)  Cadastrado(s)  ││   ~w  Doadore(s)  Cadastrado(s)    ││ ~w  Recebedore(s)  Cadastrado(s)  │
│                                   ││                                   ││                                   ││                                  │
└───────────────────────────────────┘└───────────────────────────────────┘└───────────────────────────────────┘└──────────────────────────────────┘"
    ,[QtdEnfermeiros,QtdImpedimentos,QtdDoadores,QtdRecebedores]).




desenhaEstoque(IndexTipo):-
    tipos(ListaTipos),
    nth0(IndexTipo,ListaTipos,Tipo), 
    listaEstoque(ListaEstoque),buscaBolsasPorTipo(Tipo,ListaEstoque,0,QtdSomada),
    write(Tipo), (IndexTipo < 6 -> write(" │"); write("│")),
    desenhaBolsa(Tipo,60,QtdSomada),write("|").



desenhaBolsa(_,0,_).
desenhaBolsa(Tipo,Restante,0):- dif(Restante,0),minusOne(Restante,NewRestante),write("-"),desenhaBolsa(Tipo,NewRestante,0).
desenhaBolsa(Tipo,Restante,QtdBolsas):-
    (Restante > 2 ->  write("***"); Restante > 1 -> write("**"),desenhaBolsa(Tipo,0,QtdBolsas); write("*"),desenhaBolsa(Tipo,0,QtdBolsas)),
    minusOne(QtdBolsas,NewQtdBolsas), 
    minusThree(Restante,NewRestante), 
    desenhaBolsa(Tipo,NewRestante,NewQtdBolsas).
    
    
minusOne(Num,NewNum):- NewNum is Num - 1.
minusThree(Num,NewNum):- NewNum is Num - 3.