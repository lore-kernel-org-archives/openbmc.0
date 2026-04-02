Return-Path: <openbmc+bounces-1773-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B0A1112275
	for <openbmc@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fmQTG3CXKz2yYJ;
	Thu, 02 Apr 2026 13:16:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775096194;
	cv=none; b=MGHTI68wWObTmCujZ8vIPcWCs8vmwWXBU0d+bquqyn8lopVLBVqwk+MeFGNcLWKFC3DV4O47P6cEVDR9CsuVCVe0+vEl5adSpXAA6BjxTtO4rfTN/QwlaI+bxp1sTnymKmcN3PXzXzrZzJ5HS+uE923sOITHh8hYlHsm3YEaWRBY8WPlZDHQoPzsGq92XHd37OJcPLVbRB6EELjdBF9z0qFColubRgCCB4j1bS4s8tAVUDv4iku4h3y5MJxn/geArAzlhhnJUmYePUaVaMfcxbXEDGwmysPdJV9NI2/KCofw54Ds2/kqmtnkOh+27mKcgI8A2Wr8VlJM1Hr+shFyHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775096194; c=relaxed/relaxed;
	bh=/uFvBZQtizeqfkmqprtSy5AoPbeGBL1SyLvXWahRub8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iM1r4i4BNjX58rR7Ha6agbrknL9rmkgCy/STLuK1jexzpJ+R7VHxgn/NQuifxpIyRnlXbHuvlos2psW3wsuEUIQ6uiQNW+Te9wItykF6IZJXKw9WlcWVNf7AddWKmTNgR93kms8F1a2pA1eAJ/5gjtMJKt9Rgt8DOO0HNOWGus6A5H+aSW8bujBwYyAwHMOkk2g6KmnYwA5YpBhbEaI+y9tQS8F++weZxYLSv0M/hrAD9+hJqaoIxR8dQ1HLNIBwXVyE9ocCBm73UOHwQYO0x+rWFouM7l+YGnJ5aWbFoXWPMoe68z6BDq79E73mCyX+pctCPDOEh6nQGu7b5RmkeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MvdjWmGE; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MvdjWmGE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 427 seconds by postgrey-1.37 at boromir; Thu, 02 Apr 2026 13:16:32 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fmQTD5lprz2xfX
	for <openbmc@lists.ozlabs.org>; Thu, 02 Apr 2026 13:16:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1775095764;
	bh=/uFvBZQtizeqfkmqprtSy5AoPbeGBL1SyLvXWahRub8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MvdjWmGEtCjTjsuoAEtrp9gKUjDm5rtRxU1al0I4gcm2tYCTUxh21tkMJNpswzILc
	 jIhFLjs8yPjyxHdKQzloXBEb0LUHmoeU83ZzpEhSQz3LV2NDiYrvodlm1He+LBQrTj
	 mlTQ4zsC7zucnU+szC7HY94oy49W++e+6aWR2p0SgBitAzw44kOV7cP7wapWm8U9XE
	 zUSvpTdXNuazJZoA6Fs1iGBb8TiN3wjB1fRfJ1kBQzCWvJgu0lYMiPEvLSV8eahUsW
	 GPsJiX4U3VtKsHMMsSYYC1yBXKZ2AGHXUshaajAETdHcAyN1pw7Evj9Y5NNTEKo8i4
	 OhDd7tr1oHyrg==
Received: from [192.168.12.105] (unknown [144.6.157.237])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DB3846506C;
	Thu,  2 Apr 2026 10:09:23 +0800 (AWST)
Message-ID: <91704f59fe5c3ab763927f66b6582d32975a1764.camel@codeconstruct.com.au>
Subject: Re: [RFC] SPDM attestation E2E findings from Renode testing
From: Matt Johnston <matt@codeconstruct.com.au>
To: Gary Beihl <garybeihl@microsoft.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Cc: Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia
	 <Sagar.Dharia@microsoft.com>, Giri Mudusuru <girimudusuru@microsoft.com>
