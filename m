Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="fI8BNbmv"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z252T5WTpzDrn7
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 06:49:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1513798982; x=1545334982;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=V0jEHzLaXO57rphXZVYGOJG2k/+sCT1D9Xi7GbkWTJ4=;
 b=fI8BNbmvfopPFcdH9pfokpKZh5Tt/un1LfPzjHkp0OPApKj23fYu+Nwi
 dSB6FK5lh4t2mF4wE0IvJ1hvw8+UuOsDZOfqQa5Udy7iknZpmSwZhxxxR
 u/ZkmuEcl4CWHPoANIp4VFrgKXOrA1se/kQh3WMtFZAhdreAx3wScWoxa 4=;
IronPort-PHdr: =?us-ascii?q?9a23=3A4ACZZBdSP5co5y3jf5JCuERslGMj4u6mDksu8pMi?=
 =?us-ascii?q?zoh2WeGdxcSzZR7h7PlgxGXEQZ/co6odzbaO6ua4ASQp2tWoiDg6aptCVhsI24?=
 =?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
 =?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9HiTahfL9+Ngm6oRnMvcQKnIVuLbo8xAHUqXVSYe?=
 =?us-ascii?q?RWwm1oJVOXnxni48q74YBu/SdNtf8/7sBMSar1cbg2QrxeFzQmLns65Nb3uhnZ?=
 =?us-ascii?q?TAuA/WUTX2MLmRdVGQfF7RX6XpDssivms+d2xSeXMdHqQb0yRD+t4b1rSBv1gy?=
 =?us-ascii?q?kZMTA3/nzchsh+ga9bpR6soQF0zYzJb4GPLPdwfr3Tc84GRWRPXchRWS5OAoKg?=
 =?us-ascii?q?YIQAFOcOJ/pUr4vnqlcSsReyGw+hD/7vxD9SgX/22LU33uMmHwHHwAMgH8gBv2?=
 =?us-ascii?q?rQrNnvO6keS/24zLPPzTTNafNbwiry55bMchAlu/2DQbVwcc/IxEQpCgjLgFKQ?=
 =?us-ascii?q?qYn/MDOU0OQAq2+b7/J+WuKpkGEnrh1+riG3xsc2jYnJhJwaxUzY9Sljz4c0Jd?=
 =?us-ascii?q?y5RUhmatCnCJtdryCXOohsTs88TWxkpjw2xqAGtJO1ZiQG1ogrywPHZ/Cab4SE?=
 =?us-ascii?q?+A/vWemfLDtimX5oe6izihWz/ES41+HxWce53ExXoidEk9TArHMA2hzJ5sSZVv?=
 =?us-ascii?q?dx4kGs0iuV2Q/J8OFLO0U0mLLeK54m37E/iIIesV/GHi/qgEX2i7KWdlk89uio?=
 =?us-ascii?q?9evnZrLmq4eCOI9vkA7yL74ildGhDuQ8NggCRm+b+fmg1LL4+k35XbNKgeAonq?=
 =?us-ascii?q?XDsZDaPcQbpqu2AgNPzokj7BO/Ay+n0NQeg3YHMEpIdROEgoTzJV3DLu70Ae2i?=
 =?us-ascii?q?j1msnjpn3e7KMqH8DpnVK3jMirbhfbJz605GzwozyMhS6ZVVCr4dIPL8QFH+tN?=
 =?us-ascii?q?jCAhE2KQC53vznCNJz14MYQm+AH7GWMKfWsVOS+u0vJOyMaJcPuDnhM/gl++Lu?=
 =?us-ascii?q?jXghlF8aZammw50XZ2u9Hvt6OEiZZXvsgswdEWcRpAY+S+3riFmYXjFIfHa+Ra?=
 =?us-ascii?q?U85is0CNHuMYCWEo2hxqCI2iCmBbVXYHxLDhaHFnK+M83QXO8BbiiXKedlkycY?=
 =?us-ascii?q?Tv6mWYso3wrosxX1nelJNO3Rr3k9tJnj3dVxocCVvws16jpcA8mZ1yeGSGQizT?=
 =?us-ascii?q?BAfCM/wK0q+R818VyEy6Ut2KFV?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EdAgC5vTpah8mZ6ERTCRkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCSkWBBRB0JwedOIElXYICjTuFGIRlChgBCoELhA0ChRRCFQE?=
 =?us-ascii?q?BAQEBAQEBAQECEAEBAQoLCQgoL4I4DIFKWzsBAQEBAwEsXAIBCBEBAwEBDRsHK?=
 =?us-ascii?q?B4DBggBAQQBEggWiSlkEKZMimkBAQEBAQEBAQIBAQEBAQEBAQEBARgFg3+CEoM?=
 =?us-ascii?q?/gyyBMIIAgUQOBkyFQwWLVZdvCod2hxyGCYIgiiWHPHCJX4JPhWgBg3WBOzWBc?=
 =?us-ascii?q?2+CagEPCYJbgXN4AQEBiU+BFQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EdAgC5vTpah8mZ6ERTCRkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CSkWBBRB0JwedOIElXYICjTuFGIRlChgBCoELhA0ChRRCFQEBAQEBAQEBAQECE?=
 =?us-ascii?q?AEBAQoLCQgoL4I4DIFKWzsBAQEBAwEsXAIBCBEBAwEBDRsHKB4DBggBAQQBEgg?=
 =?us-ascii?q?WiSlkEKZMimkBAQEBAQEBAQIBAQEBAQEBAQEBARgFg3+CEoM/gyyBMIIAgUQOB?=
 =?us-ascii?q?kyFQwWLVZdvCod2hxyGCYIgiiWHPHCJX4JPhWgBg3WBOzWBc2+CagEPCYJbgXN?=
 =?us-ascii?q?4AQEBiU+BFQEBAQ?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2017 13:42:58 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Dec 2017 01:38:50 +0600
