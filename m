Return-Path: <hpham@amperecomputing.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=amperecomputing.com
 (client-ip=40.107.72.128; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=hpham@amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amperecomputing.com header.i=@amperecomputing.com
 header.b="XCeqBws/"; dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720128.outbound.protection.outlook.com [40.107.72.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Vyg53DZ2zF35L
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 23:29:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amperecomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUVc5HTWNM6ojKDyhuoI0B31A8tMlsnU3j77cGpPxmE=;
 b=XCeqBws/zJErknHJLU5h39MMronLwqHeEUpfq1mEY3zLHp36o8t1RKI+ek/ifyWWo22w+Dulk149Pb90eq8zpl68JWWvtq61Gf39Bu6ASJNN2y2T9nKI8o4NF/SZ3g191iTEsggTD27AgBItVaTxjyn8uxEfp9Mm6Rx0sx3xKHE=
Received: from SN6PR0102MB3549.prod.exchangelabs.com (52.132.114.146) by
 SN6PR0102MB3359.prod.exchangelabs.com (52.132.113.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.952.21; Wed, 18 Jul 2018 13:29:32 +0000
Received: from SN6PR0102MB3549.prod.exchangelabs.com
 ([fe80::6402:67f2:732f:d51c]) by SN6PR0102MB3549.prod.exchangelabs.com
 ([fe80::6402:67f2:732f:d51c%5]) with mapi id 15.20.0952.017; Wed, 18 Jul 2018
 13:29:32 +0000
From: Hien V Pham <hpham@amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: CCLA from Ampere Computing LLC
Thread-Topic: CCLA from Ampere Computing LLC
Thread-Index: AQHUHNu3mmnKTFNyb0Kx4Z+YVNxEHqSU/A+AgAAA5Pw=
Date: Wed, 18 Jul 2018 13:29:32 +0000
Message-ID: <SN6PR0102MB35490377A5544A5018D67BCCB7530@SN6PR0102MB3549.prod.exchangelabs.com>
References: <SN6PR0102MB35494AF52D9EF072B975142BB75D0@SN6PR0102MB3549.prod.exchangelabs.com>,
 <1FF06831-9044-4BE8-8205-854B3ADAB9B2@fuzziesquirrel.com>
In-Reply-To: <1FF06831-9044-4BE8-8205-854B3ADAB9B2@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hpham@amperecomputing.com; 
x-originating-ip: [1.53.229.231]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR0102MB3359;
 7:lFOWnvqeLpkz9gaXR4lXaGW1PJbMiaegoDSl3fEvkkotejM0QeKefw6C/0bcB+BfrMGaLMSPKi9zcVq9NZ3ZI851pI12oEhGIFFxWAuwCaGtuAtIHWZHA45Z7HDtAdslSqSqn9Nb0hFJoW/QHKABgWi84TT3hn282RK0+zIaKQYQ0RSOrUhRcBo+sWxWjb0xQbh6kahftXlTq4r56O1nZU+ZDM4X1niaXRiDCHFJRawcQzXVuTab0GZ5WB5BXHvp
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 62bba96d-c35b-4591-fe70-08d5ecb27f20
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR0102MB3359; 
x-ms-traffictypediagnostic: SN6PR0102MB3359:
x-microsoft-antispam-prvs: <SN6PR0102MB335921251A4983D91C9215E0B7530@SN6PR0102MB3359.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(65623756079841);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231311)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011)(7699016);
 SRVR:SN6PR0102MB3359; BCL:0; PCL:0; RULEID:; SRVR:SN6PR0102MB3359; 
x-forefront-prvs: 0737B96801
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39840400004)(376002)(346002)(366004)(199004)(189003)(53754006)(6606003)(7736002)(2906002)(6306002)(236005)(68736007)(186003)(102836004)(11346002)(2900100001)(97736004)(26005)(5250100002)(6246003)(446003)(9686003)(476003)(7696005)(3846002)(53936002)(74316002)(99286004)(5024004)(256004)(53546011)(6506007)(76176011)(66066001)(54896002)(6116002)(55016002)(486006)(14444005)(105586002)(33656002)(6436002)(81156014)(316002)(81166006)(25786009)(8676002)(606006)(86362001)(106356001)(229853002)(4326008)(19627405001)(8936002)(478600001)(14454004)(5660300001)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR0102MB3359;
 H:SN6PR0102MB3549.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amperecomputing.com does not
 designate permitted sender hosts)
