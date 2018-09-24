Return-Path: <pietro.maltoni@studio.unibo.it>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=studio.unibo.it
 (client-ip=40.107.7.133; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=pietro.maltoni@studio.unibo.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=studio.unibo.it
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=liveunibo.onmicrosoft.com
 header.i=@liveunibo.onmicrosoft.com header.b="D9Tbk3LG"; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70133.outbound.protection.outlook.com [40.107.7.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42JmVR16pkzF3Cc
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 00:17:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=liveunibo.onmicrosoft.com; s=selector1-studio-unibo-it;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mukR/bw07RLDodkAY2xDe9EtgKTdd8w4okGf6d5wO2E=;
 b=D9Tbk3LGH3FoBzQ3ASQSajb7B9xLwg7V67tINUch6l7gSHejwZdLZsMLP8+7f9wtkBYdvka9iHZfiOgiiyqMx9jsgx8mMNSV3O8BCYabjK/wR0Aqd/Jrv+Hs7jRIRyn+wOzrwjE/F48BogvJwrK03w3lBQhXrbokIxQsCAjH3vk=
Received: from AM6PR01MB4038.eurprd01.prod.exchangelabs.com (20.176.242.147)
 by AM6PR01MB4103.eurprd01.prod.exchangelabs.com (20.176.243.150) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.18; Mon, 24 Sep
 2018 14:16:55 +0000
Received: from AM6PR01MB4038.eurprd01.prod.exchangelabs.com
 ([fe80::5506:f5e1:b3ff:fe21]) by AM6PR01MB4038.eurprd01.prod.exchangelabs.com
 ([fe80::5506:f5e1:b3ff:fe21%4]) with mapi id 15.20.1143.017; Mon, 24 Sep 2018
 14:16:52 +0000
From: Pietro Maltoni <pietro.maltoni@studio.unibo.it>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Andrea Bartolini <a.bartolini@unibo.it>
Subject: Question on flashing firmware and bmc image
Thread-Topic: Question on flashing firmware and bmc image
Thread-Index: AQHUVBERksb5vURt0EuGa8fOXEbZjg==
Date: Mon, 24 Sep 2018 14:16:52 +0000
Message-ID: <AM6PR01MB40382A2AF6BB37B46FD74C1CCF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pietro.maltoni@studio.unibo.it; 
x-originating-ip: [137.204.150.29]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR01MB4103;
 6:nbFoNc/xqr5bYbUb/7Xu42sIQSI5WSVQKBgY7VXqz53Lms1l50kUF1HfurHBAOgQOh6upK4PX1Sa2XFxEuk49Hc7d9ShZdyD+PLHY0uyORbuxUafVtxo8aFVK5PVsxAWj+cA9FPqbLcPcP6tNBQQ+4hyVRggXUqQyXIyrLckUXnbg14oQ8Etm6CnkLyYyGlgJCFPmv0rYKsl15mjiywNEO2BrWC4fQi7SBVCwI4o6mD19BL8ahdn3HkE8XcwY0o+ixzAh43y8WCIm4khwznGnzvnoSqZKX3mOFJkmDKdY9+M+0qcMC5w41Lc2VaCXZkRtV5iBGBt+Kzlr0yAgZ9/2RNU9kgj++DaluUkovkI2eT3WHKl16UOhIJQFhXE3T/ZJWqeIL8ZtKytDcFdF8Bk2jyEgKLFYzTvKzAiRZ4rf4gywi22DWl0As6xhkmDfnKwE15JG2MYhZpNJcUHJxEKEA==;
 5:KRSbuiXGQu5yHr8t/pudREQvakoXaLjgrwcfBDwYmbhfzMffUGbjy/hgTNNEOrZ6GSbJanOauO95N/zlxruG+NoWAw0lyChi+CUgSzJ9XBeI2MIOFHNROV9qoAcCeji6wbarVQJPe/uaYZUyBIvGkrEq0hVmJ/E6EuOlinl0xV8=;
 7:rrepYQKOPpGF1se6+U/dtsKYgJShm7EvcOLvuBjFaGrf/B/d0gxd6TvS6xU0p+kXgKwgX02xY7Y9lf4fzndzasnTR72V2hKaHhSRxGLDTt3ivfFxLzfvgywuBtcP72awTbk0fm3vVwuYDa1e3MwBHbZ88XabHC4aH+b1pR1202l9WEl1Z4IvvU5D0ca1wh1XSeCsoCR/139SIqJ8eBcVvdG4FGd7N8DHhyujVgDtHS+pXhwGs7Eht7bPhBveAz5d
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(346002)(396003)(366004)(136003)(189003)(199004)(3846002)(8936002)(236005)(4326008)(102836004)(99286004)(44832011)(7696005)(74482002)(6116002)(6506007)(105586002)(26005)(74316002)(478600001)(55016002)(606006)(5640700003)(966005)(7736002)(81166006)(53936002)(2351001)(66066001)(19627405001)(786003)(2501003)(6916009)(476003)(68736007)(256004)(486006)(54896002)(6306002)(97736004)(6606003)(25786009)(107886003)(5250100002)(2906002)(316002)(86362001)(8676002)(71200400001)(6436002)(106356001)(5660300001)(2900100001)(81156014)(1730700003)(71190400001)(33656002)(9686003)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR01MB4103;
 H:AM6PR01MB4038.eurprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
x-ms-office365-filtering-correlation-id: c05ff37d-8719-4e76-5fc6-08d622285fd5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:AM6PR01MB4103; 
x-ms-traffictypediagnostic: AM6PR01MB4103:
x-microsoft-antispam-prvs: <AM6PR01MB41030163A2CE92788256D194CF170@AM6PR01MB4103.eurprd01.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(149066)(150027)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281529075)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051);
 SRVR:AM6PR01MB4103; BCL:0; PCL:0; RULEID:; SRVR:AM6PR01MB4103; 
