Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.9; helo=cpsmtpb-ews06.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="jAG/aD+k"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews06.kpnxchange.com (cpsmtpb-ews06.kpnxchange.com
 [213.75.39.9])
 by lists.ozlabs.org (Postfix) with ESMTP id 443s4q6hcvzDqH4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 06:59:05 +1100 (AEDT)
Received: from cpsps-ews06.kpnxchange.com ([10.94.84.173]) by
 cpsmtpb-ews06.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Tue, 19 Feb 2019 20:59:00 +0100
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=FI3KONgs c=1 sm=1 tr=0
 a=diifJYKRI7b1jwuA2FYYhQ==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=xqWC_Br6kY4A:10 a=CFTnQlWoA9kA:10 a=yMhMjlubAAAA:8 a=1XWaLZrsAAAA:8
 a=X5F7dNyOAAAA:8 a=FOH2dFAWAAAA:8 a=voM4FWlXAAAA:8
 a=HhfLqBFOzUIQzWF_RYwA:9 a=NSEvoOILYJYHTqmz:21 a=zVr00S5mmgNvs6Zj:21
 a=pILNOxqGKmIA:10 a=o6HNciYZtdsA:10 a=qGpgzLr2HbWyP7dlCPwA:9
 a=KCZq9J3s8JediuvO:21 a=kgfC7sNP6MLiJn8G:21 a=I3Qy3WPmP6wqlU5f:21
 a=UiCQ7L4-1S4A:10 a=_W_S_7VecoQA:10 a=frz4AuCg-hUA:10
 a=pS7LufLo7ZPxIL5li5Lt:22 a=i3VuKzQdj-NEYjvDI-p3:22
 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT101.kpnxchange.com ([195.121.3.17]) by
 cpsps-ews06.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 19 Feb 2019 20:59:00 +0100
Content-Language: nl-NL
Content-Type: multipart/alternative;
 boundary="_000_23274d383deb49f694b5c3a8cd3927f6Eltsrv03Eltanlocal_"
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550606340;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=Z040LL6aZ7Rv4CSQvSW4Mpu0AEJ1uds97jEwHTrBhjo=;
 b=jAG/aD+kWa5YFCSiEjTgcUI4XDcEqFU7IYRpund4N9K7zHOw4riHL3ST5rvN4t1k2D+Q7sUYibN
 3TNvXknT9HeTeTLlzdxByP6WNLOH64dk0HyIg3dU44bUo/RUWVbSu805FUwmu5qxUsQ8dI2qvvc3x
 rXCM+Ld/PT8XMQhy7QQ=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT101.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Tue, 19 Feb 2019 20:59:00 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 19 Feb
 2019 20:58:41 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Tue, 19 Feb 2019 20:58:41 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Emily Shaffer <emilyshaffer@google.com>
CC: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Adding IPMI support to an existing implementation
Thread-Topic: Adding IPMI support to an existing implementation
Thread-Index: AdTFIDsr8pTdO/3NT8aRBIZaZyiwgwACgNuAACdgIn0ArtRKAAACnHcs
Date: Tue, 19 Feb 2019 19:58:40 +0000
Message-ID: <23274d383deb49f694b5c3a8cd3927f6@Eltsrv03.Eltan.local>
References: <5cb3deac47694e52afdf214837928110@Eltsrv03.Eltan.local>,
 <CAJoAoZkirkJcpGVO-+NWjxWLvkTTw_Vy5HEiP4fKfyPj_sDJgQ@mail.gmail.com>
In-Reply-To: <CAJoAoZkirkJcpGVO-+NWjxWLvkTTw_Vy5HEiP4fKfyPj_sDJgQ@mail.gmail.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Feb 2019 19:59:00.0887 (UTC)
 FILETIME=[8E983270:01D4C88D]
X-RcptDomain: lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2019 19:59:11 -0000

--_000_23274d383deb49f694b5c3a8cd3927f6Eltsrv03Eltanlocal_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello Emily,

