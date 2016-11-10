Return-Path: <Tiju.Jacob@flextronics.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
 [216.82.251.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFFyM6mKfzDvmJ
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 08:08:25 +1100 (AEDT)
Received: from [216.82.249.179] by server-6.bemta-12.messagelabs.com id
 65/F9-04467-7C1E4285; Thu, 10 Nov 2016 21:08:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRWlGSWpSXmKPExsViIr2lQvfYQ5U
 Ig0tT1CxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8anhRNYCj5JVnT9f8TWwDhRvIuRk0NIYAqT
 xOmX2V2MXED2MUaJ7YcesoAk2AR0Jda0fGAFsUUELCWWPGhnA7GFBSQlNvd0s0DE5SSW77nNB
 GHrScy8PY8RxGYRUJW49PQTWA2vQIzEsY5fYDajgJjE91NrwOqZBcQlbj2ZD2ZLCAhILNlznh
 nCFpV4+fgfK0R9jMSazjYWiLiSxPves8wgh0oILGCWmPe9EarBV6Lh2wQWGPv64m5WCDtbYuO
 ZTqgFVhIdE4+zQjQfZJTofwZyNQeQIyNxehNU/TpWiQ1TAiGhki6xZe8ndoiHpSTuXulkhLBl
 JF7c2csK8UCeROfzS1BPCkqcnPkE6gYFieOHX0LN9Jf4/fg2I4RtJPHx1F82CNtJ4kzTRKYJj
 EqzkMJiFpKxs5CMhYjrSCzY/YkNwtaWWLbwNTOMfebAYyZk8QWM7KsYNYpTi8pSi3SNLPWSij
 LTM0pyEzNzdA0NjfRyU4uLE9NTcxKTivWS83M3MQITUD0DA+MOxn9ffA8xSnIwKYnyKk5XiRD
 iS8pPqcxILM6ILyrNSS0+xCjDwaEkwXvhAVBOsCg1PbUiLTMHmAph0hIcPEoivI0gad7igsTc
 4sx0iNQpRkUpcd4HIAkBkERGaR5cGyz9XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsPM
 oUnM68EbvoroMVMQItnxIEtLklESEk1MM5cUrQ294PiM3v1/4tCKhqO/lPl3MwWdfNnRGpzsu
 LuCy1v7EIPte6eIuQp8cN/ie3VpIexaVMmhVmFb2K6tzRex+3eFwaxqUzLPyqe0vr2PSv0gHG
 Ba6j53hcCbQ8jDzv8t/v3TvMW87z+zn9S2Q0Kocs5p63/eeJgh107zwxWC82gPCFWFiWW4oxE
 Qy3mouJEAKbcVtC6AwAA
X-Env-Sender: Tiju.Jacob@flextronics.com
X-Msg-Ref: server-10.tower-44.messagelabs.com!1478812101!102211936!1
X-Originating-IP: [52.27.180.120]
X-StarScan-Received: 
X-StarScan-Version: 9.0.13; banners=flextronics.com,-,-
X-VirusChecked: Checked
Received: (qmail 17871 invoked from network); 10 Nov 2016 21:08:22 -0000
Received: from ec2-52-27-180-120.us-west-2.compute.amazonaws.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) (52.27.180.120)
 by server-10.tower-44.messagelabs.com with AES256-SHA256 encrypted SMTP;
 10 Nov 2016 21:08:22 -0000
Received: from MWHPR08MB2431.namprd08.prod.outlook.com (10.169.203.135) by
 MWHPR08MB2432.namprd08.prod.outlook.com (10.169.203.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.707.6; Thu, 10 Nov 2016 21:08:20 +0000
Received: from MWHPR08MB2431.namprd08.prod.outlook.com ([10.169.203.135]) by
 MWHPR08MB2431.namprd08.prod.outlook.com ([10.169.203.135]) with mapi id
 15.01.0707.006; Thu, 10 Nov 2016 21:08:20 +0000
From: Tiju Jacob <Tiju.Jacob@flextronics.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add new machine 
Thread-Topic: Add new machine 
Thread-Index: AdI7lmMPO5LOJ365SZiOHBgMnIAi5g==
Date: Thu, 10 Nov 2016 21:08:20 +0000
Message-ID: <MWHPR08MB2431CF1685C470069330770495B80@MWHPR08MB2431.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.116.144.29]
x-microsoft-exchange-diagnostics: 1; MWHPR08MB2432;
 7:zQzp+6EvQzd/TkL2SOirQ3ZQuVJkwtft7+U218Q9RvjXz5q+053MfcAfs3DOGjDZuBEW7hlPEJiENV+qVcFud7HJUCiFjqgZMvBvgi3Mew/uDATOTi8XrTqL8dJk78We1lQUugtfmGU+uuVdnFNnfjjGIbkA9YPXY8S/Hi2RDbkiZH2nZUGw0FOf4camjVMTOv+rshGhsjIyXhTX0yvCrNumWN4KuPuhZidL2WBTym2qnU0tB/N3if/oPf8mYGVY0dmEGt8xEPTC/UmK15J+/+A9ul1Dinwjtfr9jrtNvVq2ohevRSM70KAc+uZARXyMOKLIi5WzA6ZYk4y4gZ7JS63YPCXgAUkHJXDSn44MteM=
