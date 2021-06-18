<%
	def groupName = toGroup.name
	if(!groupName.toLowerCase().contains('gruppo')) {
		groupName = "Gruppo "+groupName
	}
%>
										<!-- Title + Copy - center -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="p30-20" style="padding: 80px 50px;">
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td class="h1 white center" style="padding-bottom: 20px; font-family:'Lato', Arial, sans-serif; font-size:44px; line-height:50px; color:#ffffff; text-align:center;"> ${groupName} </td>
														</tr>
														<tr>
															<td class="text white center" style="padding-bottom: 25px; font-family:'Lato', Arial, sans-serif; font-size:16px; line-height:28px; min-width:auto !important; color:#ffffff; text-align:center;">
																${message.encodeAsHTML()}.
																<br/>
																Ricevi questa mail perch&eacute; ${userEmail} ti ha invitato a partecipare al gruppo d'acquisto.
															</td>
														</tr>
														<tr>
															<td align="center">
																<table border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td class="text-button" style="color:#ffffff; font-family:'Lato', Arial, sans-serif; font-size:16px; line-height:20px; text-align:center; text-transform:uppercase; font-weight:bold; min-width:auto !important; padding:12px 22px; background:#0a2641; border-radius:4px;"><a href="${basePath}/gruppo/${toGroup.id}" target="_blank" class="link-white" style="color:#ffffff; text-decoration:none;"><span class="link-white" style="color:#ffffff; text-decoration:none;">Entra</span></a></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
										<!-- END Title + Copy - center -->