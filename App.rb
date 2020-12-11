require_relative "tradutor"

### Informacoes sobre as linguagens oferecidas para a traducao ###
puts ("### Tradutor ###")
puts ("### Idiomas disponiveis ###")
puts ("### PtBr -- Português Brasileiro ###")
puts ("### EnUs -- Inglês (Estados Unidos/Internacional) ###")
puts ("### ZhCh -- Chinês (Simples) ###")
puts ("### DeAl -- Alemáo ###")

### Informa a frase que gostaria de traduzir e a armazena na variavel frase ###
print ("Informe a frase que deseja traduzir: ")
frase = gets.chomp.to_s

### Informa o idioma que ela esta escrita e armazena na variavel ori ###
print ("Informe o idioma que a frase esta escrita: ")
ori = gets.chomp.to_s

###Informa o idioma que gostaria de traduzir a frase e o armazena em tra ###
print("Informe o idioma que gostaria de traduzir a frase: ")
tra = gets.chomp.to_s

### armazena Tradutor em tradutor ###
tradutor = Tradutor.new

### armazena o metodo de traduzir em traducao ###
resultado = tradutor.traduzir(frase, ori, tra)

### Mostra o resultado final do programa ###
puts resultado
