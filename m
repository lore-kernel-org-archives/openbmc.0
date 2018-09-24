Return-Path: <pietro.maltoni@studio.unibo.it>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=studio.unibo.it
 (client-ip=40.107.8.127; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=pietro.maltoni@studio.unibo.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=studio.unibo.it
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=liveunibo.onmicrosoft.com
 header.i=@liveunibo.onmicrosoft.com header.b="ICKa1+70"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80127.outbound.protection.outlook.com [40.107.8.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Jl6D49fszDqws
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 23:14:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=liveunibo.onmicrosoft.com; s=selector1-studio-unibo-it;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPpzQJ6sYYx78XdFtqc6bEQdCkoTxVMbCZSaxuxlQs8=;
 b=ICKa1+70p/CzrQMBVOXAxkDd47SILJa/29OglezPfEX2xuorE3qMV4jBX+L6+xDfyLYuj9MIuZJXGST/1QI4FQElJVNh4qyKAJ0HeEug0yGLE3EhoblCY5IlMqTceGqtyD2S+/AwxJYPTjwEZEhpOfdZj02RPkjxz+Qbiv0cxiQ=
Received: from AM6PR01MB4038.eurprd01.prod.exchangelabs.com (20.176.242.147)
 by AM6PR01MB4439.eurprd01.prod.exchangelabs.com (20.177.190.224) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1164.25; Mon, 24 Sep
 2018 13:14:15 +0000
Received: from AM6PR01MB4038.eurprd01.prod.exchangelabs.com
 ([fe80::5506:f5e1:b3ff:fe21]) by AM6PR01MB4038.eurprd01.prod.exchangelabs.com
 ([fe80::5506:f5e1:b3ff:fe21%4]) with mapi id 15.20.1143.017; Mon, 24 Sep 2018
 13:13:29 +0000
From: Pietro Maltoni <pietro.maltoni@studio.unibo.it>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Andrea Bartolini <a.bartolini@unibo.it>
Subject: Question on Flashing fw, bmc image and MQTT tool in openpower
 palmetto system
Thread-Topic: Question on Flashing fw, bmc image and MQTT tool in openpower
 palmetto system
Thread-Index: AQHUVAhi3fzkyrUrG0m3I5IevCf3Bg==
Date: Mon, 24 Sep 2018 13:13:29 +0000
Message-ID: <AM6PR01MB4038467F3EE3379826DE33E9CF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pietro.maltoni@studio.unibo.it; 
x-originating-ip: [137.204.150.29]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR01MB4439;
 6:Nct4aVDOeYwh/aL+JHFLAjmK6esW/OaYxdUHXPEIZQ7RzB8ppBTW2Kzdkqj0iVMWspD5h9+W7GE1DjrBhK2cnqqTtvTwXQgVUpEnA1SlfcYHZ+Y3WSGfBwSuqyinLMmtabZ16ONohCieyOqykY4TzJAV2mv4G6RK8bJ/waeTWuX3U7sMBBfmeOBlkg8ND8RH6uztQHINptLuBq0a0f2tN0BlUwOeFfWm1RpnU3wQBQDk6FaGfijtz4a4YGFDWrn+VUXPyq0h2LANLzOLlaURdlydfH6Q9SoJLKfn7fCgpzClxLhSgQG+fPxjiLIJkw+o1ciU/3vQ55Wcma2+VBQxMgcbdyxfKe1268EX/ryHcUBDUIjAiB1KyvWbfkKRs6F4CE4g7qvqJKDyZ489OcwSODsx+fLWzVoEvihCDDz6oPjUZaevGL5xQXsQlluZHwa1b7iRCBMmk62dBntgR62Icg==;
 5:5sE9/coFKA+cVgjwlDksdUuVttmRgxANx6Zh0Rh2upuTlCT3TwZHH0ghLhlRrGsr/hZOpYOiniOGNz6B6o1+kNvRBo06ZUa3KuxTT5fyIcY7d7CPHuMBMKy2zYT/gVHJ87w1QJGYUEb2Y2uiAARvO7Wwni9Qlrfklgo9tYOPVWg=;
 7:p9xEmhmFLu58WjPwPqOeN3KRLY8jZMIHf6FNNLXMDvloC5OlLQZTYG5PkQHOLQT03qzxIn44Lz5yu3eEwkgSQP7kCJo+j6bG9v6alYd4l4pSX+O10ewQmLnLiak79dMOUrrQBODmCQJPyj/VPIOaxFUPOSJoT8mqIx6AZl/S1HI2JO4FPStPlyQpzRK5U3By5pBa1iPdwaEoMseArQ9ZiIUrGPFwyMGjYFBSGbrqa2IBHqtrZ7qa3Wwupvid0IXg
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 5aa07e8b-b7bd-4a4e-3d57-08d6221f8548
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:AM6PR01MB4439; 
x-ms-traffictypediagnostic: AM6PR01MB4439:
x-microsoft-antispam-prvs: <AM6PR01MB4439682193DEFB2BD2490D77CF170@AM6PR01MB4439.eurprd01.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(72170088055959);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231355)(944501410)(52105095)(93006095)(93001095)(149066)(150027)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281529075)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(201708071742011)(7699051);
 SRVR:AM6PR01MB4439; BCL:0; PCL:0; RULEID:; SRVR:AM6PR01MB4439; 
