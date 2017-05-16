<html ng-app="app">
<head>
    <META http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="resources/css/ext/bootstrap/bootstrap.css" rel="stylesheet" />
	<link href="resources/css/ext/bootstrap/style.css" rel="stylesheet" />
    <script src="resources/js/ext/ng/angular.min.js"></script>
    <script src="resources/js/ext/ng/appAngular.js"></script>
</head>
<body ng-controller="accountController">
    <div>
    
        <table id="tableBody">
            <td>
                <table cellpadding="0" cellspacing="0" width="700">
                <table cellpadding="0" cellspacing="0" width="700">
                    <tr>
                        <td style="border-right:thin solid" align="left" width="120">
                            <img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//341_0.jpg" height="25">
                        </td>
                        <td style="border-right:thin solid" align="center" valign="bottom" width="80">
                            <font>341-7 </font>
                        </td>
                        <td align="right" valign="bottom">
                            <font><b>Recibo do Sacado</b></font>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                </table>
                <table border="1" cellpadding="0" cellspacing="0" width="700">
                    <tr valign="top">
                        <td colspan="4"> Sacado<br>
                            <font> {{usuario.Nome}}</font>
                        </td>
                        <td>
                            <font> Número do Documento</font><br>
                            <font>
                                <center>01603486</center>
                            </font>
                        </td>
                        <td> Vencimento<br>
                            <font>
                                <center>{{date | date:'dd-MM-yyyy'}}</center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <font> Nosso Número<br></font>
                            <font>
                                <center>986/01603486-0</center>
                            </font>
                        </td>
                        <td>
                            <font> Espécie</font><br>
                            <font>
                                <center>R$</center>
                            </font>
                        </td>
                        <td>
                            <font> Aceite</font><br>
                            <font>
                                <center>N</center>
                            </font>
                        </td>
                        <td>
                            <font> Data do Documento<br></font>
                            <font>
                                <center>{{dateToday | date:'dd-MM-yyyy'}}</center>
                            </font>
                        </td>
                        <td>
                            <font> Carteira</font><br>
                            <font>
                                <center>986</center>
                            </font>
                        </td>
                        <td>
                            <font> 1(=) Valor do Documento</font><br>
                            <font>
                                <center>{{usuario.ValorCompra | currency:"R$ "}}</center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <font> Agência / Código Cedente</font><br>
                            <font>
                                <center>199038364-6</center>
                            </font>
                        </td>
                        <td colspan="2">
                            <font> (+) Mora / Multa</font><br>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                        <td colspan="2">
                            <font> (-) Desconto / Abatimento</font><br>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                        <td>
                            <font> Valor Cobrado</font><br>
                            <font>
                                <center>{{usuario.ValorCompra | currency:"R$ "}}</center>
                            </font>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" width="700">
                    <tr valign="top">
                        <td align="right">Autenticação Mecânica<br><br><br></td>
                    </tr>
                    <tr>
                        <td style="border-bottom:thin dashed" align="right" valign="bottom" width="710">Corte na linha pontilhada</td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="700">
                    <tr>
                        <td style="border-right:thin solid" align="left" width="120">
                            <img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//341_0.jpg" height="25">
                        </td>
                        <td style="border-right:thin solid" align="center" valign="bottom" width="80">
                            <font>341-7 </font>
                        </td>
                        <td style="border-right:thin solid" align="center" valign="bottom">
                            <font>34199.86017 60348.601992
                                <wbr>03836.460000 1 51580000354000</font>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" width="700">
                    <tr valign="top">
                        <td colspan="6" style="border-top:thin solid;border-left:thin solid;border-right:thin solid">
                            <font> Local de Pagamento</font><br>
                            <font> PAGAVEL EM QUALQUER BANCO
                                <wbr>ATE O VENCIMENTO</font>
                        </td>
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> Vencimento</font><br>
                            <font>
                                <center>{{date | date:'dd-MM-yyyy'}}</center>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" style="border-top:thin solid;border-left:thin solid;border-right:thin solid">
                            <font> Cedente</font><br>
                            <font> Canecas Mais Ltda</font>
                        </td>
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> Agência / Código Cedente</font><br>
                            <font>
                                <center>199038364-6</center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="border-top:thin solid;border-left:thin solid">
                            <font> Data do Processamento</font><br>
                            <font>
                                <center>{{dateToday | date:'dd-MM-yyyy'}}</center>
                            </font>
                        </td>
                        <td colspan="2" style="border-top:thin solid;border-left:thin solid">
                            <font> Nº. do Documento</font><br>
                            <font>
                                <center>01603486</center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-left:thin solid">
                            <font> Espécie do Documento</font><br>
                            <font>
                                <center>R$</center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-left:thin solid">
                            <font> Aceite</font><br>
                            <font>
                                <center>N</center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-left:thin solid;border-right:thin solid">
                            <font> Data do Documento<br></font>
                            <font>
                                <center>{{dateToday | date:'dd-MM-yyyy'}}</center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> Nosso Número</font><br>
                            <font>
                                <center>986/01603486-0</center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="border-top:thin solid;border-left:thin solid">
                            <font> Uso do Banco<br></font>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-left:thin solid">
                            <font> Carteira</font><br>
                            <font>
                                <center>986</center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-left:thin solid">
                            <font> Moeda</font><br>
                            <font>
                                <center>REAL</center>
                            </font>
                        </td>
                        <td colspan="3" style="border-top:thin solid;border-left:thin solid;border-right:thin solid">
                            <font> Valor</font><br>
                            <font>
                                <center>{{usuario.ValorCompra | currency: ' R$'}}</center>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> 1(=) Valor do Documento</font><br>
                            <font>
                                <center>{{usuario.ValorCompra | currency: ' R$'}}</center>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" rowspan="5" style="border-top:thin solid;border-left:thin solid;border-right:thin solid" valign="top">
                            <font> Instruções: (Texto de responsabilidade do cedente)</font><br>
                            <font>
                                *** NAO RECEBER APOS O
                                <wbr>VENCIMENTO<br> <br> *** NAO RECEBER VALOR
                                <wbr>INFERIOR AO DO DOCUMENTO<br>
                                <br>
                                <br>
                                <b> </b>
                            </font>
                        </td>
                        <td style="border-top:thin solid;border-right:thin solid" valign="top">
                            <font> 2(-) Desconto / Abatimento</font><br>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> 3(-) Outras Deduções</font><br>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> 4(+) Mora / Multa</font><br>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> 5(+) Outros Acréscimos</font><br>
                            <font>
                                <center> </center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="border-top:thin solid;border-right:thin solid">
                            <font> 6(=) Valor Cobrado</font><br>
                            <font>
                                <center>{{usuario.ValorCompra | currency: ' R$'}}</center>
                            </font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td colspan="7" style="border:thin solid">
                            <font> Sacado</font><br>
                            <font>
                                {{usuario.Nome}}<br> {{usuario.Endereco}} - {{usuario.Cep}} - {{usuario.Cidade}}<br>
                            </font>
                        </td>
                    </tr>
                </table>
            </td>
        </table>
        <table cellpadding="0" cellspacing="0" width="700">
            <tr valign="top">
                <td align="right">
                    <font>Autenticação Mecânica</font>
                    <font> Ficha de Compensação</font>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif" width="1" height="50" border="0">
                    <img
                        src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif" width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif" width="1" height="50" border="0">
                        <img
                            src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif" width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif" width="3" height="50"
                                border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif" width="1"
                                height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="3" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/b.gif"
                                width="1" height="50" border="0"><img src="http://www.cmacomunicacao.com.br//imagepath/ftp_xml//basicas/p.gif"
                                width="1" height="50" border="0">
                </td>
            </tr>
        </table>
    <img src="http://www.cmacomunicacao.com.br//listen/mono_retdata.php?m=53529646&amp;h=cd7c748a01f5a1d8a6a2a71d46eaebd1b2dfa0ea&amp;ml=edward.carvalho@gmail.com"
        width="1" height="1">
        <div class="btn-group btn-group-sm" role="group" aria-label="..."  style="padding: 1.5% 5% 2% 35%; float: left;">
            <a href="index-ecommerce.html" class="btn btn-primary" style="min-width: 148px;">Voltar para Home</a>
        </div>
    </body>
</html>