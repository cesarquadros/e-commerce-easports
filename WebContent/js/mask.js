jQuery(function($){
   $(".telefone").mask("(99)9999-99999");
   $(".cpf").mask("999.999.999-99");
   $(".cep").mask("99999-999");
   $(".estado").mask("aa");
   $(".cartao").mask("9999999999999999");
   $(".codseguranca").mask("999");
   $(".validadecartao").mask("99/9999");
   $('.money').mask('999.999.999,99', {reverse: true});
});