X-LoopCount0: from 10.166.136.210
X-IronPort-AV: E=Sophos;i="5.45,433,1508821200"; 
 d="scan'208,217";a="592391872"
X-DLP: DLP_GlobalPCIDSS
To: <ed.tanous@intel.com>, <openbmc@lists.ozlabs.org>
Subject: RE: Request for comments: C++ embedded webserver
Thread-Topic: Request for comments: C++ embedded webserver
Thread-Index: AdN4ftVuoDXj0cc0QHy/ckqdQwlbewBSDjqg
Date: Wed, 20 Dec 2017 19:49:31 +0000
Message-ID: <378cc02cd4ce475698b52e1a242fc669@ausx13mps334.AMER.DELL.COM>
References: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_378cc02cd4ce475698b52e1a242fc669ausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Wed, 20 Dec 2017 19:49:39 -0000

--_000_378cc02cd4ce475698b52e1a242fc669ausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I started reviewing some of the code, and I have quite a few thoughts, let'=
s see if I can convey them without writing a book. The main aspect I'm look=
ing at is the redfish interface, but many of these apply equally well to th=
e REST and redfish parts. Here are my initial thoughts when looking at this=
 proposal.

1) extensibility: I see openbmc as a base that many people will want to bui=
ld upon. To enable that, we need to be able to have easy ways to extend or =
override the things in the base.

-          Compile time extensions vs runtime loadable - open question

-          Need to add OEM extensions to individual URLs

-          Need to override specific properties in an individual URL

-          Need to be able to add entire new URI trees

-          Need to extend existing trees with links/references to new trees

-          Need to dynamically generate the metadata URIs

My commentary while reviewing this code is that I don't immediately see obv=
ious ways of doing any of these extensions that don't effectively fork the =
entire codebase and make future maintenance much more difficult.

2) (redfish) Easier ways of generating JSON and mapping JSON properties to =
backend data: The initial code to generate JSON I see here is quite simple,=
 but one aspect worries me. It appears that you have a nice and simple way =
to create the output JSON data structure, but right now most everything is =
hard coded. Once you start filling in the data "for real", we will need to =
write an ever-growing pile of code to translate from DBUS calls to get the =
data and poke the data into the correct spot in the JSON output.  In my min=
d, DBUS is introspectable and JSON is introspectable. It seems like it woul=
d be a big win to create a small, generic JSON engine that holds the data a=
nd then reads metadata about which calls to make to update the data.

3) performance: It looks like you currently make backend calls to satisfy r=
equests for data. This means that more frontend calls will result in higher=
 load on the backend. This means that it would be possible for frontend loa=
d to impact things like power/thermal reaction times without some limits on=
 the frontend webserver. However, the DBUS architecture has a signal based =
system for generating events that we could leverage. The webserver could ke=
ep an internal copy of all of its JSON output and subscribe to DBUS signals=
/events to update that internal cache. This way, external web requests do n=
ot automatically translate every time into internal DBUS calls. The webserv=
er could easily satisfy most web requests using data it already has on hand=
. This would result in much higher performance

4) security: the redfish standard has extension points to enable uploading =
new permission mappings or dynamically create roles and permissions. It's n=
ot clear to me how we would satisfy these dynamic security requirements

