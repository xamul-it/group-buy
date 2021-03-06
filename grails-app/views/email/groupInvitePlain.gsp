<%@ page contentType="text/plain;charset=UTF-8"%>
<%
	def groupName = toGroup.name
	if(!groupName.toLowerCase().contains('gruppo')) {
		groupName = "Gruppo "+groupName
	}
%>

${groupName}

${message.encodeAsRaw()}

Entra nel gruppo: ${basePath}/gruppo/${toGroup.id}

Ricevi questa mail perché ${userEmail.encodeAsRaw()} ti ha invitato a partecipare al gruppo d'acquisto.

--
Porpiroqui (${basePath}) è servizio gratuito che permette di gestire, in modo semplice e diretto, ordini di gruppo da negozi e produttori in zona.
Comprare insieme permette di sostenere i piccoli negozianti, ottenere sconti e promozioni e fare acquisti pensati e organizzati.
Scopri tutti i negozi presenti sul nostro sito ${basePath}/negozi.
