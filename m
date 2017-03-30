Return-Path: <dthompson@mellanox.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0088.outbound.protection.outlook.com [104.47.0.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvJhF26D0zDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 09:09:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="G+QIHg+d";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P+hxs/w59xbmd/8ouQqzD+3GjQr6FnitIE2OXtAjaNY=;
 b=G+QIHg+d5B1mUA0YDiwIzdh9GQJ+EdFtmN4cB9nLUIbN1G1Rmk1iV2Dt4VDocSIYTG1gfuAX2wgDv+dpWd1Xrg1x3s7bzXNmugOw9FxhUgeXQHwr0BR1Wznk8YdiyNyiC3TLN4omB55+M8/XogumnnZ5jxNa7crvGA77IkLJx7c=
Received: from HE1PR0501MB2666.eurprd05.prod.outlook.com (10.172.130.148) by
 HE1PR0501MB2665.eurprd05.prod.outlook.com (10.172.130.147) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14; Thu, 30
 Mar 2017 22:09:27 +0000
Received: from HE1PR0501MB2666.eurprd05.prod.outlook.com ([10.172.130.148]) by
 HE1PR0501MB2666.eurprd05.prod.outlook.com ([10.172.130.148]) with
 mapi id 15.01.0991.022; Thu, 30 Mar 2017 22:09:27 +0000
From: David Thompson <dthompson@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: MCTP protocol support in OpenBMC?
Thread-Topic: MCTP protocol support in OpenBMC?
Thread-Index: AdKpoMMBKnUyQ0D3TDyVi2a15aJZmg==
Date: Thu, 30 Mar 2017 22:09:27 +0000
Message-ID: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=mellanox.com;
x-originating-ip: [12.216.194.146]
x-microsoft-exchange-diagnostics: 1; HE1PR0501MB2665;
 7:xQYbVCHtM2ES6Q323L7vWol9IjZ3K0XIRT1bPYxz4lC2nsKS+E5IHyErCcb77hETHiX9BBaFal8juN65bh9o9o0Zg4vdq4IvtNmLre2raUj2NRxNpvIBFv84yIj/IyE2Dnn3zNDrl9rv4UJW+Y4Es/EaI7SAyYoRdiXxkZoY02+TdXo0uKLHOzP8xxUdHn/bihIR92bZmxIGg/I7ivfhfheug5v99YpsXN3JpS6kbifJccPNyjTKkrVQP9lTz0752g86RTTXLaqxg34hv4Xbw7T/IOl83pZ1GCt0TNZ1OBCFANWQ8gb0W+uV/v9lJVk+KCCZOChgbGp41cZyjm8UUA==
x-ms-office365-filtering-correlation-id: 13ebce49-7555-45ed-9038-08d477b96eae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
 SRVR:HE1PR0501MB2665; 
x-microsoft-antispam-prvs: <HE1PR0501MB266564CE351176B92E1DDA0EDD340@HE1PR0501MB2665.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006075)(93001075)(6055026)(6041248)(20161123564025)(20161123555025)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(6072148);
 SRVR:HE1PR0501MB2665; BCL:0; PCL:0; RULEID:; SRVR:HE1PR0501MB2665; 
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39410400002)(39450400003)(39850400002)(39860400002)(39840400002)(39400400002)(51874003)(8936002)(66066001)(2906002)(74316002)(122556002)(189998001)(110136004)(1730700003)(8676002)(81166006)(3280700002)(2351001)(50986999)(54356999)(25786009)(38730400002)(2501003)(790700001)(3846002)(102836003)(7696004)(6116002)(86362001)(6916009)(5660300001)(3660700001)(53936002)(7736002)(6306002)(55016002)(54896002)(99286003)(6436002)(77096006)(33656002)(6506006)(5640700003)(9686003)(2900100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0501MB2665;
 H:HE1PR0501MB2666.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en;
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_HE1PR0501MB2666721F6FF033CA4B94D754DD340HE1PR0501MB2666_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2017 22:09:27.4180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2665
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
X-List-Received-Date: Thu, 30 Mar 2017 22:09:34 -0000

--_000_HE1PR0501MB2666721F6FF033CA4B94D754DD340HE1PR0501MB2666_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello folks,

Does OpenBMC currently have any support for MCTP protocol layer,
or is there a plan to deliver something like this in the future?  I'd be
very interested to hear about any future plans related to MCTP stack.

Thanks in advance,
Dave

David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: 508-983-6439


--_000_HE1PR0501MB2666721F6FF033CA4B94D754DD340HE1PR0501MB2666_
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
<p class=3D"MsoNormal">Hello folks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does OpenBMC currently have any support for MCTP pro=
tocol layer,<o:p></o:p></p>
<p class=3D"MsoNormal">or is there a plan to deliver something like this in=
 the future?&nbsp; I&#8217;d be<o:p></o:p></p>
<p class=3D"MsoNormal">very interested to hear about any future plans relat=
ed to MCTP stack.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Dave<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">David Thompson<o:p></o:p></p>
<p class=3D"MsoNormal">Sr. Staff Engineer, System SW<o:p></o:p></p>
<p class=3D"MsoNormal">Mellanox Technologies<o:p></o:p></p>
<p class=3D"MsoNormal">1900 West Park Drive, Suite 290<o:p></o:p></p>
<p class=3D"MsoNormal">Westborough MA USA 01581<o:p></o:p></p>
<p class=3D"MsoNormal">Direct: 508-983-6439<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_HE1PR0501MB2666721F6FF033CA4B94D754DD340HE1PR0501MB2666_--