Thanks. We added the ipmi-host and the kcsbridge and got it to work to some=
 extend.

One issue we see is that Linux enters an endless loop trying to read the ev=
entlog. I would expect this to stop when the eventlog is read (especially a=
s there are no items).

Another thing we are running into is the fact that the system we have doesn=
=92t have a FRU eeprom for the mainboard. Our initial thought was to upload=
 the information using SetFru ipmi calls. Infortunately this is not support=
ed in the current ipmi-host implementation.

What would be the correct approach for this. I am considering to put the FR=
U information for the mainboard in a file in the BMC and use this instead o=
f the eeprom. Is this the correct approach and is this somehow supported al=
ready or should we implement this ourselves?

Thanks in advance for your input.

Best regards,

Wim Vervoorn




Verzonden vanuit Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> voo=
r Windows 10

Van: Emily Shaffer<mailto:emilyshaffer@google.com>
Verzonden: dinsdag 19 februari 2019 20:44
Aan: Wim Vervoorn<mailto:wvervoorn@eltan.com>
CC: Vijay Khemka<mailto:vijaykhemka@fb.com>; openbmc@lists.ozlabs.org<mailt=
o:openbmc@lists.ozlabs.org>
Onderwerp: Re: Adding IPMI support to an existing implementation

Wim,

phosphor-ipmi-host contains the inband implementation; kcsbridged provides =
the KCS interface bridge. Start by making sure those packages are included =
in your build; inventory and eventlog implementations are included within p=
hosphor-ipmi-host.

Emily

On Fri, Feb 15, 2019 at 11:19 PM Wim Vervoorn <wvervoorn@eltan.com<mailto:w=
vervoorn@eltan.com>> wrote:
At this point I'm not looking for additional OEM commands.

My main goal is just to add all support request to enable inband ipmi with =
KCS interface.  The most important thing is that the system is capable to p=
rovide the inventory and eventlog information to the BMC during boot.

The information I am looking for are items like. Which services need to be =
included and what do I need to configure to make it work.

Best regards,

Wim Vervoorn

Op 15 feb. 2019 9:31 p.m. schreef Vijay Khemka <vijaykhemka@fb.com<mailto:v=
ijaykhemka@fb.com>>:
Hi Wim,
What are trying here, adding extra ipmi support for your oem commands? IPMI=
 support is already there in phosphor-image. Please see if "ipmid" daemon i=
s running. You can check package phosphor-ipmi-host which provides support =
for ipmi daemon.

Regards
-Vijay

?On 2/15/19, 3:23 AM, "openbmc on behalf of Wim Vervoorn" <openbmc-bounces+=
vijaykhemka=3Dfb.com@lists.ozlabs.org<mailto:fb.com@lists.ozlabs.org> on be=
half of wvervoorn@eltan.com<mailto:wvervoorn@eltan.com>> wrote:

    Hello,

    We have an existing AST2400 based implementation for OpenBMC 2.6.0 and =
are trying to add IPMI support to it.

    At this moment we don't have a good set of documentation on the ipmi im=
plementation included in OpenBMC.

    Can anyone point me to this documentation? Or is the only way to do thi=
s to go over the various packages?

    Best regards,

    Wim Vervoorn



--_000_23274d383deb49f694b5c3a8cd3927f6Eltsrv03Eltanlocal_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
.MsoChpDefault
	{}
@page WordSection1
	{margin:70.85pt 70.85pt 70.85pt 70.85pt}
div.WordSection1
	{}
-->
</style>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Emily,</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Thanks. We added the ipmi-host and the kcsbridge and=
 got it to work to some extend.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">One issue we see is that Linux enters an endless loo=
p trying to read the eventlog. I would expect this to stop when the eventlo=
g is read (especially as there are no items).</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Another thing we are running into is the fact that t=
he system we have doesn=92t have a FRU eeprom for the mainboard. Our initia=
l thought was to upload the information using SetFru ipmi calls. Infortunat=
ely this is not supported in the current
 ipmi-host implementation.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">What would be the correct approach for this. I am co=