Token infrastructure: I haven't looked at this code yet. In general, though=
, I really like having token-based security middleware so that we can provi=
de extensions to support OAuth 2.0 and OpenID Connect support. The main ide=
a here is that we need a way to delegate security decisions to a trusted th=
ird party. If we are using standard JWT tokens compatible with OIDC for ide=
ntity, this makes the transition much easier.

--
Michael

From: openbmc [mailto:openbmc-bounces+michael.e.brown=3Ddell.com@lists.ozla=
bs.org] On Behalf Of Tanous, Ed
Sent: Monday, December 18, 2017 10:08 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Request for comments: C++ embedded webserver

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


--_000_378cc02cd4ce475698b52e1a242fc669ausx13mps334AMERDELLCOM_
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
	font-family:"Calibri",sans-serif;}
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
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
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
	{mso-list-id:959578651;
	mso-list-type:hybrid;
	mso-list-template-ids:-849995654 -1215015590 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.75in;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.25in;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.75in;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I started reviewing so=
me of the code, and I have quite a few thoughts, let&#8217;s see if I can c=
onvey them without writing a book. The main aspect I&#8217;m looking at is =
the redfish interface, but many of these apply equally
 well to the REST and redfish parts. Here are my initial thoughts when look=
ing at this proposal.<br>
<br>
1) extensibility: I see openbmc as a base that many people will want to bui=
ld upon. To enable that, we need to be able to have easy ways to extend or =
override the things in the base.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Compile time e=
xtensions vs runtime loadable &#8211; open question<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to add OE=
M extensions to individual URLs<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to overri=
de specific properties in an individual URL<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to be abl=
e to add entire new URI trees<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to extend=
 existing trees with links/references to new trees<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to dynami=
cally generate the metadata URIs<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">My commentary while re=
viewing this code is that I don&#8217;t immediately see obvious ways of doi=
ng any of these extensions that don&#8217;t effectively fork the entire cod=
ebase and make future maintenance much more difficult.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">2) (redfish) Easier wa=
ys of generating JSON and mapping JSON properties to backend data: The init=
ial code to generate JSON I see here is quite simple, but one aspect worrie=
s me. It appears that you have a nice
 and simple way to create the output JSON data structure, but right now mos=
t everything is hard coded. Once you start filling in the data &#8220;for r=
eal&#8221;, we will need to write an ever-growing pile of code to translate=
 from DBUS calls to get the data and poke the
 data into the correct spot in the JSON output. &nbsp;In my mind, DBUS is i=
ntrospectable and JSON is introspectable. It seems like it would be a big w=
in to create a small, generic JSON engine that holds the data and then read=
s metadata about which calls to make
 to update the data.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">3) performance: It loo=
ks like you currently make backend calls to satisfy requests for data. This=
 means that more frontend calls will result in higher load on the backend. =
This means that it would be possible
 for frontend load to impact things like power/thermal reaction times witho=
ut some limits on the frontend webserver. However, the DBUS architecture ha=
s a signal based system for generating events that we could leverage. The w=
ebserver could keep an internal
 copy of all of its JSON output and subscribe to DBUS signals/events to upd=
ate that internal cache. This way, external web requests do not automatical=
ly translate every time into internal DBUS calls. The webserver could easil=
y satisfy most web requests using
 data it already has on hand. This would result in much higher performance =
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">4) security: the redfi=
sh standard has extension points to enable uploading new permission mapping=
s or dynamically create roles and permissions. It&#8217;s not clear to me h=
ow we would satisfy these dynamic security
 requirements<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Token infrastructure: =
I haven&#8217;t looked at this code yet. In general, though, I really like =
having token-based security middleware so that we can provide extensions to=
 support OAuth 2.0 and OpenID Connect support.
 The main idea here is that we need a way to delegate security decisions to=
 a trusted third party. If we are using standard JWT tokens compatible with=
 OIDC for identity, this makes the transition much easier.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Michael<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D"><o:p>&nbsp;</o:p></span></a></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc [mailto:openbmc-bounces&#43;mic=
hael.e.brown=3Ddell.com@lists.ozlabs.org]
<b>On Behalf Of </b>Tanous, Ed<br>
<b>Sent:</b> Monday, December 18, 2017 10:08 PM<br>
<b>To:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Request for comments: C&#43;&#43; embedded webserver<o:p></=
o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_378cc02cd4ce475698b52e1a242fc669ausx13mps334AMERDELLCOM_--
