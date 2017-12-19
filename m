Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z14B61zDKzDsRW
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 15:07:41 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2017 20:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,424,1508828400"; d="scan'208,217";a="3973670"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga006.jf.intel.com with ESMTP; 18 Dec 2017 20:07:39 -0800
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 18 Dec 2017 20:07:39 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.57]) by
 ORSMSX162.amr.corp.intel.com ([169.254.3.44]) with mapi id 14.03.0319.002;
 Mon, 18 Dec 2017 20:07:39 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Request for comments: C++ embedded webserver
Thread-Topic: Request for comments: C++ embedded webserver
Thread-Index: AdN4ftVuoDXj0cc0QHy/ckqdQwlbew==
Date: Tue, 19 Dec 2017 04:07:38 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTE0ZGYwYWUtNGQyYy00NWUwLWIwMTEtYjZkNTFiYTY1MGNkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IkxRUktENjBmZFFYSDFHNUlvaDVmcStpWk0xQjZEOWw2XC9waXg4WHlXRDMwPSJ9
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E82169932F4B1A4DORSMSX114amrcor_"
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
X-List-Received-Date: Tue, 19 Dec 2017 04:07:42 -0000

--_000_7E9441B1E5EFFD4681F54958E82169932F4B1A4DORSMSX114amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm looking for comments on a code review that's been outstanding.  One of =
the large pushes we've made is to attempt to make the web server more effic=
ient, and add capabilities that comprehend long term needs of OpenBmc.  One=
 key that wasn't made clear in the commit message is that it includes the b=
asic redfish implementation that (we hope) should be extensible to the full=
 redfish specification in the short term future.

https://gerrit.openbmc-project.xyz/#/c/7786/

We would very much appreciate comments to see if we can move this forward.

The following description is pulled from the readme.

# OpenBMC webserver #

This component attempts to be a "do everything" embedded webserver for open=
bmc.

## Capabilities ##
At this time, the webserver implements a few interfaces:
+ Authentication middleware that supports cookie and token based authentica=
tion, as well as CSRF prevention backed by linux PAM authentication credent=
ials.
+ An (incomplete) attempt at replicating phosphor-dbus-rest interfaces in C=
++.  Right now, a few of the endpoint definitions work as expected, but the=
re is still a lot of work to be done.  The portions of the interface that a=
re functional are designed to work correctly for phosphor-webui, but may no=
t yet be complete.
+ Replication of the rest-dbus backend interfaces to allow bmc debug to log=
ged in users.
+ An initial attempt at a read-only redfish interface.  Currently the redfi=
sh interface targets ServiceRoot, SessionService, AccountService, Roles, an=
d ManagersService.  Some functionality here has been shimmed to make develo=
pment possible.  For example, there exists only a single user role.
+ SSL key generation at runtime.  If an RSA key and cert pair are not avail=
able to the server at runtime, keys are generated using the openssl routine=
s, and written to disk.
+ Static file hosting.  Currently, static files are hosted from the fixed l=
ocation at /usr/share/www.  This is intended to allow loose coupling with y=
octo projects, and allow overriding static files at build time.
+ Dbus-monitor over websocket.  A generic endpoint that allows UIs to open =
a websocket and register for notification of events to avoid polling in sin=
gle page applications.  (this interface may be modified in the future due t=
o security concerns.)


Thanks,

-Ed


--_000_7E9441B1E5EFFD4681F54958E82169932F4B1A4DORSMSX114amrcor_
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
<p class=3D"MsoNormal">I&#8217;m looking for comments on a code review that=
&#8217;s been outstanding.&nbsp; One of the large pushes we&#8217;ve made i=
s to attempt to make the web server more efficient, and add capabilities th=
at comprehend long term needs of OpenBmc.&nbsp; One key that wasn&#8217;t
 made clear in the commit message is that it includes the basic redfish imp=
lementation that (we hope) should be extensible to the full redfish specifi=
cation in the short term future.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gerrit.openbmc-project.xyz/#/c/77=
86/">https://gerrit.openbmc-project.xyz/#/c/7786/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We would very much appreciate comments to see if we =
can move this forward.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following description is pulled from the readme.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># OpenBMC webserver #<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This component attempts to be a &quot;do everything&=
quot; embedded webserver for openbmc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">## Capabilities ##<o:p></o:p></p>
<p class=3D"MsoNormal">At this time, the webserver implements a few interfa=
ces:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; Authentication middleware that supports cookie=
 and token based authentication, as well as CSRF prevention backed by linux=
 PAM authentication credentials.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; An (incomplete) attempt at replicating phospho=
r-dbus-rest interfaces in C&#43;&#43;.&nbsp; Right now, a few of the endpoi=
nt definitions work as expected, but there is still a lot of work to be don=
e.&nbsp; The portions of the interface that are functional
 are designed to work correctly for phosphor-webui, but may not yet be comp=
lete.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; Replication of the rest-dbus backend interface=
s to allow bmc debug to logged in users.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; An initial attempt at a read-only redfish inte=
rface.&nbsp; Currently the redfish interface targets ServiceRoot, SessionSe=
rvice, AccountService, Roles, and ManagersService.&nbsp; Some functionality=
 here has been shimmed to make development possible.&nbsp;
 For example, there exists only a single user role.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; SSL key generation at runtime.&nbsp; If an RSA=
 key and cert pair are not available to the server at runtime, keys are gen=
erated using the openssl routines, and written to disk.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; Static file hosting.&nbsp; Currently, static f=
iles are hosted from the fixed location at /usr/share/www.&nbsp; This is in=
tended to allow loose coupling with yocto projects, and allow overriding st=
atic files at build time.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43; Dbus-monitor over websocket.&nbsp; A generic e=
ndpoint that allows UIs to open a websocket and register for notification o=
f events to avoid polling in single page applications.&nbsp; (this interfac=
e may be modified in the future due to security
 concerns.)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Ed<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E82169932F4B1A4DORSMSX114amrcor_--
