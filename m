Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.0.69; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="toTF7kFS";
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00069.outbound.protection.outlook.com [40.107.0.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44LWrB1YZTzDqTL
 for <openbmc@lists.ozlabs.org>; Sat, 16 Mar 2019 03:54:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syqEyQbQls2B2I4sDNabIspTueWjifBY8aILMd+zCXE=;
 b=toTF7kFSm5xLmuU702g5W+p1r8kIUWrRUGjZshveJ6grtarxIeMV6STWJy6FZ3eXX332U4l5ttkaXUfAo5lAXZodF37XgPEkU/gpOOUnVKKEumL7a4dfkvsyWvOQLVn8abZl0u5djK29LgU/G1DTJrMMMRyxZlTVc9Y+SLw7HfA=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB4032.eurprd05.prod.outlook.com (52.134.18.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Fri, 15 Mar 2019 16:53:54 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16%3]) with mapi id 15.20.1686.021; Fri, 15 Mar 2019
 16:53:54 +0000
From: David Thompson <dthompson@mellanox.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Default root password: 2.4 vs. 2.6
Thread-Topic: Default root password: 2.4 vs. 2.6
Thread-Index: AdTalCKjrpRs5fklQweCqWufFoV6UgAajD4AABROEbA=
Date: Fri, 15 Mar 2019 16:53:54 +0000
Message-ID: <VI1PR0502MB38695144C9AEB761558A0D64DD440@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <VI1PR0502MB3869542E3098EFB729045C0EDD4B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <06734015-2e4f-1d89-0ed0-8b41b06ac60a@linux.intel.com>
In-Reply-To: <06734015-2e4f-1d89-0ed0-8b41b06ac60a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20e0517c-db69-40d4-b018-08d6a966cf00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB4032; 
x-ms-traffictypediagnostic: VI1PR0502MB4032:
x-microsoft-antispam-prvs: <VI1PR0502MB40328623AE44952F1B6AE79DDD440@VI1PR0502MB4032.eurprd05.prod.outlook.com>
x-forefront-prvs: 09778E995A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(6436002)(99286004)(486006)(229853002)(54896002)(53546011)(81156014)(55016002)(6306002)(81166006)(6506007)(25786009)(8676002)(105586002)(76176011)(26005)(9686003)(86362001)(6246003)(102836004)(186003)(7696005)(53936002)(14454004)(52536014)(476003)(11346002)(446003)(5660300002)(3846002)(6116002)(790700001)(68736007)(478600001)(66066001)(33656002)(7736002)(8936002)(2906002)(2501003)(74316002)(71190400001)(97736004)(106356001)(71200400001)(316002)(110136005)(14444005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB4032;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mMElJXDoDB6wYr1A/oHbofp6dMMrCR+Kn4hjDTvTFQfdJMpz7LXtcHoDTVwZQzB8USpdkr1sKDtZMiEdw3ToeF6+xaiXIn+77v8otTX7nWLHq4XNMs+Ga3+d7xwyJQEuggdX5GjrUxLzBpTXgnj/9N7+3GJh5n4V1YpOtlDm7NxhbqkupzXAPYntXdXqp1o2uS4V/Tu4on4Aascwf4SYpPN3zTv2GrYIJVhwi9KnFHgcr8Ik/ydGrJ7gag+nOSoPjx5UXdgEOmAeaOAs/IEvvOYDvBNYMDvYHJsHeYcXMNoNxRApL6yvd/OkwIj2/qz4CdyoTDFzUliS9zKqpOvAaNSbqphZtiv61VR3R1dQX/gxGzE2WiBYO/R2WQOOZhk0G1f2X0Ez7fTG/Y8de70pOzr/JHeSf5pzCQQaCWVOk+g=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0502MB38695144C9AEB761558A0D64DD440VI1PR0502MB3869_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e0517c-db69-40d4-b018-08d6a966cf00
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2019 16:53:54.2980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB4032
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
X-List-Received-Date: Fri, 15 Mar 2019 16:54:04 -0000

--_000_VI1PR0502MB38695144C9AEB761558A0D64DD440VI1PR0502MB3869_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you Richard, that method did work.

I was not utilizing the 'append' keyword properly.


  *   Dave


David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: +1 508-475-6375



From: Thomaiyar, Richard Marian <richard.marian.thomaiyar@linux.intel.com>
Sent: Friday, March 15, 2019 3:12 AM
To: David Thompson <dthompson@mellanox.com>; openbmc@lists.ozlabs.org
Subject: Re: Default root password: 2.4 vs. 2.6


Hi Dave,

you should be able to override it in your local.conf.sample, please make su=
re you are using append and correct image name



(in local.conf.sample)

INHERIT +=3D "extrausers"

EXTRA_USERS_PARAMS_append_pn-obmc-phosphor-image  =3D " \

usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \

"

or add your own image name (instead of obmc-phosphor-image after append_pn)=
 for which you are building. With this it will override.

Let me know if you are facing any problem with this method.



regards,

Richard



On 3/15/2019 12:05 AM, David Thompson wrote:
When we transitioned our OpenBMC baseline from 2.4 to 2.6
we noticed that the default root password for our platform has
changed to "0penBmc".  This appears to come from the file:
meta-phosphor/conf/distro/include/phosphor-defaults.inc:
usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root;
And this password setting overrides the password we had chosen
in our machine's local.conf.sample.    We experimented but could not
find a way to prevent this override behavior.

Is this the intent with this change in 2.6 that all platforms by default
have root password of "0penBmc"?  Is there a way to have a platform
specific root password without changing "phosphor-defaults.inc"?

Regards,
Dave


--_000_VI1PR0502MB38695144C9AEB761558A0D64DD440VI1PR0502MB3869_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.pl-s1
	{mso-style-name:pl-s1;}
span.pl-en
	{mso-style-name:pl-en;}
span.x
	{mso-style-name:x;}
span.EmailStyle22
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:970549898;
	mso-list-type:hybrid;
	mso-list-template-ids:-648275384 929858770 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thank you Richard, =
that method did work.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">I was not utilizing=
 the &#8216;append&#8217; keyword properly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"color:windowtext;margin-left:0in;ms=
o-list:l0 level1 lfo1">
Dave<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">David Thompson<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Sr. Staff Engineer,=
 System SW<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Mellanox Technologi=
es<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">1900 West Park Driv=
e, Suite 290<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Westborough MA USA =
01581<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Direct: &#43;1 508-=
475-6375<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Thomaiyar, Richard Marian &lt;richard.mar=
ian.thomaiyar@linux.intel.com&gt;
<br>
<b>Sent:</b> Friday, March 15, 2019 3:12 AM<br>
<b>To:</b> David Thompson &lt;dthompson@mellanox.com&gt;; openbmc@lists.ozl=
abs.org<br>
<b>Subject:</b> Re: Default root password: 2.4 vs. 2.6<o:p></o:p></span></p=
>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Hi Dave,&nbsp;<o:p></o:p></p>
<p>you should be able to override it in your local.conf.sample, please make=
 sure you are using append and correct image name
<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<p>(in local.conf.sample)<o:p></o:p></p>
<p>INHERIT &#43;=3D &quot;extrausers&quot;<o:p></o:p></p>
<p>EXTRA_USERS_PARAMS_append_pn-obmc-phosphor-image&nbsp; =3D &quot; \<o:p>=
</o:p></p>
<p>usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \<o:p></o:p></p=
>
<p>&quot;<o:p></o:p></p>
<p>or add your own image name (instead of obmc-phosphor-image after append_=
pn) for which you are building. With this it will override.
<o:p></o:p></p>
<p>Let me know if you are facing any problem with this method.<o:p></o:p></=
p>
<p><o:p>&nbsp;</o:p></p>
<p>regards, <o:p></o:p></p>
<p>Richard<br>
<br>
<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 3/15/2019 12:05 AM, David Thompson wrote:<o:p></o=
:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">When we transitioned our OpenBMC baseline from 2.4 t=
o 2.6<o:p></o:p></p>
<p class=3D"MsoNormal">we noticed that the default root password for our pl=
atform has<o:p></o:p></p>
<p class=3D"MsoNormal">changed to &#8220;0penBmc&#8221;.&nbsp; This appears=
 to come from the file:<o:p></o:p></p>
<p class=3D"MsoNormal">meta-phosphor/conf/distro/include/phosphor-defaults.=
inc:&nbsp; <o:p>
</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i>usermod -p '\$1\$UGMqy=
qdG\$FZiylVFmRRfl9Z0Ue8G7e/' root;</i><o:p></o:p></p>
<p class=3D"MsoNormal">And this password setting overrides the password we =
had chosen<o:p></o:p></p>
<p class=3D"MsoNormal">in our machine&#8217;s local.conf.sample.&nbsp; &nbs=
p;&nbsp;We experimented but could not<o:p></o:p></p>
<p class=3D"MsoNormal">find a way to prevent this override behavior.<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Is this the intent with this change in 2.6 that all =
platforms by default<o:p></o:p></p>
<p class=3D"MsoNormal">have root password of &#8220;0penBmc&#8221;?&nbsp; I=
s there a way to have a platform<o:p></o:p></p>
<p class=3D"MsoNormal">specific root password without changing &#8220;phosp=
hor-defaults.inc&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Dave<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</blockquote>
</div>
</body>
</html>

--_000_VI1PR0502MB38695144C9AEB761558A0D64DD440VI1PR0502MB3869_--
