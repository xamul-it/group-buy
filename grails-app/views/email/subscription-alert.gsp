<%@ page contentType="text/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
	<g:render template="/email/head"/>
	<title> Avviso del gruppo </title>
</head>
<body class="body" style="padding:0 !important; margin:0 !important; display:block !important; min-width:100% !important; width:100% !important; background:#0a2641; -webkit-text-size-adjust:none;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#0a2641" class="gwfw">
		<tr>
			<td align="center" valign="top" style="padding: 50px 10px;" class="p10">
				<table width="650" border="0" cellspacing="0" cellpadding="0" class="m-shell">
					<tr>
						<td>
							<g:render template="/email/logo"/>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom: 20px !important; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;" class="column"></td>
					</tr>
					<tr>
						<td class="td" bgcolor="#38AAE1" style="border-radius: 12px; width:650px; min-width:650px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;">
							<!-- Main -->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<g:render template="/email/group-alert-main"/>

										<g:render template="/email/navigation"/>

										<g:render template="/email/footer"/>
										
									</td>
								</tr>
							</table>
							<!-- END Main -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>