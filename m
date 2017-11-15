Return-Path: <james.mihm@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycZmn2h56zDqpS
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 06:53:08 +1100 (AEDT)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2017 11:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,399,1505804400"; 
 d="scan'208,217";a="176615400"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2017 11:53:01 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 15 Nov 2017 11:53:00 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.49]) by
 ORSMSX155.amr.corp.intel.com ([169.254.7.237]) with mapi id 14.03.0319.002;
 Wed, 15 Nov 2017 11:53:00 -0800
From: "Mihm, James" <james.mihm@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: HPM firmware update
Thread-Topic: HPM firmware update
Thread-Index: AdNeSnw9xl0klyNfSrmCAOY7i3yl/w==
Date: Wed, 15 Nov 2017 19:52:59 +0000
Message-ID: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODZmNDA0MTUtYjc3Ny00YjIxLWFkZTMtMjMyY2M1OTNiYmFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkxIaVFMUkhiamR4Q2k5RHplOEVqRXBucnQ0OEM1M3lGRCtsWjBSQ2hnTlE9In0=
x-ctpclassification: CTP_IC
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: multipart/alternative;
 boundary="_000_C599FC839619124CAC44E062ABB7DFE2C9F407C2ORSMSX101amrcor_"
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 15 Nov 2017 19:53:14 -0000

--_000_C599FC839619124CAC44E062ABB7DFE2C9F407C2ORSMSX101amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've started looking at using the PICMG HPM specification that was recommen=
ded as the preferred API for performing firmware updates. This is not an op=
en specification, and goes against the principles of the openbmc project.
The HPM specification must also be purchased from the PICMG standards organ=
ization, and contains patent liabilities. I think using HPM is a non-starte=
r.

James Mihm
Intel - Intel DCG BMC Core Firmware
(503) 264-5129




--_000_C599FC839619124CAC44E062ABB7DFE2C9F407C2ORSMSX101amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>I&#8217;ve started looking at using the PICMG HPM specification that w=
as recommended as the preferred API for performing firmware updates. This i=
s not an open specification, and goes against the principles of the openbmc=
 project. </div>
<div>The HPM specification must also be purchased from the PICMG standards =
organization, and contains patent liabilities. I think using HPM is a non-s=
tarter.</div>
<div>&nbsp;</div>
<div><font face=3D"Comic Sans MS" size=3D"2" color=3D"navy"><span style=3D"=
font-size:10pt;">James Mihm<font face=3D"Arial" size=3D"2" color=3D"black">=
<span style=3D"font-size:11pt;">
<br>

</span></font><font size=3D"2"><span style=3D"font-size:11pt;">Intel - </sp=
an></font>Intel <font size=3D"2"><span style=3D"font-size:11pt;">DCG BMC Co=
re Firmware<br>

</span></font>(503) 264-5129<font face=3D"Calibri" size=3D"2" color=3D"blac=
k"><span style=3D"font-size:11pt;"> </span></font></span></font></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_C599FC839619124CAC44E062ABB7DFE2C9F407C2ORSMSX101amrcor_--