x-microsoft-antispam-message-info: H3NlxBpawZJ1P/bpnqs1KFDhGJD8w2nu57hRU0tGVtji80YhNH5RVGCjUTIDPSabcqcTIeUpZhns9srHT2sWdpTAkGNH0rFNwF/s13ZT7as0r2DNydEUiKasMKrPMTd+cDmQR3obJgeyBf81cHO/1X+E231+8FLwKYmRXH/+w+ABMWYNJAjHvADjBGB/vck0q42nY+xX7hGK1zGqNLlE/GC9+/HcN1E4LyQsaeWG9uJrlTnXe3/JSSU3cW0Mywlw4ZFW9dZ2TeZ7N2TeTpEJ4ozHzga6t1q6PMq63nqLg4M2gPJ7jk7suduvaytf5M2afD8PTj8b/AocTaXjxQEDUa+KyxJeDNtBHFOr+T4aWZU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_SN6PR0102MB35490377A5544A5018D67BCCB7530SN6PR0102MB3549_"
MIME-Version: 1.0
X-OriginatorOrg: amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bba96d-c35b-4591-fe70-08d5ecb27f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2018 13:29:32.2714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3359
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 13:29:40 -0000

--_000_SN6PR0102MB35490377A5544A5018D67BCCB7530SN6PR0102MB3549_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank, Brad!

________________________________
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Sent: Wednesday, July 18, 2018 8:26:09 PM
To: Hien V Pham
Cc: openbmc@lists.ozlabs.org
Subject: Re: CCLA from Ampere Computing LLC

[NOTICE: This email originated from an external sender. Please be mindful o=
f safe email handling and proprietary information protection practices.] __=
___________________________________________________________________________=
___________________________________________

> On Jul 16, 2018, at 4:09 AM, Hien V Pham <hpham@amperecomputing.com> wrot=
e:
>
> Hi all,
>
> I'm Hien Pham from OpenBMC team of Ampere Computing LLC (https://ampereco=
mputing.com/).

Hi Hien.  Your CLA has been accepted.  Thanks and welcome to the community!

>
> I would like to submit the Corporate CLA (attached), please help to revie=
w and let me know if there is any issue.
>
> Thank and best regards,
>
> Hien Pham
> Ampere Computing | Products for the Future of the Cloud ...
> amperecomputing.com
> Products for the Future of the Cloud and Data Center. Learn More. Registe=
r for early release product information
>
> Attached is
> <Ampere_Computing_OpenBMC.CCLA.pdf>

--_000_SN6PR0102MB35490377A5544A5018D67BCCB7530SN6PR0102MB3549_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Thank, Brad!</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Brad Bishop &lt;bradl=
eyb@fuzziesquirrel.com&gt;<br>
<b>Sent:</b> Wednesday, July 18, 2018 8:26:09 PM<br>
<b>To:</b> Hien V Pham<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: CCLA from Ampere Computing LLC</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[NOTICE: This email originated from an external se=
nder. Please be mindful of safe email handling and proprietary information =
protection practices.] ____________________________________________________=
____________________________________________________________________<br>
<br>
&gt; On Jul 16, 2018, at 4:09 AM, Hien V Pham &lt;hpham@amperecomputing.com=
&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I'm Hien Pham from OpenBMC team of Ampere Computing LLC (<a href=3D"ht=
tps://amperecomputing.com/">https://amperecomputing.com/</a>).<br>
<br>
Hi Hien.&nbsp; Your CLA has been accepted.&nbsp; Thanks and welcome to the =
community!<br>
<br>
&gt;<br>
&gt; I would like to submit the Corporate CLA (attached), please help to re=
view and let me know if there is any issue.<br>
&gt;<br>
&gt; Thank and best regards,<br>
&gt;<br>
&gt; Hien Pham<br>
&gt; Ampere Computing | Products for the Future of the Cloud ...<br>
&gt; amperecomputing.com<br>
&gt; Products for the Future of the Cloud and Data Center. Learn More. Regi=
ster for early release product information<br>
&gt;<br>
&gt; Attached is<br>
&gt; &lt;Ampere_Computing_OpenBMC.CCLA.pdf&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR0102MB35490377A5544A5018D67BCCB7530SN6PR0102MB3549_--
