Return-Path: <kenneth.wilke@RACKSPACE.COM>
X-Greylist: delayed 949 seconds by postgrey-1.36 at bilbo;
 Sat, 12 Aug 2017 03:06:21 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raxglobal.onmicrosoft.com
 header.i=@raxglobal.onmicrosoft.com header.b="O1QRYuj3"; 
 dkim-atps=neutral
Received: from esg01.rackspace.com (esg01.rackspace.com [192.237.132.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTWcY4WnCzDr2m
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:06:21 +1000 (AEST)
Received: from smtpout.rackspace.com (unknown [10.12.51.25])
 by Websense Email with ESMTPS id 1007DF432F907;
 Fri, 11 Aug 2017 16:50:29 +0000 (UTC)
Received: from 544124-OEXCH02.ror-uc.rackspace.com (10.12.51.22) by
 544147-OExch12.ror-uc.rackspace.com (10.12.51.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.845.32; Fri, 11 Aug 2017 11:50:28 -0500
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (216.32.181.24)
 by rackermail.rackspace.com (10.12.51.22) with Microsoft SMTP Server (TLS) id
 15.0.1293.1 via Frontend Transport; Fri, 11 Aug 2017 11:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raxglobal.onmicrosoft.com; s=selector1-rackspace-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uOPZssPJC1F80KgEfQjpXL2G78G+3zeD7K+LkVPV3D0=;
 b=O1QRYuj38JrlT08K9+4wDl4/2SNfgIhYKedFsqAbcuU2HYWav/IxZ9Z1p93lQmahOQMMFjNu6Gd6xZGJcKiNNObMwMgPWTJDxtBHFnhLWGmYc4s1IJhsLwu7iAbt7hicjHf8LvZVqMjCQKgcK5lOnLwv7b5saKk4suddIJae7rk=
Received: from SN1PR20MB0496.namprd20.prod.outlook.com (10.163.224.26) by
 SN1PR20MB0493.namprd20.prod.outlook.com (10.163.224.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1320.16; Fri, 11 Aug 2017 16:50:27 +0000
Received: from SN1PR20MB0496.namprd20.prod.outlook.com ([10.163.224.26]) by
 SN1PR20MB0496.namprd20.prod.outlook.com ([10.163.224.26]) with mapi id
 15.01.1320.021; Fri, 11 Aug 2017 16:50:27 +0000
From: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
To: vishwa <vishwa@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Design proposal to Non-Interactive password update for REST client
Thread-Topic: Design proposal to Non-Interactive password update for REST
 client
Thread-Index: AQHTEr3d8XIEpoVyrkq96OffnQL306J/XkxX
Date: Fri, 11 Aug 2017 16:50:27 +0000
Message-ID: <SN1PR20MB049686AE976A7994AA7949E8EF890@SN1PR20MB0496.namprd20.prod.outlook.com>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
In-Reply-To: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kenneth.wilke@RACKSPACE.COM; 
x-originating-ip: [72.32.180.183]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR20MB0493;
 6:Avu+PQKUWJKpH9bnlPccqsusBkSPV+MWqInEgO2iAu5LGDTLeFMidGLeAHc1ZEUEyCjRaCoksuU7dlrv5ylGYrZizCaR6YrcLkYV5KZvqa+hu4ruEZ1dqSaJMCv3Yt0V3O4fvoJvU6Ht8Qdckte9A4Np6/jyqJCYrSrxawehd3HJlfHKegf1MMxB+nCjFVFRRHS/f1Ui8fvkJtVtZ4p3tp7pcXxHcPjL5P6v9p9oypcbUJqmstIhYuHYmxcenBKBGTqeS2nR3qMWbea0Gw3I6csSkH8CiTWHzhYbYI4rdakXiYENjq+28TkHvIP7+qD8tB9g+44Tq+BZ399lHpuJww==;
 5:8MHsPKk8hLhDhqvCcCD+Aj4QHlisr/WFgAOrnxUoSjbk1WkwP3M8rapJSXNsM7dnyh58gfVEJMCUQRG6CJWqzVsmd/I30Bd72s4NVFR8770IPAzYkUQJbV8tqiQ3lOVyokfY2ePZGtNLX4LppH6SFw==;
 24:PfBGrJiZBE1+xSZP7opCqC2czuIsMS2acbh9lX8v/GpQ029aPjXYCqlkgojI0cP49pvcfwerkaq3IPUIjKVbziOMoeKIYpEiXz1Sm3s6cZ4=;
 7:d86kA6PPEVqq5WUJMma1BrF2woLsvdtEDVowfwmpBm9zc2tum5tIT4Mbp69EEKeLM3OimjKXOL6bgeQ/W5Wyy3sDdiPnr6a1hnpULP92lUySYn/hOO2EaOsz/sjvL00ogY8NZbXEyKfuAKifUwIHvFwH3S8VPx5Ddwh883/wXni2Vr0ulllI+I7OTaaUrFWcQB3augPJZF29NFK7n7MK6xN8Lkd0qph+cnFLaunSjbg=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: efdb8af7-3ac7-467e-1164-08d4e0d911ca
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:SN1PR20MB0493; 
x-ms-traffictypediagnostic: SN1PR20MB0493:
x-exchange-antispam-report-test: UriScan:(158342451672863)(65623756079841)(104084551191319); 
x-microsoft-antispam-prvs: <SN1PR20MB049314B41CD02310C4F27C6FEF890@SN1PR20MB0493.namprd20.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123560025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:SN1PR20MB0493; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:SN1PR20MB0493; 
x-forefront-prvs: 03965EFC76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(199003)(189002)(377454003)(7736002)(25786009)(86362001)(68736007)(2906002)(3280700002)(2900100001)(8936002)(81156014)(33656002)(81166006)(8676002)(15650500001)(3660700001)(74316002)(105586002)(106356001)(101416001)(6116002)(14454004)(102836003)(3846002)(50986999)(54356999)(76176999)(66066001)(561944003)(551544002)(99286003)(55016002)(189998001)(7696004)(77096006)(2950100002)(229853002)(54896002)(53936002)(478600001)(9686003)(6246003)(97736004)(6436002)(5660300001)(6506006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR20MB0493;
 H:SN1PR20MB0496.namprd20.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: RACKSPACE.COM does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_SN1PR20MB049686AE976A7994AA7949E8EF890SN1PR20MB0496namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2017 16:50:27.6437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 570057f4-73ef-41c8-bcbb-08db2fc15c2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR20MB0493
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
X-List-Received-Date: Fri, 11 Aug 2017 17:06:22 -0000

--_000_SN1PR20MB049686AE976A7994AA7949E8EF890SN1PR20MB0496namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could chpasswd be used for that?

________________________________
From: openbmc <openbmc-bounces+kenneth.wilke=3Drackspace.com@lists.ozlabs.o=
rg> on behalf of vishwa <vishwa@linux.vnet.ibm.com>
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


--_000_SN1PR20MB049686AE976A7994AA7949E8EF890SN1PR20MB0496namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
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
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Could chpasswd be used for that?<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> openbmc &lt;openbmc=
-bounces&#43;kenneth.wilke=3Drackspace.com@lists.ozlabs.org&gt; on behalf o=
f vishwa &lt;vishwa@linux.vnet.ibm.com&gt;<br>
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
</span></font>
</body>
</html>

--_000_SN1PR20MB049686AE976A7994AA7949E8EF890SN1PR20MB0496namp_--
