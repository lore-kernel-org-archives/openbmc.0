Return-Path: <shays@mellanox.com>
X-Greylist: delayed 943 seconds by postgrey-1.35 at bilbo;
 Wed, 20 Apr 2016 01:12:07 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=AsqZYSgB; 
 dkim-atps=neutral
Received: from emea01-am1-obe.outbound.protection.outlook.com
 (mail-am1on0087.outbound.protection.outlook.com [157.56.112.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qq7lq1T5rzDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 01:12:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6HqLWydWv+kG7xfGzOXWByeKjNt609jqnQisUz00+zs=;
 b=AsqZYSgBOij/n4efwmn6ceIi607vD9YLoSTeMvuK1EpGiMCxAh3knAc2Zcebn1w3vj4T0JEsqB0egij8yhM0+Qb6e4V8HACrb5dqb/7yV22SJPiJOngBr/2tG8ahodfw+lTMWpExE2Qo8OOHZRROm/zcujY+J1lvjFJvSK9XPHM=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) with Microsoft SMTP
 Server (TLS) id 15.1.453.26; Tue, 19 Apr 2016 14:56:15 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0453.032; Tue, 19 Apr 2016 14:56:15 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Several general questions
Thread-Topic: Several general questions
Thread-Index: AdGaShEMFapWaepKQmKUQ5Lg9DJbFQ==
Date: Tue, 19 Apr 2016 14:56:15 +0000
Message-ID: <DB4PR05MB0941E4F3E91B9059E718B644D56C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=mellanox.com;
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: f7d0a693-2615-4dd7-2a97-08d36862c1ce
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0941;
 5:a3kLKYnvbqyUkurqw0YkbSPfe5+uo5rOhOCejDPMTpbJqTEm76kdLAfMTiEt/mNdtrjV58nPkWsCEvZBue6nTghbvLJYXmGnTEEt6MnYNf/bzs+jlG8qK+no9o3V9QEBoyJlOf3yQGUSisU+OYih5Q==;
 24:sOZ51SO235CTkLyGmqVMWNgFJu/5EBOThsVNa7X5aE2ycO0nY+NH2m6RMQN3NKq/FkbvXc54Y8nFW1WKFp2SfKwqGMqFJQ/QeQXllaxe8UM=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0941;
x-microsoft-antispam-prvs: <DB4PR05MB0941A545270D7BD15A6D0330D56C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(9101521026)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
 SRVR:DB4PR05MB0941; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0941; 
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(107886002)(110136002)(10400500002)(2501003)(586003)(189998001)(19625215002)(19300405004)(122556002)(74316001)(345774005)(19580395003)(1220700001)(1096002)(5004730100002)(6116002)(790700001)(3846002)(16236675004)(81166005)(229853001)(3480700003)(3660700001)(33656002)(2351001)(50986999)(2906002)(9686002)(76576001)(3280700002)(54356999)(102836003)(5003600100002)(86362001)(2900100001)(450100001)(92566002)(66066001)(77096005)(5008740100001)(15975445007)(11100500001)(87936001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0941;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB4PR05MB0941E4F3E91B9059E718B644D56C0DB4PR05MB0941eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2016 14:56:15.4782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0941
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 15:12:08 -0000

--_000_DB4PR05MB0941E4F3E91B9059E718B644D56C0DB4PR05MB0941eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We have some general questions from our latest experience with the project:

1. We saw some corresponding about out of the box experience and we were wo=
ndering how does the BMC should be burnt for the first time in production. =
Currently we have limited speed of debug UART on AST2520, also Aspeed recom=
mend to use this interface for debug purpose only. We also faced a problem =
to burn BMC using Abatron BDI3000, does anyone have experience working with=
 it?

2. Several u-boot versions were mentioned this week at mailing list, we cur=
rently use u-boot based on 2013.7 with porting AST2520 stuff from Aspeed EV=
B u-boot. Can you suggest a u-boot version to merge with?

3. Is there some standard method performing BMC upgrade on site from host C=
PU? Is there a best practice of upgrade granularity? Meaning, do you sugges=
t to upgrade whole image or maybe just specific partition (only DTB for exa=
mple)?

4. We saw that most openbmc systems are using jffs2 file system. We thought=
 to use ubifs as it has some advantages over jffs2. Can you share the motiv=
ation of using jffs2 for BMC project and is there special reason for doing =
so?

5. Some Aspeed EVB drivers such as USB, PWM were not ported to openbmc kern=
el tree yet. We were planning to port them and wonder if there is any speci=
al reason they weren't ported yet.

6. Building the project yields a lot of files under the "deploy" folder of =
build. We were wondering which files to use for simply flashing a system (u=
sing flashcp?) and which should be used for production.

Thank you for your assistance,
Shay


--_000_DB4PR05MB0941E4F3E91B9059E718B644D56C0DB4PR05MB0941eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have some general questions from our latest exper=
ience with the project:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. We saw some corresponding about out of the box ex=
perience and we were wondering how does the BMC should be burnt for the fir=
st time in production. Currently we have limited speed of debug UART on AST=
2520, also Aspeed recommend to use
 this interface for debug purpose only. We also faced a problem to burn BMC=
 using Abatron BDI3000, does anyone have experience working with it?<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. Several u-boot versions were mentioned this week =
at mailing list, we currently use u-boot based on 2013.7 with porting AST25=
20 stuff from Aspeed EVB u-boot. Can you suggest a u-boot version to merge =
with?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3. Is there some standard method performing BMC upgr=
ade on site from host CPU? Is there a best practice of upgrade granularity?=
 Meaning, do you suggest to upgrade whole image or maybe just specific part=
ition (only DTB for example)?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">4. We saw that most openbmc systems are using jffs2 =
file system. We thought to use ubifs as it has some advantages over jffs2. =
Can you share the motivation of using jffs2 for BMC project and is there sp=
ecial reason for doing so?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">5. Some Aspeed EVB drivers such as USB, PWM were not=
 ported to openbmc kernel tree yet. We were planning to port them and wonde=
r if there is any special reason they weren&#8217;t ported yet.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">6. Building the project yields a lot of files under =
the &#8220;deploy&#8221; folder of build. We were wondering which files to =
use for simply flashing a system (using flashcp?) and which should be used =
for production.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for your assistance,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB4PR05MB0941E4F3E91B9059E718B644D56C0DB4PR05MB0941eurp_--
