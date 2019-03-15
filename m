Return-Path: <Maksym_Yepaneshnikov@Jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.79.134; helo=nam03-co1-obe.outbound.protection.outlook.com;
 envelope-from=maksym_yepaneshnikov@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.com header.i=@jabil.com header.b="ihQ7+yYp"; 
 dkim-atps=neutral
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790134.outbound.protection.outlook.com [40.107.79.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44LTN367dbzDq6q
 for <openbmc@lists.ozlabs.org>; Sat, 16 Mar 2019 02:02:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK+97OTRrE8f1L+wt3KBdVqfryDphD4egFVroqgwTF8=;
 b=ihQ7+yYpeS/PRxxqsuMwktBGsSnJT1N66Kcwt0/4nP2ZBrWy5/hpfpeaaf9+rO7gYXaH4z75K32SHYjg7X+/6SggyVlx2tz8LLAlmBqg1uqusbUZZhqAn2UifgcPIxAZaJPb4ES3JxY6q/KV1e6P2y7amz03dLLSKqqoZGE4ywc=
Received: from SN6PR02MB5472.namprd02.prod.outlook.com (20.177.250.87) by
 SN6PR02MB4383.namprd02.prod.outlook.com (52.135.119.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Fri, 15 Mar 2019 15:02:53 +0000
Received: from SN6PR02MB5472.namprd02.prod.outlook.com
 ([fe80::1c1a:5227:e054:3ecb]) by SN6PR02MB5472.namprd02.prod.outlook.com
 ([fe80::1c1a:5227:e054:3ecb%2]) with mapi id 15.20.1686.021; Fri, 15 Mar 2019
 15:02:52 +0000
From: Maksym Yepaneshnikov <Maksym_Yepaneshnikov@Jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: QA & DMTF tools: Redfish-JsonSchema-ResponseValidator
Thread-Topic: QA & DMTF tools: Redfish-JsonSchema-ResponseValidator
Thread-Index: AdTbP8e0VjTiCuAmTd+3Utz0lMFpxQ==
Date: Fri, 15 Mar 2019 15:02:52 +0000
Message-ID: <SN6PR02MB5472D31CEC46988ADA4564D0EE440@SN6PR02MB5472.namprd02.prod.outlook.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Maksym_Yepaneshnikov@Jabil.com; 
x-originating-ip: [188.230.122.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf9e683c-e341-4848-e642-08d6a9574c72
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(49563074)(7193020);
 SRVR:SN6PR02MB4383; 
x-ms-traffictypediagnostic: SN6PR02MB4383:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <SN6PR02MB43836B0402A376C6E313B466EE440@SN6PR02MB4383.namprd02.prod.outlook.com>
x-forefront-prvs: 09778E995A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(316002)(66066001)(81156014)(1730700003)(52536014)(8936002)(33656002)(486006)(105586002)(72206003)(2351001)(478600001)(106356001)(3846002)(2906002)(790700001)(6116002)(71190400001)(71200400001)(6436002)(2501003)(99936001)(7696005)(97736004)(186003)(6506007)(74316002)(7736002)(99286004)(26005)(5640700003)(55016002)(54896002)(733005)(9686003)(54556002)(861006)(102836004)(6306002)(606006)(6916009)(476003)(5660300002)(81166006)(966005)(14454004)(8676002)(236005)(53936002)(86362001)(80792005)(25786009)(256004)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB4383;
 H:SN6PR02MB5472.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: Jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z2Onsvn308cdqM7gYo6keXqgWffX8a9/khWh4mAop5ey/2RpS3P+9lcz20YcPpYLmk3wGoeJqhOg7O1GQ5+amtrEhIOe3TvJYjmJhbTaTolRkesSLCqebDwWQViGn30vBzGSleYaR1ymaaQN56rT5sh4SdQE9EImx9rXQdmfaaQ0/96uWDR1ZabOra9E+lIlMZdjlGJKcsnh2DkSnpR4/uLVpjMEeQEohsNU0CnUm4MlCb3n6zyB0kcgkm2K9nBhCgYnby7IELHAdLFpSy98yIaUaWBaIiMgidnhBU3AIzd3DKulwWkGlEFVKVwwJGA5OT+MsfmX/UHvN8RfRUKkCTipxHmuo3Htq9eApYnni1KezC1k/lnzdTXtEexFU+HNMMWJ3LWBNRtjh1AKoecaxg5d2EiCVblSwXlC+AfyKUo=
Content-Type: multipart/related;
 boundary="_004_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9e683c-e341-4848-e642-08d6a9574c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2019 15:02:52.8190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4383
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
X-List-Received-Date: Fri, 15 Mar 2019 15:03:01 -0000

--_004_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_
Content-Type: multipart/alternative;
	boundary="_000_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_"

--_000_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi, all!

I'm trying to execute DMTF test vs OpenBMC system (QEMU, WitherSpoon)
Link to original DMTF test: https://github.com/DMTF/Redfish-JsonSchema-Resp=
onseValidator
(it is doing a validation JSON resource against DMTF provided JSON schemas)

By design, the test could be done using online-schema (http://redfish.dmtf.=
org/schemas/v1/) or locally saved-schema.

If the test is done using the online schema:
* problems were observed: https://github.com/openbmc/bmcweb/issues/58
* they are caused by missed JSON files: Manager.v1_3_0.json, ComputerSystem=
.v1_6_0.json

If the test is done using locally-saved-schema:
1. Saved /redfish/v1/ resources from the DMTF
(https://github.com/openbmc/bmcweb/files/2966955/schema.tar.gz )

2. Saved https://github.com/openbmc/bmcweb/blob/master/static/redfish/v1/Js=
onSchemas/OemManager/index.json
as Manager.v1_3_0.json

3. Saved https://raw.githubusercontent.com/openbmc/bmcweb/master/static/red=
fish/v1/JsonSchemas/ComputerSystem/index.json  as ComputerSystem.v1_6_0.jso=
n

* test passed with out problems

The questions are:
Maybe there is a more simple way to save/collect recourses?
Is it possible to have a common-storage with needed files?

Current actions are complicated and could lead to problems (and creation of=
 the non-needed issues)
List of the needed files could be changed w/o any notifications for the QA.

Maksym Yepaneshnikov
Lead SW Dev Test Engineer
UA05 Kharkov, Enterprise & Infrastructure,  OP04 Operations
Jabil Software Services
[https://az745219.vo.msecnd.net/content/email-imgs/JabilLogoSignature.png]
63, Kolomenskaya st, Kharkiv
www.jabil.com


--_000_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:2.0cm 42.5pt 2.0cm 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, all!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I'm trying to execute DMTF test vs OpenBMC system (Q=
EMU, WitherSpoon)<o:p></o:p></p>
<p class=3D"MsoNormal">Link to original DMTF test: <a href=3D"https://githu=
b.com/DMTF/Redfish-JsonSchema-ResponseValidator">
https://github.com/DMTF/Redfish-JsonSchema-ResponseValidator</a> <o:p></o:p=
></p>
<p class=3D"MsoNormal">(it is doing <b>a validation JSON resource against D=
MTF provided JSON schemas</b>)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>By design, the test could be done using online-sc=
hema (http://redfish.dmtf.org/schemas/v1/) or locally saved-schema.<o:p></o=
:p></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>If the test is done using the online schema</b>:<=
o:p></o:p></p>
<p class=3D"MsoNormal">* problems were observed: <a href=3D"https://github.=
com/openbmc/bmcweb/issues/58">
https://github.com/openbmc/bmcweb/issues/58</a> <o:p></o:p></p>
<p class=3D"MsoNormal">* they are caused by missed JSON files: Manager.v1_3=
_0.json, ComputerSystem.v1_6_0.json<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>If the test is done using locally-saved-schema:<o=
:p></o:p></b></p>
<p class=3D"MsoNormal">1. Saved /redfish/v1/ resources from the DMTF <o:p><=
/o:p></p>
<p class=3D"MsoNormal">(<a href=3D"https://github.com/openbmc/bmcweb/files/=
2966955/schema.tar.gz">https://github.com/openbmc/bmcweb/files/2966955/sche=
ma.tar.gz</a> )
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. Saved <a href=3D"https://github.com/openbmc/bmcwe=
b/blob/master/static/redfish/v1/JsonSchemas/OemManager/index.json">
https://github.com/openbmc/bmcweb/blob/master/static/redfish/v1/JsonSchemas=
/OemManager/index.json</a>
<o:p></o:p></p>
<p class=3D"MsoNormal">as Manager.v1_3_0.json<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3. Saved <a href=3D"https://raw.githubusercontent.co=
m/openbmc/bmcweb/master/static/redfish/v1/JsonSchemas/ComputerSystem/index.=
json">
https://raw.githubusercontent.com/openbmc/bmcweb/master/static/redfish/v1/J=
sonSchemas/ComputerSystem/index.json</a> &nbsp;as ComputerSystem.v1_6_0.jso=
n<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">* test passed with out problems<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>The questions are: <o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>Maybe there is a more simple way to save/collect =
recourses?<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>Is it possible to have a common-storage with need=
ed files?
<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal"><b>Current actions are complicated and could lead to=
 problems (and creation of the non-needed issues)<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>List of the needed files could be changed w/o any=
 notifications for the QA.<o:p></o:p></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#006FC9;mso-fareast-language:EN=
-GB">Maksym Yepaneshnikov<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Helvetica&quot;,sans-serif;color:#4BA524;mso-fareast-language:EN-GB">Lead S=
W Dev Test Engineer</span></b><span style=3D"font-size:9.0pt;font-family:&q=
uot;Helvetica&quot;,sans-serif;color:#4BA524;mso-fareast-language:EN-GB"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Helvetica&quot;,sans-serif;color:#4BA524;mso-fareast-language:EN-GB">UA05 K=
harkov,&nbsp;Enterprise &amp; Infrastructure,&nbsp;&nbsp;OP04 Operations<o:=
p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.5pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:#008A5E;mso-fareast-language:EN-GB=
">Jabil Software Services<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:9.0pt;fon=
t-family:&quot;Arial&quot;,sans-serif;color:#38761D;mso-fareast-language:EN=
-GB"><img border=3D"0" width=3D"136" height=3D"24" style=3D"width:1.4166in;=
height:.25in" id=3D"Picture_x0020_1" src=3D"cid:image001.png@01D4DB50.EB679=
DD0" alt=3D"https://az745219.vo.msecnd.net/content/email-imgs/JabilLogoSign=
ature.png"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Helvetica&quot;,sans-serif;color:#4472C4;mso-fareast-language:EN-GB">63, Ko=
lomenskaya st, Kharkiv<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Helvetica&quot;,sans-serif;color:#4472C4;mso-fareast-language:EN-GB">www.ja=
bil.com<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_--

--_004_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=1001;
	creation-date="Fri, 15 Mar 2019 15:02:51 GMT";
	modification-date="Fri, 15 Mar 2019 15:02:51 GMT"
Content-ID: <image001.png@01D4DB50.EB679DD0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAIgAAAAYCAYAAAAh3LURAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA4tJREFUeNrsWj9v00AUv1gGqSrQRLRMDO7IhPsFwJkZSNUP0HyD2guM
TkZY0nyCph8ANRmY67Ay4LUDkhk7IIwEJDRpwrtwrpLz2c7Zl8RO/KSTJf95vrv3/Lvf750Ryi23
ECskdXD/6N0l4/T5zYe3rYR+VTg0GJfq4NsSMXh4RxUOx4Ln1IbW4ekj9AOPU407hwHjsOF5I+lg
ZAETojHOdQX4bQT4VqDtCwqmEvCOpPOhQ9AMCNDpnM+ojH50VzyOiUlphDWY3ErIgBW4rmcAnRvQ
TyXrS4yU1smNuG7C5BczML9a1hNETluHIPA1AplhhpPDhGYsoAsWLA3lGIjXYPQ7RxDByYEDf0Kd
djExZdyupwXCIaHamFSuo4pJ2xJjEnSYtiYEoEbUAW1nuRDdkAQhaKAz0MNTAqzlRIPntDyMm4Eg
ZwE1D5fAOK4rWGlEEZLcrHqKlfUESQVJJShAI4HDqCPUGfdNZC9HzSFSeYC/sQA/tqiCXq5iaBSQ
hmjw9AtCb17NVGlv0Cck9fzqdiwNTbj3Ne9LB4PPSqH/CEm/d6E9FjUWjHitAGKd7QQhKkIlrQ1f
gLME9KjScnC4+xWN7/UUlkwcbblBslfjCCD+sjvy9bOXhb8PqoKHVGQQ7WwnCATpgiTFdECwanAW
nBxFRBXFxnIfjR5ei3yNlxDdyfH9xzs1VDh6oQTcb3P4VxkJUSXnD9YFQSorer9OT+4toIcA8xKi
PZ0QHNyhHCPRLygUUzE6Jt203FgOQpi/OYMeWz/RaPs7vxQDXlLo7/w/9nbKyyaHWGnBeLosAp2T
1Pjm22+5LX2b+yvHKAEcoir9KRXRSKYJ7z7KLbt1ECJrKz70YBNQRLgQlrGH0EqwbBxAM6Rfe00q
Oe5kbx7abCOISZ8YPrmiE2KaWAaRZZw0xwwox7u9La/ItiR7vmkJcgmTnEQ5hMlabVa6/nBBvUyk
Z0RCsNb+OvJXU5Ps9qoBf8nxKplVm4iCX1meWtNVgZ2zQ9i+6SeZpSYkRS0mQWyBX5OBIni3F/+2
x6tieGoqUeZkHUE8DtIR6NMJURE6I5AO2a1NYsa8RHiJZk9k9jokCAnQqaAv5jBE1p4wLiUuSZP/
MawAmF1FjQfXPspL5kCL5SD4D2iynnsVVR4Nj4PjRsA59tdkLRGCxmIgdsGvGNFvkYjhxqzBnCP/
T8oW5/wvwpx/AgwA1Gs0XYRI1M0AAAAASUVORK5CYII=

--_004_SN6PR02MB5472D31CEC46988ADA4564D0EE440SN6PR02MB5472namp_--