x-forefront-prvs: 0805EC9467
received-spf: None (protection.outlook.com: studio.unibo.it does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: vrdU+YSI2gWuzMbfgMniq5XICaAtLzZqQGQsN+dNOs/EshwlmOvf0068tIyaUNffPQV2uZOnS/ogRuHVYCJmxa5WAt3vk42hj1R0ptOsOTrtxuInfvDznpGNLaqJxJOqmYb53rXnEtLgi8AE72guAzslUBVkjpClL4vtbeItSmMHrSdqA08uYMK3uGFWPzrFxrVToUAKgcR67FC1wgkZuVzZzN/2nvLD5/qI46aGK/pzNL4uFe8Lr34ZLUcPzOFVgY66McnqJZPMv4MQVCxPthMmpLyasbfWm+/epipvLs6PTaaO/bGoNEtx7djWCxaP+x5onZmaFGgd71bxio9K9TungGaeo18+jBR+/HDCow0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM6PR01MB40382A2AF6BB37B46FD74C1CCF170AM6PR01MB4038eurp_"
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-Network-Message-Id: c05ff37d-8719-4e76-5fc6-08d622285fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2018 14:16:52.0218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB4103
X-Mailman-Approved-At: Wed, 26 Sep 2018 09:51:14 +1000
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
X-List-Received-Date: Mon, 24 Sep 2018 14:17:05 -0000

--_000_AM6PR01MB40382A2AF6BB37B46FD74C1CCF170AM6PR01MB4038eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm a student in university of bologna and for a research project I have to=
 work with openbmc on a Tyan palmetto system.



I have successfully compiled and installed an openbmc firmware on the palme=
tto system following the guide https://github.com/openbmc/openbmc.

After installing it I've recognized that oem openpower commands and sensors=
 are not available.

For instance when doing ipmitool sdr elist I do not see openpower sensors(o=
cc ones) as well as netfn in ipmi does not contain commands for the occ.



By searching on the code I've recognized that these are in meta-openpower r=
ecipes. How can i enable them? Is there a standard procedure for enabling t=
hem on openpower hardware or in palmetto?

--_000_AM6PR01MB40382A2AF6BB37B46FD74C1CCF170AM6PR01MB4038eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0"></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white"><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black;=
mso-ansi-language:EN-US">I'm a student in university of bologna and for a r=
esearch project I have to work with openbmc on a Tyan
 palmetto system.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white"><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black;=
mso-ansi-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white;font-variant-=
ligatures: normal;=0A=
font-variant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-tex=
t-stroke-width: 0px;=0A=
text-decoration-style: initial;text-decoration-color: initial;word-spacing:=
=0A=
0px">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;=0A=
mso-ansi-language:EN-US">I have successfully compiled and installed an open=
bmc firmware on the palmetto system following&nbsp;the&nbsp;guide&nbsp;</sp=
an><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
a href=3D"https://github.com/openbmc/openbmc" id=3D"LPlnk837887" previewrem=
oved=3D"true"><span lang=3D"EN-US" style=3D"mso-ansi-language:EN-US">https:=
//github.com/openbmc/openbmc</span></a></span><span lang=3D"EN-US" style=3D=
"font-family:&quot;Calibri&quot;,sans-serif;color:black;mso-ansi-language:=
=0A=
EN-US">.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white;font-variant-=
ligatures: normal;=0A=
font-variant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-tex=
t-stroke-width: 0px;=0A=
text-decoration-style: initial;text-decoration-color: initial;word-spacing:=
=0A=
0px">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;=0A=
mso-ansi-language:EN-US">After installing it I've recognized that oem openp=
ower commands and sensors are not available.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white;font-variant-=
ligatures: normal;=0A=
font-variant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-tex=
t-stroke-width: 0px;=0A=
text-decoration-style: initial;text-decoration-color: initial;word-spacing:=
=0A=
0px">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;=0A=
mso-ansi-language:EN-US">For instance when doing ipmitool sdr elist I do no=
t&nbsp;see openpower sensors(occ ones) as well as netfn in ipmi does not co=
ntain commands for the occ.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white"><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black;=
mso-ansi-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;background:white;font-variant-=
ligatures: normal;=0A=
font-variant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-tex=
t-stroke-width: 0px;=0A=
text-decoration-style: initial;text-decoration-color: initial;word-spacing:=
=0A=
0px">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;=0A=
mso-ansi-language:EN-US">By searching on the code I've recognized that thes=
e are in meta-openpower recipes. How can i enable them? Is there a standard=
 procedure for enabling them on openpower
 hardware or in palmetto?<o:p></o:p></span></p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
</div>
</body>
</html>

--_000_AM6PR01MB40382A2AF6BB37B46FD74C1CCF170AM6PR01MB4038eurp_--