x-forefront-prvs: 0805EC9467
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(8676002)(26005)(2900100001)(6116002)(3846002)(478600001)(486006)(476003)(44832011)(81166006)(102836004)(1730700003)(86362001)(81156014)(6506007)(2906002)(14444005)(99286004)(7696005)(786003)(316002)(33656002)(5640700003)(107886003)(68736007)(256004)(6606003)(8936002)(14454004)(25786009)(4326008)(6916009)(71200400001)(74482002)(71190400001)(5660300001)(105586002)(97736004)(5250100002)(2351001)(2501003)(19627405001)(74316002)(6436002)(7736002)(106356001)(9686003)(54896002)(55016002)(53936002)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR01MB4439;
 H:AM6PR01MB4038.eurprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: studio.unibo.it does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: yKjrkAtLWnmdRXqXfc+1bcZzaAPCciXWJ1dbgys3AjPro4HxK7beMqSdOAAD75MlrGBFdbomEb3i/XBkEzcTeJw1HNX4wq2A7vxGfM0I943d978xDIVe60pJeVUL1YfL3ie3zRFLaDVjigTCp+3FQFu1jRFfw1AMULfsHwBq8OCdkyUxMWusoq4i95TTuaySSnfngsmRIlxWND5jccw6QlOf40EWvpNTVaNDJ11H+Gk4ZoN2KkUnDTnZBt3aNf0U9wrzxRkU7a1Lt4/Pn3UFs7u7AsPOglU5hOWMHejjuWWS5qTuxrMtk1Ie53F4pCIoyXALTVKfwfxQauxveg5/g7KyloLlz8/cNkQU/N+cFSA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM6PR01MB4038467F3EE3379826DE33E9CF170AM6PR01MB4038eurp_"
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa07e8b-b7bd-4a4e-3d57-08d6221f8548
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2018 13:13:29.3697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB4439
X-Mailman-Approved-At: Wed, 26 Sep 2018 09:51:13 +1000
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
X-List-Received-Date: Mon, 24 Sep 2018 13:14:30 -0000

--_000_AM6PR01MB4038467F3EE3379826DE33E9CF170AM6PR01MB4038eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Trying to set up a more efficient sensor monitoring for openpower sysem and=
 after a look in the openbmc code and occ we found a probem.

The problem that we were seeing was due to the fact that in the palmetto co=
nfiguration for openbmc, the openpower oem recipes are not activated.


Furthermore on inserting MQTT support in the openbmc image, we saw that mos=
quitto is already included in openembedded but it does not build properly b=
ecause it seems to have dependencies with openssl that it can't fix.


We are now working to activate them. Do you know by any chance if there is =
already a description on how to do it properly?

--_000_AM6PR01MB4038467F3EE3379826DE33E9CF170AM6PR01MB4038eurp_
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
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color: rgb(33, 33=
, 33); font-family: Calibri, sans-serif; font-size: 14.6667px;"><span>Tryin=
g to set up a more efficient sensor monitoring for openpower sysem and afte=
r a look in the openbmc code and occ
 we found a probem.</span></span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color: rgb(33, 33=
, 33); font-family: Calibri, sans-serif; font-size: 14.6667px;"><span></spa=
n>The problem that we were seeing was due to the fact that in the palmetto =
configuration for openbmc, the openpower
 oem recipes are not activated.</span><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color: rgb(33, 33=
, 33); font-family: Calibri, sans-serif; font-size: 14.6667px;"><br>
</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color: rgb(33, 33=
, 33); font-family: Calibri, sans-serif; font-size: 14.6667px;"><span>Furth=
ermore o</span>n inserting MQTT support in the openbmc image, we saw that m=
osquitto is already included in openembedded
</span><span style=3D"color: rgb(33, 33, 33); font-family: Calibri, sans-se=
rif; font-size: 14.6667px;">but it does not build properly because it seems=
 to have dependencies with openssl that it can't fix.</span><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color: rgb(33, 33=
, 33); font-family: Calibri, sans-serif; font-size: 14.6667px;"><span style=
=3D"color: rgb(33, 33, 33); font-family: Calibri, sans-serif; font-size: 14=
.6667px;"><span style=3D"color: rgb(33, 33, 33); font-family: Calibri, sans=
-serif; font-size: 14.6667px;"><span><br>
</span></span></span></span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"color: rgb(33, 33=
, 33); font-family: Calibri, sans-serif; font-size: 14.6667px;"><span style=
=3D"color: rgb(33, 33, 33); font-family: Calibri, sans-serif; font-size: 14=
.6667px;"><span style=3D"color: rgb(33, 33, 33); font-family: Calibri, sans=
-serif; font-size: 14.6667px;"><span><span style=3D"color: rgb(33, 33, 33);=
 font-family: Calibri, sans-serif; font-size: 14.6667px;">We
 are now working to activate them. Do you know by any chance if there is al=
ready a description on how to do it properly?</span><br>
</span></span></span></span></p>
</div>
</body>
</html>

--_000_AM6PR01MB4038467F3EE3379826DE33E9CF170AM6PR01MB4038eurp_--
