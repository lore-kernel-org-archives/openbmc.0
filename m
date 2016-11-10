Return-Path: <william.bjlinan@hotmail.com>
Received: from COL004-OMC2S16.hotmail.com (col004-omc2s16.hotmail.com
 [65.55.34.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDnBR6l1NzDvdJ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 13:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="bTIZJukV"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com ([65.55.34.71])
 by COL004-OMC2S16.hotmail.com over TLS secured channel with Microsoft
 SMTPSVC(7.5.7601.23008); Wed, 9 Nov 2016 18:32:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FGIqQSNW0VVX/BfbzYU+y6Mx23GCfqQSORJz8BMtkh4=;
 b=bTIZJukVIF2HVapeppXVqkkbje1Jd6RHIO7rrP/+TyNGA3Yr13ZS2VT4WNsXwTxYtT3lziyYlUQ5uCuyqpGeXc0EsCRnNzEfblfXEzsPd6MNSAAtPsfc5RLqNHv1cCWaN8uCvWoiogT2XDBylzV70ZvGJLYwhkD9sLL+JsV0W7LKk0w5skyaGh+eFtHETQY1uARoZK2XOh1tIvVOELeG7HhcPYMcm0vFoXOMgSSD1lrsy4lS/oypAXaNUYpBLYO9liDKOkm9wEZHJUtfYddCIkUS9yEoZJxjNPC30bbOdnXPRhTlHWrrC4KR6SMrp1/p7jYRXRHi4AUWvJlUxGL6eQ==
Received: from PU1APC01FT058.eop-APC01.prod.protection.outlook.com
 (10.152.252.53) by PU1APC01HT118.eop-APC01.prod.protection.outlook.com
 (10.152.253.89) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.5; Thu, 10 Nov
 2016 02:32:08 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com (10.152.252.58) by
 PU1APC01FT058.mail.protection.outlook.com (10.152.253.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.707.3 via Frontend Transport; Thu, 10 Nov 2016 02:32:08 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) by
 TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) with mapi id
 15.01.0707.006; Thu, 10 Nov 2016 02:32:08 +0000
From: Li Nan <william.bjlinan@hotmail.com>
To: Patrick Williams <patrick@stwcx.xyz>, tomjose <tomjose@linux.vnet.ibm.com>
CC: Adriana Kobylak <anoo@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Thread-Topic: IPMI LAN command story design - try 3rd send
Thread-Index: AQHSHX4EV3As9hwocUyH/bdovV4DKKCYCZQAgABY5QCAE8/uKoAbWzOFgAF1eoCAAA2RgIAAPDaAgAPMNgCAAgZ5gIAAD3uAgAKKxx8=
Date: Thu, 10 Nov 2016 02:32:07 +0000
Message-ID: <TY1PR06MB086374D8EA7FCED4E443DBCFF6B80@TY1PR06MB0863.apcprd06.prod.outlook.com>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <5821ACDB.5040607@linux.vnet.ibm.com>,<20161108114111.GG15757@heinlein.lan>
In-Reply-To: <20161108114111.GG15757@heinlein.lan>
Accept-Language: en-US, en-GB, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hotmail.com;
x-incomingtopheadermarker: OriginalChecksum:; UpperCasedChecksum:;
 SizeAsReceived:3120; Count:38
x-tmn: [oLIZyD4/L9Sv0IvW9d/uj7SC41KEaeae]
x-incomingheadercount: 38
x-eopattributedmessage: 0
x-microsoft-exchange-diagnostics: 1; PU1APC01HT118;
 6:JM4e+Q2isk26Jq/+5MrVH4pC2PYiLSbbl1IM3OKCTZbTSrkcE+rwS+pdXhRr9P3wt3aI5yCi86Uz+OK90BgIccXmxZKFlNn4W58CNu8bUykxWV+oHG/UAI8BVN1QdSjPH8llP4UFuqQ/wKhnYNufC+p6ciMpFGKqE/JI7RRRl5s4EhBTpP0+0uyaCQaMn7CDnnIutPMMZd8BrSZxqVUfr0YzcnOj+RNGyYcRrrRfa1N9mfRHaORRv4DQOy86X0XOGDDylOqH9Ap1r1vipNgM8ZPfkHFqGe6K4FcfBwZWyJl9sL7tB00yg/esJscQ4dp7;
 5:Dw9+nKI+jf5rfM2BtUO6qgfED5G4DTt1i7wRWYpie0H8nVQLyhfi1k403M3LpyysRqHdIQ3VflZhUJpYZhU63NEA5mmMUAnJbET8EDOqHDQYDh2eHDQ0O3fKZsfMqoCdEAqtzWH6cYj0LkDGxakutw==;
 24:mjGvWSjpTfcHxKDX1+oiUZmPw8Sz+Ib9KWnef88vm7QKlV9wgUzxWuqXHd2dgxIRluk7ZQXjFqHgE8fwvYEK44L08SpzyvKhv2m5bvtm5zA=;
 7:1GmE85NuQ+4zC8YGFj07BvnSoJ4rX/7jbucmIY327ZoMj0GA/FiZqjiVw78j6USCpQq5Bnv2hTc1jO1PPReGCEGTaPNsDxQa6od4QmCst6cTQCP99Rr9ZGeHm7H8OEXAhC8cpvwm2+46nOaMJ+zLbD4k+UzNFY7xxgypwISjIGqYUD0SIF6qTfkjeCPpG4/j5jeYSKaNYyLenuivs3KfL3uUmE2biHPvfHEy2iOSW5aTpvgU0Jaw+neEQ/YmTNVOD+kS83Hm4oI1x2B2vWd3RSl0tdrYKh8J43QNQj7E8HRPkJfMEAWdxOaZICfoGYgrqUtdLatMBnjUBawF+jH9YKP4g6F3Rwq1YFqX2cj7adA=
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(10019020)(98900003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1APC01HT118;
 H:TY1PR06MB0863.apcprd06.prod.outlook.com; FPR:; SPF:None; LANG:en; 
x-ms-office365-filtering-correlation-id: bd6d115d-089c-4790-14df-08d40911c49d
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:PU1APC01HT118;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(432015012)(82015046);
 SRVR:PU1APC01HT118; BCL:0; PCL:0; RULEID:; SRVR:PU1APC01HT118; 
x-forefront-prvs: 01221E3973
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_TY1PR06MB086374D8EA7FCED4E443DBCFF6B80TY1PR06MB0863apcp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2016 02:32:08.0042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT118
X-OriginalArrivalTime: 10 Nov 2016 02:32:12.0403 (UTC)
 FILETIME=[A48BDC30:01D23AFA]
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
X-List-Received-Date: Thu, 10 Nov 2016 02:32:17 -0000

--_000_TY1PR06MB086374D8EA7FCED4E443DBCFF6B80TY1PR06MB0863apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tom and Patrick,


Thanks for your kindly support!

Will trace this issue too.

https://github.com/xcat2/xcat-core/issues/2108


B.R.

Nan Li

[https://avatars3.githubusercontent.com/u/105009?v=3D3&s=3D400]<https://git=
hub.com/xcat2/xcat-core/issues/2108>

ip configuration for OpenBMC-based machines (Witherspoon) =B7 Issue #2108 =
=B7 xcat2/xcat-core<https://github.com/xcat2/xcat-core/issues/2108>
github.com
The OpenBMC team has been working on our IPMI providers to ensure they are =
as compliant with IPMI 2.0. One of the areas being worked is the ip configu=
ration. When the ip address is configured it i...



________________________________
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Tuesday, November 8, 2016 7:41:11 PM
To: tomjose
Cc: Li Nan; Adriana Kobylak; OpenBMC Maillist
Subject: Re: IPMI LAN command story design - try 3rd send

Tom,

Thanks for tracking this down.  I created an issue against xcat to
discuss and make sure they are happy with our direction.  Hopefully this
can also be used to track any changes they need to make.

https://github.com/xcat2/xcat-core/issues/2108

--
Patrick Williams

--_000_TY1PR06MB086374D8EA7FCED4E443DBCFF6B80TY1PR06MB0863apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
or:#000000; font-family:Calibri,Arial,Helvetica,sans-serif">
<p>Tom and Patrick,</p>
<p><br>
</p>
<p>Thanks for your kindly support!</p>
<p>Will trace this issue too.</p>
<p><a id=3D"LPlnk168153" href=3D"https://github.com/xcat2/xcat-core/issues/=
2108" class=3D"x_OWAAutoLink">https://github.com/xcat2/xcat-core/issues/210=
8</a></p>
<p><br>
</p>
<p>B.R.<br>
</p>
<p>Nan Li</p>
<div id=3D"LPBorder_GT_14787451143740.8306155896892097" style=3D"margin-bot=
tom:20px; overflow:auto; width:100%; text-indent:0px">
<table id=3D"LPContainer_14787451143690.5961969151687195" cellspacing=3D"0"=
 style=3D"width:90%; background-color:rgb(255,255,255); overflow:auto; padd=
ing-top:20px; padding-bottom:20px; margin-top:20px; border-top:1px dotted r=
gb(200,200,200); border-bottom:1px dotted rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td colspan=3D"1" id=3D"x_ImageCell_14787451143710.7924407670546106" style=
=3D"width:250px; display:table-cell; padding-right:20px">
<div id=3D"LPImageContainer_14787451143710.030038094859981546" style=3D"bac=
kground-color:rgb(255,255,255); height:250px; margin:auto; display:table; w=
idth:250px">
<a target=3D"_blank" href=3D"https://github.com/xcat2/xcat-core/issues/2108=
" id=3D"LPImageAnchor_14787451143720.3528460722772465" style=3D"display:tab=
le-cell; text-align:center"><img id=3D"LPThumbnailImageID_14787451143720.64=
18252979937955" height=3D"250" width=3D"250" style=3D"display:inline-block;=
 max-width:250px; max-height:250px; height:250px; width:250px; border-width=
:0px; vertical-align:bottom" src=3D"https://avatars3.githubusercontent.com/=
u/105009?v=3D3&amp;s=3D400"></a></div>
</td>
<td colspan=3D"2" id=3D"x_TextCell_14787451143720.6736146541804827" style=
=3D"vertical-align:top; padding:0px; display:table-cell">
<div id=3D"LPRemovePreviewContainer_14787451143720.8606836262342699"></div>
<div id=3D"LPTitle_14787451143730.5957070218800772" style=3D"top:0px; color=
:rgb(0,120,215); font-weight:400; font-size:21px; font-family:&quot;wf_sego=
e-ui_light&quot;,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quot;,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif; line-height:=
21px">
<a target=3D"_blank" href=3D"https://github.com/xcat2/xcat-core/issues/2108=
" id=3D"LPUrlAnchor_14787451143730.4436194120390584" style=3D"text-decorati=
on:none">ip configuration for OpenBMC-based machines (Witherspoon) =B7 Issu=
e #2108 =B7 xcat2/xcat-core</a></div>
<div id=3D"LPMetadata_14787451143730.02938019456892671" style=3D"margin:10p=
x 0px 16px; color:rgb(102,102,102); font-weight:400; font-family:&quot;wf_s=
egoe-ui_normal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial=
,sans-serif; font-size:14px; line-height:14px">
github.com</div>
<div id=3D"LPDescription_14787451143740.17750951991862784" style=3D"display=
:block; color:rgb(102,102,102); font-weight:400; font-family:&quot;wf_segoe=
-ui_normal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,san=
s-serif; font-size:14px; line-height:20px; max-height:100px; overflow:hidde=
n">
The OpenBMC team has been working on our IPMI providers to ensure they are =
as compliant with IPMI 2.0. One of the areas being worked is the ip configu=
ration. When the ip address is configured it i...</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
<p></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Patrick Williams &l=
t;patrick@stwcx.xyz&gt;<br>
<b>Sent:</b> Tuesday, November 8, 2016 7:41:11 PM<br>
<b>To:</b> tomjose<br>
<b>Cc:</b> Li Nan; Adriana Kobylak; OpenBMC Maillist<br>
<b>Subject:</b> Re: IPMI LAN command story design - try 3rd send</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Tom,<br>
<br>
Thanks for tracking this down.&nbsp; I created an issue against xcat to<br>
discuss and make sure they are happy with our direction.&nbsp; Hopefully th=
is<br>
can also be used to track any changes they need to make.<br>
<br>
<a href=3D"https://github.com/xcat2/xcat-core/issues/2108">https://github.c=
om/xcat2/xcat-core/issues/2108</a><br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font>
</body>
</html>

--_000_TY1PR06MB086374D8EA7FCED4E443DBCFF6B80TY1PR06MB0863apcp_--
