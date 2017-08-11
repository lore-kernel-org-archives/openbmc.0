Return-Path: <kenneth.wilke@RACKSPACE.COM>
X-Greylist: delayed 955 seconds by postgrey-1.36 at bilbo;
 Sat, 12 Aug 2017 04:26:19 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raxglobal.onmicrosoft.com
 header.i=@raxglobal.onmicrosoft.com header.b="zoHEoVds"; 
 dkim-atps=neutral
Received: from esg01.rackspace.com (esg04.rackspace.com [104.130.178.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTYNq0DYYzDr2j
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 04:26:18 +1000 (AEST)
Received: from smtpout.rackspace.com (unknown [10.12.51.28])
 by Websense Email with ESMTPS id CE5FDA0CA6393;
 Fri, 11 Aug 2017 18:10:19 +0000 (UTC)
Received: from 543818-OEXCH01.ror-uc.rackspace.com (10.12.51.21) by
 544150-OEXCH11.ror-uc.rackspace.com (10.12.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.845.32; Fri, 11 Aug 2017 13:10:19 -0500
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (207.46.163.55)
 by rackermail.rackspace.com (10.12.51.21) with Microsoft SMTP Server (TLS) id
 15.0.1293.1 via Frontend Transport; Fri, 11 Aug 2017 13:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raxglobal.onmicrosoft.com; s=selector1-rackspace-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Holi7X6sfOw8RjKBvzQ52XyPuPj7UgsQMgB4+INNJfU=;
 b=zoHEoVdsyRkSWwyrVdzXIu2xFiAEWRqv7VoWaRpLz2szBinLdu+4TiETuQAIO2JK+sKUj+bR9HN5twTjndyrCRpbrAlDcKYCKi5N/v679NROYs2LO6akxgyj2hv5g9c81SaMiKBAGSolLnJJGQTk/8p8QgwfEZn7yNIoaxavHl0=
Received: from SN1PR20MB0496.namprd20.prod.outlook.com (10.163.224.26) by
 SN1PR20MB0494.namprd20.prod.outlook.com (10.163.224.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1320.16; Fri, 11 Aug 2017 18:10:17 +0000
Received: from SN1PR20MB0496.namprd20.prod.outlook.com ([10.163.224.26]) by
 SN1PR20MB0496.namprd20.prod.outlook.com ([10.163.224.26]) with mapi id
 15.01.1320.021; Fri, 11 Aug 2017 18:10:17 +0000
From: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
To: vishwa <vishwa@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Design proposal to Non-Interactive password update for REST client
Thread-Topic: Design proposal to Non-Interactive password update for REST
 client
Thread-Index: AQHTEr3d8XIEpoVyrkq96OffnQL306J/XkxXgAAF1YCAABB52A==
Date: Fri, 11 Aug 2017 18:10:17 +0000
Message-ID: <SN1PR20MB04962A116A342DF0D9359ACDEF890@SN1PR20MB0496.namprd20.prod.outlook.com>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
 <SN1PR20MB049686AE976A7994AA7949E8EF890@SN1PR20MB0496.namprd20.prod.outlook.com>,
 <5ed0dda9-4581-aa0a-f63d-13ac7e4f5057@linux.vnet.ibm.com>
In-Reply-To: <5ed0dda9-4581-aa0a-f63d-13ac7e4f5057@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kenneth.wilke@RACKSPACE.COM; 
x-originating-ip: [72.32.180.183]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR20MB0494;
 6:PQfz8IZkIG+W4oobvE3zeqE9Zdjk0mXOKIRclthSsFvE6ICp2iXEc7ote2j1qwCowJ7aR1r8ukZQt/Bp06wlRFcBBShlmvDfvLk8zo5CvpkTZLO2uctratAkWqnrCXyldimfxAHcb/y0sLAaa2GzVUO+trswaWztKUTj1kN6li/cr89AxJZkbYp16S7B0U19+W5vEbJdW2ZLuzlxJy0wzcphTAudDWhuswZ6b1N5aJGKhymGXXGIMejHJVxTFQvQEB42mL/bHpesYKG9YV3SupDl7aOIIPK5aXBlHCq5w4FrgmNLUscCF6cDXCfj3xKQvxjGKMiJ+u8WADCnR6r4Jw==;
 5:WitvCyXnDjCuBTKfuAuEEkAOfY95UZXQXUStt4U5TiyULBR57wWRoHeJu/XvHIwWVVWQgvpE81ILoqrn/tiRwDE7HpxLWdYAoRsqM4MVw1etC30Mf3EHMklxfY5yHYzt1WGfuKYhFai5cuxSCL3qdw==;
 24:EUmEdIB1HfKRzCDH2OfAFdc0Ej3p42IIqmK8Imz44qfkdPKCM10nWvuDH9rQXlLvMn4Hg55C8dnr7eW07UgN+QpUasbiJixLEeoAlLbLwpA=;
 7:ED8Qb3X4YRkR8KkRnzUrQuCRetAk4q/jWkm69NA8LDCB80AbjMMeF/quQovZnfF0SQ2ENY29iJNpNvj8dhIFiOQhw9JD7UAl1ODWYf5hpfod1GGq3eGYvPfhhtnn0SkQCelERZIX2WP+DoxavC5epwg9sCWbAMgVLbNK86SKgNMnvj60eaVCpDDtVApstIoTSbGuyNLWDA6+qzMLK1eB5nljZKn5fj5PnX05nCAeJVc=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 2a051105-ae93-4731-3fa5-08d4e0e438be
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:SN1PR20MB0494; 
x-ms-traffictypediagnostic: SN1PR20MB0494:
x-exchange-antispam-report-test: UriScan:(158342451672863)(189930954265078)(65623756079841)(104084551191319); 
x-microsoft-antispam-prvs: <SN1PR20MB0494A6DBD637F38EBE56BA1EEF890@SN1PR20MB0494.namprd20.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123558100)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:SN1PR20MB0494; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:SN1PR20MB0494; 
x-forefront-prvs: 03965EFC76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(24454002)(189002)(199003)(377454003)(8676002)(53546010)(7696004)(81156014)(105586002)(6246003)(15650500001)(7736002)(229853002)(236005)(99286003)(478600001)(2950100002)(9686003)(55016002)(3660700001)(106356001)(81166006)(54896002)(3846002)(77096006)(6506006)(8936002)(25786009)(6436002)(53936002)(74316002)(551544002)(3280700002)(68736007)(6116002)(102836003)(66066001)(2906002)(97736004)(189998001)(14454004)(19627405001)(5660300001)(50986999)(54356999)(86362001)(76176999)(33656002)(561944003)(2900100001)(101416001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR20MB0494;
 H:SN1PR20MB0496.namprd20.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: RACKSPACE.COM does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_SN1PR20MB04962A116A342DF0D9359ACDEF890SN1PR20MB0496namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2017 18:10:17.4458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 570057f4-73ef-41c8-bcbb-08db2fc15c2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR20MB0494
X-OriginatorOrg: rackspace.com
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Aug 2017 18:26:20 -0000

--_000_SN1PR20MB04962A116A342DF0D9359ACDEF890SN1PR20MB0496namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Makes sense, sounds like a good route to me

________________________________
From: vishwa <vishwa@linux.vnet.ibm.com>
Sent: Friday, August 11, 2017 12:11:01 PM
To: Kenneth Wilke; OpenBMC Maillist
Subject: Re: Design proposal to Non-Interactive password update for REST cl=
ient

Sorry, I should have mentioned that I had looked at that option.

For `chpasswd`, I need to fork a process but with `putspent` I can do in sa=
me process.

On 08/11/2017 10:20 PM, Kenneth Wilke wrote:

Could chpasswd be used for that?

________________________________
From: openbmc <openbmc-bounces+kenneth.wilke=3Drackspace.com@lists.ozlabs.o=
rg><mailto:openbmc-bounces+kenneth.wilke=3Drackspace.com@lists.ozlabs.org> =
on behalf of vishwa <vishwa@linux.vnet.ibm.com><mailto:vishwa@linux.vnet.ib=
m.com>
Sent: Friday, August 11, 2017 11:18:48 AM
To: OpenBMC Maillist
Subject: Design proposal to Non-Interactive password update for REST client

This email is about openbmc/openbmc#1714 ( REST API to update root
password )

Goal is to do Non-interactive password updates to enable a REST client
to update the root password.

My proposal is to use `getspent(3)` and `putspent(3)` and here is the flow.

REST client will provide a method that takes std::string as parameter.

The Provider at the BMC will receive the password and does these:

  - Executes `getspent(3)` for "root" and gets the entries.
  - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.
  - Makes a call to `crypt(3)` with the extracted `salt` and `user
input` and generates encrypted pass-code
  - Populates the structure and calls `putspent(3)` to update the password

Please let me know your opinion on this.

Thank you,

!! Vishwa !!



--_000_SN1PR20MB04962A116A342DF0D9359ACDEF890SN1PR20MB0496namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body bgcolor=3D"#FFFFFF" text=3D"#000000">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Makes sense, sounds like a good route to me<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vishwa &lt;vishwa@lin=
ux.vnet.ibm.com&gt;<br>
<b>Sent:</b> Friday, August 11, 2017 12:11:01 PM<br>
<b>To:</b> Kenneth Wilke; OpenBMC Maillist<br>
<b>Subject:</b> Re: Design proposal to Non-Interactive password update for =
REST client</font>
<div>&nbsp;</div>
</div>
<div>Sorry, I should have mentioned that I had looked at that option.<br>
<br>
For `chpasswd`, I need to fork a process but with `putspent` I can do in sa=
me process.<br>
<br>
<div class=3D"moz-cite-prefix">On 08/11/2017 10:20 PM, Kenneth Wilke wrote:=
<br>
</div>
<blockquote cite=3D"mid:SN1PR20MB049686AE976A7994AA7949E8EF890@SN1PR20MB049=
6.namprd20.prod.outlook.com" type=3D"cite">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000;
          font-family:Calibri,Helvetica,sans-serif">
<p>Could chpasswd be used for that?<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" colo=
r=3D"#000000" face=3D"Calibri, sans-serif"><b>From:</b> openbmc
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openbmc-bounces&#43;kenne=
th.wilke=3Drackspace.com@lists.ozlabs.org">
&lt;openbmc-bounces&#43;kenneth.wilke=3Drackspace.com@lists.ozlabs.org&gt;<=
/a> on behalf of vishwa
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:vishwa@linux.vnet.ibm.com=
">&lt;vishwa@linux.vnet.ibm.com&gt;</a><br>
<b>Sent:</b> Friday, August 11, 2017 11:18:48 AM<br>
<b>To:</b> OpenBMC Maillist<br>
<b>Subject:</b> Design proposal to Non-Interactive password update for REST=
 client</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">This email is about openbmc/openbmc#1714 ( REST AP=
I to update root
<br>
password )<br>
<br>
Goal is to do Non-interactive password updates to enable a REST client <br>
to update the root password.<br>
<br>
My proposal is to use `getspent(3)` and `putspent(3)` and here is the flow.=
<br>
<br>
REST client will provide a method that takes std::string as parameter.<br>
<br>
The Provider at the BMC will receive the password and does these:<br>
<br>
&nbsp; - Executes `getspent(3)` for &quot;root&quot; and gets the entries.<=
br>
&nbsp; - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.<br=
>
&nbsp; - Makes a call to `crypt(3)` with the extracted `salt` and `user <br=
>
input` and generates encrypted pass-code<br>
&nbsp; - Populates the structure and calls `putspent(3)` to update the pass=
word<br>
<br>
Please let me know your opinion on this.<br>
<br>
Thank you,<br>
<br>
!! Vishwa !!<br>
<br>
</div>
</span></font></blockquote>
<br>
</div>
</body>
</html>

--_000_SN1PR20MB04962A116A342DF0D9359ACDEF890SN1PR20MB0496namp_--
