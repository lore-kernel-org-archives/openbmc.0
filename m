Return-Path: <dukh@lenovo.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.209; helo=mail1.bemta23.messagelabs.com;
 envelope-from=dukh@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qSgs1sc6zDqTD
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 02:57:57 +1100 (AEDT)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-d.us-east-1.aws.symcld.net id DA/3F-12949-289C15C5;
 Wed, 30 Jan 2019 15:57:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42LJePGQSbfpZGC
 MwbMXchanWl6wODB6nJ+xkDGAMYo1My8pvyKBNeP4J8uCzeIVP77MZm9g7BDtYuTiEBJ4ySjx
 eOcjFghnGqPE5U9PmbsYOTnYBJQkNj+9wwZiiwhYSix50A5kc3AIC+hK7HnABxE2kti55gsjh
 K0nMa9rFpjNIqAqsaXhEhOIzSvgI9H5ZxOYzSggKzHt0X0wm1lAXOLWk/lgtoSAgMSSPeeZIW
 xRiZeP/7GCrJIQkJfYMksQojxP4srSW2wQIwUlTs58wjKBUWAWkkmzkJTNQlIGEdeRWLD7Exu
 ErS2xbOFrZhj7zIHHTMjiCxjZVzGaJxVlpmeU5CZm5ugaGhjoGhoaAbGuoZmRXmKVbopeabFu
 amJxia6hXmJ5sV5xZW5yTopeXmrJJkZgZKQUcC/awXixJf0QoyQHk5Ior5dvYIwQX1J+SmVGY
 nFGfFFpTmrxIUYZDg4lCd6Hx4FygkWp6akVaZk5wBiFSUtw8CiJ8MqfAErzFhck5hZnpkOkTj
 FachxY9HAuM8eW+8+A5C4QKcSSl5+XKiXOexRkngBIQ0ZpHtw4WBq5xCgrJczLyMDAIMRTkFq
 Um1mCKv+KUZyDUUmYtxdkLU9mXgnc1ldABzEBHVTlGAByUEkiQkqqgVHk1do1ltLbZk9NvcfK
 mWpRtzrlxoVti6QZri1tedH+aedZzVWHnbJ67OdtfsGQb6RkfmzFTm7j5K13q78auGzPfnR0z
 8KHCZczJj/a8/vHnaoAGdbvfQvdz7KwtCYd+9nJJrl2icf9zTE8RmXbJzuWizszx3cus+a0Mp
 /25F6HD2fWrQsSa14qsRRnJBpqMRcVJwIAx0fqOR4DAAA=
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-20.tower-426.messagelabs.com!1548863874!1109363!1
X-Originating-IP: [104.232.225.2]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30767 invoked from network); 30 Jan 2019 15:57:54 -0000
Received: from unknown (HELO maesmtp01.lenovo.com) (104.232.225.2)
 by server-20.tower-426.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jan 2019 15:57:54 -0000
Received: from CNMAILCH02.lenovo.com (unknown [10.96.97.130]) by
 maesmtp01.lenovo.com with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-SHA384)
 id 32a4_1cf5_915b9b7d_3bb9_46cd_b99a_93ab489e9ec0;
 Wed, 30 Jan 2019 15:57:50 +0000
Received: from CNMAILEX03.lenovo.com ([169.254.11.88]) by
 CNMAILCH02.lenovo.com ([::1]) with mapi id 14.03.0415.000; Wed, 30 Jan 2019
 23:57:48 +0800
From: Duke KH Du <dukh@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: BSD-3 license is allowed in metadata
Thread-Topic: BSD-3 license is allowed in metadata
Thread-Index: AdS4tCm+ltMVTygGT4OA0fFaZJTgGA==
Date: Wed, 30 Jan 2019 15:57:47 +0000
Message-ID: <9F16AAB7177A1645BBAFF66396C46B0E7A2DD226@CNMAILEX03.lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.19.89]
Content-Type: multipart/alternative;
 boundary="_000_9F16AAB7177A1645BBAFF66396C46B0E7A2DD226CNMAILEX03lenov_"
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 30 Jan 2019 15:58:02 -0000

--_000_9F16AAB7177A1645BBAFF66396C46B0E7A2DD226CNMAILEX03lenov_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We observed in each metadata, there will be two kinds of license, MIT and A=
pache 2.0.
If MIT and Apache2.0 is replaced by BSD-3 license in our own metadata, it t=
hat allowed by OpenBMC?

Could you kindly provide the answer for this license question?

Thanks.

--_000_9F16AAB7177A1645BBAFF66396C46B0E7A2DD226CNMAILEX03lenov_
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
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We observed in each metadata, there will be two kind=
s of license, MIT and Apache 2.0.<o:p></o:p></p>
<p class=3D"MsoNormal">If MIT and Apache2.0 is replaced by BSD-3 license in=
 our own metadata, it that allowed by OpenBMC?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you kindly provide the answer for this license=
 question?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</body>
</html>

--_000_9F16AAB7177A1645BBAFF66396C46B0E7A2DD226CNMAILEX03lenov_--