nsidering to put the FRU information for the mainboard in a file in the BMC=
 and use this instead of the eeprom. Is this the correct approach and is th=
is somehow supported already or should
 we implement this ourselves?</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Thanks in advance for your input.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Best regards,</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Wim Vervoorn</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Verzonden vanuit <a href=3D"https://go.microsoft.com=
/fwlink/?LinkId=3D550986">
Mail</a> voor Windows 10</p>
<p class=3D"MsoNormal">&nbsp;</p>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none; padding:0cm"><b>Van: </b><a hr=
ef=3D"mailto:emilyshaffer@google.com">Emily Shaffer</a><br>
<b>Verzonden: </b>dinsdag 19 februari 2019 20:44<br>
<b>Aan: </b><a href=3D"mailto:wvervoorn@eltan.com">Wim Vervoorn</a><br>
<b>CC: </b><a href=3D"mailto:vijaykhemka@fb.com">Vijay Khemka</a>; <a href=
=3D"mailto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a><br>
<b>Onderwerp: </b>Re: Adding IPMI support to an existing implementation</p>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
<div>
<div dir=3D"ltr">Wim,
<div><br>
</div>
<div>phosphor-ipmi-host contains the inband implementation; kcsbridged prov=
ides the KCS interface bridge. Start by making sure those packages are incl=
uded in your build; inventory and eventlog implementations are included wit=
hin phosphor-ipmi-host.</div>
<div><br>
</div>
<div>Emily</div>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 15, 2019 at 11:19 PM Wim =
Vervoorn &lt;<a href=3D"mailto:wvervoorn@eltan.com">wvervoorn@eltan.com</a>=
&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div>
<div>
<div dir=3D"auto">At this point I'm not looking for additional OEM commands=
.&nbsp;
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">My main goal is just to add all support request to enable=
 inband ipmi with KCS interface.&nbsp; The most important thing is that the=
 system is capable to provide the inventory and eventlog information to the=
 BMC during boot.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The information I am looking for are items like. Which se=
rvices need to be included and what do I need to configure to make it work.=
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Best regards,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Wim Vervoorn</div>
</div>
<div class=3D"m_-7230588881901143632x_gmail_extra"><br>
<div class=3D"m_-7230588881901143632x_gmail_quote">Op 15 feb. 2019 9:31 p.m=
. schreef Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"=
_blank">vijaykhemka@fb.com</a>&gt;:<br type=3D"attribution">
</div>
</div>
</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"m_-7230588881901143632PlainText">Hi Wim,<br>
What are trying here, adding extra ipmi support for your oem commands? IPMI=
 support is already there in phosphor-image. Please see if &quot;ipmid&quot=
; daemon is running. You can check package phosphor-ipmi-host which provide=
s support for ipmi daemon.<br>
<br>
Regards<br>
-Vijay<br>
<br>
&#65279;On 2/15/19, 3:23 AM, &quot;openbmc on behalf of Wim Vervoorn&quot; =
&lt;openbmc-bounces&#43;vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs=
.org" target=3D"_blank">fb.com@lists.ozlabs.org</a> on behalf of
<a href=3D"mailto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan.co=
m</a>&gt; wrote:<br>
<br>
&nbsp;&nbsp;&nbsp; Hello,<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; We have an existing AST2400 based implementation for Ope=
nBMC 2.6.0 and are trying to add IPMI support to it.<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; At this moment we don't have a good set of documentation=
 on the ipmi implementation included in OpenBMC.<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Can anyone point me to this documentation? Or is the onl=
y way to do this to go over the various packages?<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Best regards,<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Wim Vervoorn<br>
&nbsp;&nbsp;&nbsp; <br>
<br>
</div>
</span></font></div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_23274d383deb49f694b5c3a8cd3927f6Eltsrv03Eltanlocal_--