x-ms-office365-filtering-correlation-id: 9a6626cc-92ed-4baf-ebea-08d409adb33a
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:MWHPR08MB2432;
x-microsoft-antispam-prvs: <MWHPR08MB2432B9446AD647066EBC297C95B80@MWHPR08MB2432.namprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
 SRVR:MWHPR08MB2432; BCL:0; PCL:0; RULEID:; SRVR:MWHPR08MB2432; 
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(6009001)(7916002)(189002)(199003)(106356001)(66066001)(2351001)(68736007)(81166006)(1730700003)(107886002)(8676002)(189998001)(2900100001)(122556002)(54356999)(50986999)(450100001)(92566002)(99286002)(74316002)(105586002)(7736002)(101416001)(7846002)(77096005)(97736004)(2906002)(76576001)(81156014)(3846002)(6116002)(790700001)(102836003)(586003)(5660300001)(7116003)(2501003)(3280700002)(33656002)(110136003)(7696004)(3480700004)(3660700001)(87936001)(8936002)(6916009)(9686002)(9326002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR08MB2432;
 H:MWHPR08MB2431.namprd08.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: flextronics.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_MWHPR08MB2431CF1685C470069330770495B80MWHPR08MB2431namp_"
MIME-Version: 1.0
X-OriginatorOrg: flextronics.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2016 21:08:20.3675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB2432
X-CFilter-Loop: Reflected
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
X-List-Received-Date: Thu, 10 Nov 2016 21:08:28 -0000

--_000_MWHPR08MB2431CF1685C470069330770495B80MWHPR08MB2431namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We have a new machine made and most of the code is leveraged from Wedge100=
. I would like to submit code back to Openbmc git hub.
I would like to create a new machine like 'meta-wedge100' with most of the=
 references back to wedge100 and keep only the changes in the new machine =
directory.

Could someone please suggest how to go about it? Also, is there a standard=
 step by step method by which we can achieve this?

Thanks and Regards,
Tiju


Legal Disclaimer:
The information contained in this message may be privileged and confidenti=
al. It is intended to be read only by the individual or entity to whom it =
is addressed or by their designee. If the reader of this message is not th=
e intended recipient, you are on notice that any distribution of this mess=
age, in any form, is strictly prohibited. If you have received this messag=
e in error, please immediately notify the sender and delete or destroy any=
 copy of this message!
--_000_MWHPR08MB2431CF1685C470069330770495B80MWHPR08MB2431namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mic=
rosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word=
" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"ht=
tp://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
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
<p class=3D"MsoNormal">We have a new machine made and most of the code is =
leveraged from Wedge100. I would like to submit code back to Openbmc git h=
ub.
<o:p></o:p></p>
<p class=3D"MsoNormal">I would like to create a new machine like &#8216;me=
ta-wedge100&#8217; with most of the references back to wedge100 and keep o=
nly the changes in the new machine directory.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could someone please suggest how to go about it? Al=
so, is there a standard step by step method by which we can achieve this?<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Tiju<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<br clear=3D"both">
Legal Disclaimer:<BR>
The information contained in this message may be privileged and confidenti=
al. It is intended to be read only by the individual or entity to whom it =
is addressed or by their designee. If the reader of this message is not th=
e intended recipient, you are on notice that any distribution of this mess=
age, in any form, is strictly prohibited. If you have received this messag=
e in error, please immediately notify the sender and delete or destroy any=
 copy of this message!<BR>
</body>
</html>

--_000_MWHPR08MB2431CF1685C470069330770495B80MWHPR08MB2431namp_--
