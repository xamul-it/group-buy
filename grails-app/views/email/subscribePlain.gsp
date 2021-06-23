<%@ page contentType="text/plain;charset=UTF-8"%>
<%
	def groupName = toGroup.name
	if(!groupName.toLowerCase().contains('gruppo')) {
		groupName = "Gruppo "+groupName
	}
%>

Ciao ${userEmail.encodeAsRaw()}

${groupName}

Stai entrando a far parte del gruppo, guarda gli ordini o conosci gli altri partecipanti.

Entra nel gruppo: ${basePath}/gruppo/${toGroup.id}

--
Porpiroqui (${basePath}) è servizio gratuito che permette di gestire, in modo semplice e diretto, ordini di gruppo da negozi e produttori in zona.
Comprare insieme permette di sostenere i piccoli negozianti, ottenere sconti e promozioni e fare acquisti pensati e organizzati.
Scopri tutti i negozi presenti sul nostro sito ${basePath}/negozi.