Date: Thu, 02 Apr 2026 10:09:15 +0800
In-Reply-To: <LV2PR21MB6760DEE956E328854F20CE6BA650A@LV2PR21MB6760.namprd21.prod.outlook.com>
References: 
	<LV2PR21MB6760DEE956E328854F20CE6BA650A@LV2PR21MB6760.namprd21.prod.outlook.com>
Content-Type: multipart/alternative; boundary="=-Rdm8IVX/sp7AufrZ9lSc"
User-Agent: Evolution 3.56.2-4 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0

--=-Rdm8IVX/sp7AufrZ9lSc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

On Wed, 2026-04-01 at 21:35 +0000, Gary Beihl wrote:
>=20
>=20
> (c) Shared AF_MCTP socket (affects 80311: mctp_helper.hpp)
> =C2=A0
> Only one socket can bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).=C2=A0 When s=
pdmd
> attests multiple endpoints sequentially, the second
> =C2=A0=C2=A0MctpIoClass::createSocket() fails with EADDRINUSE. The fix is=
 a process-
> lifetime shared socket (singleton pattern), draining stale responses
> between endpoint attestations with recv(MSG_DONTWAIT).

Since Linux 6.17 it is possible to restrict a bind() to only receive from a
single remote endpoint [1]. Call connect() with the remote address before t=
he
bind().

Is the SPDM implementation using asynchronous messages sent by the responde=
r?
(KEY_UPDATE, HEARTBEAT, END_SESSION)
If not, I think the bind() could be removed altogether.
bind() isn't needed in the case where the Linux host is performing a plain
send() then receiving a response. A similar situation was fixed in pldmtool
[2].

[1]=C2=A0https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@c=
odeconstruct.com.au/
[2]=C2=A0https://gerrit.openbmc.org/c/openbmc/pldm/+/83626=C2=A0

Cheers,
Matt


--=-Rdm8IVX/sp7AufrZ9lSc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>


<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word"><div>Hi Gary,</div><div><br></div><div>On Wed, 2026-04-01 at 21=
:35 +0000, Gary Beihl wrote:</div><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size: 11pt;">(c) Shared AF_MCTP =
socket (affects 80311: mctp_helper.hpp)</span></p><p class=3D"MsoNormal"><s=
pan style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></span></p><p class=3D"MsoN=
ormal"><span style=3D"font-size:11.0pt">Only one socket can bind to (MCTP_A=
DDR_ANY, MCTP_TYPE_SPDM).&nbsp; When spdmd attests multiple endpoints seque=
ntially, the second &nbsp;&nbsp;MctpIoClass::createSocket() fails with EADD=
RINUSE. The fix is a process-lifetime shared socket (singleton pattern), dr=
aining stale responses between endpoint attestations with recv(MSG_DONTWAIT=
).<o:p></o:p></span></p><p class=3D"MsoNormal"></p></div></blockquote><div>=
<br></div><div>Since Linux 6.17 it is possible to restrict a bind() to only=
 receive from a single remote endpoint [1]. Call connect() with the remote =
address before the bind().</div><div><br></div><div>Is the SPDM implementat=
ion using asynchronous messages sent by the responder? (KEY_UPDATE, HEARTBE=
AT, END_SESSION)</div><div>If not, I think the bind() could be removed alto=
gether.</div><div>bind() isn't needed in the case where the Linux host is p=
erforming a plain send() then receiving a response. A similar situation was=
 fixed in pldmtool [2].</div><div><br></div><div>[1]&nbsp;<a href=3D"https:=
//lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codeconstruct.co=
m.au/">https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@cod=
econstruct.com.au/</a></div><div>[2]&nbsp;<a href=3D"https://gerrit.openbmc=
.org/c/openbmc/pldm/+/83626">https://gerrit.openbmc.org/c/openbmc/pldm/+/83=
626</a>&nbsp;</div><div><br></div><div>Cheers,</div><div>Matt</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><div class=3D"WordSection1"><p class=3D"MsoNormal"><span=
 style=3D"font-size:11.0pt"><o:p></o:p></span></p></div></blockquote><div><=
br></div><div><span></span></div></body></html>

--=-Rdm8IVX/sp7AufrZ9lSc--

