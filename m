Return-Path: <adi.gangidi@rackspace.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rackspace.com
 (client-ip=104.130.178.9; helo=esg01.rackspace.com;
 envelope-from=adi.gangidi@rackspace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raxglobal.onmicrosoft.com
 header.i=@raxglobal.onmicrosoft.com header.b="nlB9wveV"; 
 dkim-atps=neutral
X-Greylist: delayed 919 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Dec 2017 02:39:24 AEDT
Received: from esg01.rackspace.com (esg04.rackspace.com [104.130.178.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ywRvw2nzRzDqrG
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 02:39:23 +1100 (AEDT)
Received: from smtpout.rackspace.com (unknown [10.12.51.23])
 by Websense Email with ESMTPS id 06DF8A7A67132;
 Mon, 11 Dec 2017 15:24:01 +0000 (UTC)
Received: from 544124-OEXCH02.ror-uc.rackspace.com (10.12.51.22) by
 616645-OEXCH03.ror-uc.rackspace.com (10.12.51.23) with Microsoft SMTP Server
 (TLS) id 15.0.1293.1; Mon, 11 Dec 2017 09:24:00 -0600
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (207.46.163.19)
 by rackermail.rackspace.com (10.12.51.22) with Microsoft SMTP Server (TLS) id
 15.0.1293.1 via Frontend Transport; Mon, 11 Dec 2017 09:24:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raxglobal.onmicrosoft.com; s=selector1-rackspace-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UUwfN+AFoKcJLAvVtXLUl9grB3G6kC5yURYcPLlvVZw=;
 b=nlB9wveVmbQcMi4maVilygtyWPZSF+UQAXlYXcS0Xq4VWx9Yt9IWeF+zCDLr9O/Kpa1TiOPYdFIr8vqZW2V9+6rq8nkyFwdwCEamEMG6SUuGek8N649UNomI3CCUBW1QNklx/gzh1UK9vwu7H72BkZFx8mv0qA1t0xv/lRbJlMI=
Received: from DM5PR2001MB1018.namprd20.prod.outlook.com (10.172.89.144) by
 SN1PR20MB0494.namprd20.prod.outlook.com (10.163.224.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.302.9; Mon, 11 Dec 2017 15:23:59 +0000
Received: from DM5PR2001MB1018.namprd20.prod.outlook.com ([10.172.89.144]) by
 DM5PR2001MB1018.namprd20.prod.outlook.com ([10.172.89.144]) with
 mapi id 15.20.0302.014; Mon, 11 Dec 2017 15:23:58 +0000
From: Adi Gangidi <adi.gangidi@rackspace.com>
To: Jeremy Kerr <jk@ozlabs.org>, Jeremy Kerr <jmkerr@au1.ibm.com>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>, Bradley W Bishop <bradleyb@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "ryan.dc.yu@foxconn.com"
 <ryan.dc.yu@foxconn.com>
CC: Brad DeBauche <brad.debauche@RACKSPACE.COM>, Chad Somerlot
 <chad.somerlot@RACKSPACE.COM>, Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
Subject: Video vs Serial for BMC based host console
Thread-Topic: Video vs Serial for BMC based host console
Thread-Index: AQHTcpQQEAvDXgKfGEWq3cy+kf10IA==
Date: Mon, 11 Dec 2017 15:23:58 +0000
Message-ID: <DM5PR2001MB10183C72B6C4FE55827529E7E3370@DM5PR2001MB1018.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=adi.gangidi@rackspace.com; 
x-originating-ip: [173.173.120.219]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN1PR20MB0494;
 6:i56cZ07+OvUbiLN2GYgtOAdoAn+UXiImyCEn5PSsUqvTZd8o78be2qe4uSt0R1x8e6LJfCGkQknHAAphMOZpmOKpHSUZ5SpGjubcyyAwLOeUuSaRARhS7l+AusSa78SU9a7zxDXmSJEZi+NxT+FJ0dzHu2Fia3vBrTzT4HZ4bAOLQ8x03PFZrkkxOxESoWRBnLuZRD+u5ZKvacucZ319SpgmIoeTM0r3PQVFCP3xhbxbgkfrC4TbAKniT6MY0frb4ed6AREXSg46Ul9CSoha0hFzg5Ju7Ip8FZUFB+o4D/NwCQh2J+W2ND8vYIOcTMBAcFjYkZfBJgBLsey9G3kYdNosuQQATNU29mImKSH3DL4=;
 5:vBbgckhrhTYGeavFuysG5oXxMP8tGqjZpM32bW0jV09BLlFqz8wOAemeerJ1aW9BQUFupD4jIA6aWl7OXIGMogzIShwM7LcM/z+EOHTpzsvnXfMbbGH1KYGmuvkmuYSPwGVb3Fdcd2VXgwFxQt7RGofeFZkK9lnDZA85Rpbb4n4=;
 24:e4QcQfk7CShYLusUmjyY+X8eKjuUgNoj7i/1fLaN69hsF15wuGiMPImN4CkeOdQRu8/RFBd1E+5vbTo5Diyx+LtLRNRLMpCXaytMOuf1B/0=;
 7:TdCs5e2LVDm/K1O5TZunT08zLHs4hshquqO0W0IKO44O8goIn9kTAQVKhqi7MLo7abPYOBr1CUJMipQo9fQvNjZPE5WJH1WwB/Secpn+/s146QYxmlBM4PwFkZT0nszKlq9+3W/yDaUMTUg2ZdtIHNezNm2zp4MftNijpLZsNIHWgK0KmepwKLi6v0t5+MRV7ybrgANxNd7oCLwI26N7Ts6fFTHPeYqdwdkbCJRfLXBf1Pwgd5DIm9Llx0vrSPqN
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(189003)(199004)(6436002)(2906002)(54896002)(55016002)(77096006)(8936002)(9686003)(110136005)(8656006)(54906003)(478600001)(99286004)(4326008)(3280700002)(3660700001)(7736002)(68736007)(5660300001)(53936002)(107886003)(6506006)(2900100001)(7696005)(81156014)(81166006)(316002)(8676002)(97736004)(2501003)(106356001)(86362001)(105586002)(66066001)(19627405001)(6606003)(6116002)(3846002)(102836003)(74316002)(25786009)(33656002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR20MB0494;
 H:DM5PR2001MB1018.namprd20.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 6b52a1b4-68c4-4011-d18a-08d540ab335f
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307);
 SRVR:SN1PR20MB0494; 
x-ms-traffictypediagnostic: SN1PR20MB0494:
x-microsoft-antispam-prvs: <SN1PR20MB0494951F9897C02FC5F3D398E3370@SN1PR20MB0494.namprd20.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231022)(3002001)(6041248)(20161123560025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(201708071742011);
 SRVR:SN1PR20MB0494; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:SN1PR20MB0494; 
x-forefront-prvs: 0518EEFB48
received-spf: None (protection.outlook.com: rackspace.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DM5PR2001MB10183C72B6C4FE55827529E7E3370DM5PR2001MB1018_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b52a1b4-68c4-4011-d18a-08d540ab335f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2017 15:23:58.7202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 570057f4-73ef-41c8-bcbb-08db2fc15c2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR20MB0494
X-OriginatorOrg: rackspace.com
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Dec 2017 15:39:25 -0000

--_000_DM5PR2001MB10183C72B6C4FE55827529E7E3370DM5PR2001MB1018_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi OpenBMC Team

(Jeremy, Adriana, Brad and others),


I've been noticing some chats in IRC around video vs serial from BMC consol=
e.


This coincides with Rackspace internal ask for a video based console ultima=
tely via openBMC Web UI instead of serial console. To start with I want to =
work on patches for just the availability of feature and later worry about =
integrating into the UI.


More operational efficiency this is needed for seamless continuity in exper=
ience of supporting OpenBMC based systems compared to traditional OEM syste=
ms by our internal customer support teams.


Before I start down that route, I wanted to ask you following questions:

a) Is this in your plan to implement in the near future ? If so, when ?

b) Has any progress made this implementation easier by someone else?

c) If answer is no to above questions, can one of you, please let us know s=
teps in which we should go through about adding this feature, from scratch?


Any pointers on similar reference implementations, available with appropria=
te licenses would be greatly appreciated as well.


-Adi Gangidi

System Design Engineer - Barreleye Systems

Rackspace Hosting

--_000_DM5PR2001MB10183C72B6C4FE55827529E7E3370DM5PR2001MB1018_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi OpenBMC Team&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0">(Jeremy, Adriana, Brad and others=
),</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I've been noticing some chats in =
IRC around video vs serial from BMC console.&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">This coincides&nbsp;with Rackspac=
e internal ask for a video&nbsp;based&nbsp;console ultimately&nbsp;via open=
BMC Web UI instead of serial console.&nbsp;<span style=3D"font-family: Cali=
bri, Helvetica, sans-serif, Helvetica, EmojiFont, &quot;Apple Color Emoji&q=
uot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quo=
t;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;">To
 start with I want to work on patches for&nbsp;</span><span style=3D"font-f=
amily: Calibri, Helvetica, sans-serif, Helvetica, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;">j=
ust
 the availability of feature and later worry about integrating into the UI.=
</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">More operational efficiency this =
is needed for seamless continuity in experience&nbsp;of supporting&nbsp;Ope=
nBMC based systems compared to traditional OEM systems&nbsp;by our internal=
 customer support&nbsp;teams.&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Before I start down that route, I=
 wanted to ask you following questions:</p>
<p style=3D"margin-top:0;margin-bottom:0">a) Is this in your plan to implem=
ent in the near future ? If so, when ?</p>
<p style=3D"margin-top:0;margin-bottom:0">b) Has any progress made this imp=
lementation easier by someone else?&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0">c) If answer is no to above quest=
ions, can one of you, please let us know&nbsp;steps in which we should go t=
hrough&nbsp;about adding&nbsp;this feature, from scratch?</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Any pointers on similar reference=
 implementations,&nbsp;available with appropriate licenses&nbsp;would be gr=
eatly appreciated as well.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">-Adi Gangidi</p>
<p style=3D"margin-top:0;margin-bottom:0">System Design Engineer&nbsp;- Bar=
releye Systems</p>
<p style=3D"margin-top:0;margin-bottom:0">Rackspace Hosting</p>
<div id=3D"Signature"></div>
</div>
</body>
</html>

--_000_DM5PR2001MB10183C72B6C4FE55827529E7E3370DM5PR2001MB1018_--
