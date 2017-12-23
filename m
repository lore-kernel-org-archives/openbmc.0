Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="HBLI6Eme"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z3dvt27NLzDsSY
 for <openbmc@lists.ozlabs.org>; Sat, 23 Dec 2017 19:34:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1514018058; x=1545554058;
 h=from:to:subject:date:message-id:mime-version;
 bh=zmMaeZWuwLmW4GS3L7qJm5UdXo0iEOOSAvbAwhQIvhc=;
 b=HBLI6EmeTjSPABwR274q6vJ2KB5pKpPDxhM3vuS9gBhvrhtqf5TxlGTD
 /PyTE7lX6ahO5c/dqWNxHOR5pxafAw9KbCUfMqENFZVbuUtFbcFny/ddq
 U7p2fPndjPQhkj0aTD/iu9LS0oIuYDnH4osFBAKetJLnMWejkoZ5p94L6 Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3ADKrB0BX3fQtxAvLcYkxnrtniVhXV8LGtZVwlr6E/?=
 =?us-ascii?q?grcLSJyIuqrYbB2Bt8tkgFKBZ4jH8fUM07OQ7/i5HzRYqb+681k6OKRWUBEEjc?=
 =?us-ascii?q?hE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRo?=
 =?us-ascii?q?LerpBIHSk9631+ev8JHPfglEnjWwba9vIBmssQndqtQdjJd/JKo21hbHuGZDdf?=
 =?us-ascii?q?5MxWNvK1KTnhL86dm18ZV+7SleuO8v+tBZX6nicKs2UbJXDDI9M2Ao/8LrrgXM?=
 =?us-ascii?q?TRGO5nQHTGoblAdDDhXf4xH7WpfxtTb6tvZ41SKHM8D6Uaw4VDK/5KptVRTmij?=
 =?us-ascii?q?oINyQh/W/XlMJ+kb5brhyiqRx+34Hbb5qYO+BicqPfZ94WWXZNUthXWidcAo28?=
 =?us-ascii?q?dYwPD+8ZMOtfqIf9pkcBrRukCgayAOPj0DBGimXr0K0g1OQgHwfG0Rc9EN0QtH?=
 =?us-ascii?q?TUqM/5O7sVUeCw1aTFyyjIYfBO2Trl6YXFcQotre+CUL5ua8bd1EkiGgzfgliU?=
 =?us-ascii?q?rYHpJy6Z2vgXv2SG4OdtW/ijh3Mkpg1roTWix98ghpTGi48b0FzI6CR0zYcvKd?=
 =?us-ascii?q?C7SEN3e8CoHIdSuiycKoB4WNktQ3tytyY/0rAGvJm7czUUx5k/3B7fbuCHc5CP?=
 =?us-ascii?q?4hL+SOadOTd4i2xheLK4nxu971Ogxff9W8WuzVlFsC5Fkt3VunAKyhzT9tOISv?=
 =?us-ascii?q?xg/kenxDmDyRrf6uBcIUA0kKraJIQtzaI3lpoWqUjDHyn2l1vqjKKOd0gp+fKk?=
 =?us-ascii?q?5/rpb7n4vJOQKo95hw7kPqkqnsGzGeE4PRIPX2if9+S8zrrj/UjhTbtNj/05jq?=
 =?us-ascii?q?nZv4rEKsQfvKK3DBVZ35s56xa4ATam1s8VkmQZI1JBfBKLlZTmO1bLIPzgF/ew?=
 =?us-ascii?q?n0yskCt3x/DBJrDhBY3NIWbFkLj6eLZy91VRyA4yzdBE+5JUEasNIPXyW0/1rt?=
 =?us-ascii?q?PXFQQ5Pxazw+b9B9Uunr8ZDDaIGqKfOqbZmVuJ/f40Ze6eYIYfo3D6Mfdzo7a6?=
 =?us-ascii?q?gHN/hVYberSy9ZoRdH28WP9hJhPdKS7mj9EBOWQHpAwzSKrhklSZUT9VaDC1Ra?=
 =?us-ascii?q?1qonlvCp2tBJ3GT4aFnafH3S2+WJZRYzYCQgSGC37kc4iVUd8Rc2STKMonmTsB?=
 =?us-ascii?q?A/zpH5Um0R+knBLhjbttK6zf/ShO5rz5090gs8jSnhE7+DgyIoK3yWaSSUl4k2?=
 =?us-ascii?q?cMATQx2fYs8gRG1l6f3P0g0LRjHttJ6qYRXw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EYCADDEz5ah2Oa6ERdHAEBAQQBAQoBA?=
 =?us-ascii?q?YJKgUoQdC6dQJFBh32CAQqKC0MUAQEBAQEBAQEBAQIQAQEBCgsJCCgvQg4BgWc?=
 =?us-ascii?q?igngGXgGBHwcBBAEaiUJkp2s6hBcBhmmEDIISgz+CIIEOhQYCAoYQBaNLCpUfg?=
 =?us-ascii?q?iCKJodAilOML4E8NoFyb4J8ggMMVIE4ATqFc4J6ASUHgQaBFgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EYCADDEz5ah2Oa6ERdHAEBAQQBAQoBAYJKgUoQdC6dQJF?=
 =?us-ascii?q?Bh32CAQqKC0MUAQEBAQEBAQEBAQIQAQEBCgsJCCgvQg4BgWcigngGXgGBHwcBB?=
 =?us-ascii?q?AEaiUJkp2s6hBcBhmmEDIISgz+CIIEOhQYCAoYQBaNLCpUfgiCKJodAilOML4E?=
 =?us-ascii?q?8NoFyb4J8ggMMVIE4ATqFc4J6ASUHgQaBFgEBAQ?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2017 02:34:13 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2017 14:34:13 +0600
X-LoopCount0: from 10.166.136.214
X-IronPort-AV: E=Sophos;i="5.45,444,1508821200"; 
 d="scan'208,217";a="1027668465"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>, <ed.tanous@intel.com>,
 <benh@kernel.crashing.org>, <jwcarman@us.ibm.com>, <bradleyb@us.ibm.com>,
 <rolfb@us.ibm.com>
Subject: redfish design ideas
Thread-Topic: redfish design ideas
Thread-Index: AdN7UIt2noCZ8LAgQSS362kn2AYHFQ==
Date: Sat, 23 Dec 2017 08:34:12 +0000
Message-ID: <5ffd560ef1664dd8806fa7904dddf7f8@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_5ffd560ef1664dd8806fa7904dddf7f8ausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Sat, 23 Dec 2017 08:34:20 -0000

--_000_5ffd560ef1664dd8806fa7904dddf7f8ausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Definitions:
               Redfish resource: basically a single URI. For example /redfi=
sh/v1/Chassis is a single redfish resource
               Redfish property: a single named value inside a redfish reso=
urce.

Goals:
               Extensible redfish server that serves base openbmc redfish f=
unctionality (goal is Redfish OCP profile support), while at the same time =
should be extensible without forking so that it can be used by companies bu=
ilding on top of openbmc. I have been doing some proof of concept designs, =
and think that most of the ideas that I had been working on could be change=
d to fit into the existing openbmc design. Here is my simplified/brief prop=
osal on how we can write a redfish server, for discussion. I've previously =
sent out the pubic github of my existing golang redfish server prototype. H=
owever, the proposal below is an extension of that prototype's ideas, I don=
't really intend to fully use that prototype code (it has no dbus interface=
, and it would probably be better to start from the ground up rather than r=
etrofit dbus there.) Also worth mentioning: I strongly believe golang is th=
e best way to implement this, however, there is nothing about this proposal=
 that requires golang. It could easily be implemented in C++ if needed.

To that end, we design one daemon that presents the Redfish HTTP interface =
and internally exposes a DBUS API so that other daemons can publish redfish=
 data and update redfish data (with some built-in base behaviors). The idea=
 for this daemon is that it implements core handling of redfish json: store=
 a tree data structure that can be marshalled to redfish JSON over HTTP, ex=
pose dbus api to manipulate that tree, and some basic behaviors controlled =
by metadata, ie. "get this redfish resource property from this dbus propert=
y", "call this dbus function to get this redfish resource property", "liste=
n to signal xyz to update a redfish resource property." This daemon does no=
t per se implement the business logic to do redfish, its purpose is to impl=
ement the core behaviours. This daemon provides methods so that other daemo=
ns can publish redfish resources (create resource, delete resource), and pr=
ovides signals on events that change the resource tree (adding resources, u=
pdating properties).

Next, for implementing business logic, we can build in a few standard busin=
ess logic behaviors into the standard daemon, which I'll describe below.

Note that the implementation for this can be done in a few different ways. =
For example, the redfish server could easily keep the entire tree in RAM an=
d serve it from there. Or, alternatively, using the same interface, we coul=
d simply cache the redfish tree on disk in JSON files that are read as-need=
ed. I hear some concerns with keeping the entire tree in memory. Personally=
, I don't feel like this is likely to be a very big issue, as the total amo=
unt of data needed to save in memory to create the default OCP profiles is =
a few hundred KB. However, this concern can easily be addressed by having t=
he redfish daemon operate on saved json files in persistent storage, withou=
t changing the API at all. I have concrete data on this from my prototype s=
erver and it seems reasonable to me. Baseline was 6MB of RSS usage at runti=
me with the full redfish rack server mockup resident in RAM. That usage cli=
mbs to 11-12MB under heavy load and drops back down to 6MB after load is re=
moved.

DBUS Object paths
               /redfish/v1  --> Root object
               Then, each redfish URI that is published is represented as i=
ts own object path
               /redfish/v1/Systems
               /redfish/v1/Chassis
               /redfish/v1/Accounts
                              ... etc...

Interfaces:
               org.openbmc.redfish
                              Method: CreateResource
                              Method: DeleteResource
                              Method: UpdateProperties
                              Signal: ResourceCreated
                              Signal: ResourceDeleted
                              Signal: PropertiesUpdated

Startup sequence:
               On daemon startup, it will read the saved redfish tree from =
the filesystem create redfish resources for each. It emits "ResourceCreated=
" events for each resource. The saved redfish tree has metadata for each re=
dfish resource property to show how each property should be kept up-to-date=
. Additionally, other daemons on the system can listen for the ResourceCrea=
ted event and enrich the resource with additional data. For example, and OE=
M daemon can add new OEM properties to the resource.

OEM properties:
               Specific OEM daemons listen for signals for creation of the =
redfish resources they are interested in. Once they know about a base resou=
rce that they want to extend, they can use the UpdateProperties() method to=
 add new OEM properties.

Metadata:
               In the saved redfish tree, we can tag properties so that we =
can automatically update them. For example, redfish resource may have a pro=
perty: { "Id": "abc123" }. If this redfish property should be populated wit=
h the contents of a dbus property, we could have a metadata extension for t=
his property like so: { "Id@metadata": { "plugin": "dbus_property", "object=
_path": "org.openbmc.Chassis", "property": "chassis_tag" }}. In this way, w=
e can create different plugins to get data from different parts of the syst=
em. Note that this metadata is for the base redfish server. If more complic=
ated things need to be done, they can be done in another daemon which creat=
es redfish resources or modified/updates existing resources using the stand=
ard API.

Write side (PUT/PATCH/POST/DELETE):
               For each redfish resource property, the redfish server assoc=
iates metadata with it to determine how to handle GET/PUT/POST/PATCH/DELETE=
 and has some base behaviors built in that can be extended via DBUS. Base b=
ehavior is to handle PATCH/PUT by updating the internal data and emitting a=
 PropertiesUpdated Event, POST by emitting ResourceCreated, DELETE by emitt=
ing a ResourceDeleted event. However, this behavior is probably not useful =
for most property updates where validation or other processing needs to tak=
e place. For this, we allow metadata to define a DBUS method to call to do =
the property updates. For externally created resources, the associated meta=
data should detail which dbus methods to call.

--
Michael

--_000_5ffd560ef1664dd8806fa7904dddf7f8ausx13mps334AMERDELLCOM_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1122924798;
	mso-list-type:hybrid;
	mso-list-template-ids:1199743850 592206998 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
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
<p class=3D"MsoNormal">Definitions:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Redfish resource: basically a single URI. =
For example /redfish/v1/Chassis is a single redfish resource<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Redfish property: a single named value ins=
ide a redfish resource.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Goals:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Extensible redfish server that serves base=
 openbmc redfish functionality (goal is Redfish OCP profile support), while=
 at the same time should be extensible without forking so that it can be us=
ed by companies building on top
 of openbmc. I have been doing some proof of concept designs, and think tha=
t most of the ideas that I had been working on could be changed to fit into=
 the existing openbmc design. Here is my simplified/brief proposal on how w=
e can write a redfish server, for
 discussion. I&#8217;ve previously sent out the pubic github of my existing=
 golang redfish server prototype. However, the proposal below is an extensi=
on of that prototype&#8217;s ideas, I don&#8217;t really intend to fully us=
e that prototype code (it has no dbus interface, and
 it would probably be better to start from the ground up rather than retrof=
it dbus there.) Also worth mentioning: I strongly believe golang is the bes=
t way to implement this, however, there is nothing about this proposal that=
 requires golang. It could easily
 be implemented in C&#43;&#43; if needed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">To that end, we design on=
e daemon that presents the Redfish HTTP interface and internally exposes a =
DBUS API so that other daemons can publish redfish data and update redfish =
data (with some built-in base behaviors).
 The idea for this daemon is that it implements core handling of redfish js=
on: store a tree data structure that can be marshalled to redfish JSON over=
 HTTP, expose dbus api to manipulate that tree, and some basic behaviors co=
ntrolled by metadata, ie. &#8220;get this
 redfish resource property from this dbus property&#8221;, &#8220;call this=
 dbus function to get this redfish resource property&#8221;, &#8220;listen =
to signal xyz to update a redfish resource property.&#8221; This daemon doe=
s not per se implement the business logic to do redfish, its purpose
 is to implement the core behaviours. This daemon provides methods so that =
other daemons can publish redfish resources (create resource, delete resour=
ce), and provides signals on events that change the resource tree (adding r=
esources, updating properties).<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">Next, for implementing bu=
siness logic, we can build in a few standard business logic behaviors into =
the standard daemon, which I&#8217;ll describe below.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">Note that the implementat=
ion for this can be done in a few different ways. For example, the redfish =
server could easily keep the entire tree in RAM and serve it from there. Or=
, alternatively, using the same interface,
 we could simply cache the redfish tree on disk in JSON files that are read=
 as-needed. I hear some concerns with keeping the entire tree in memory. Pe=
rsonally, I don&#8217;t feel like this is likely to be a very big issue, as=
 the total amount of data needed to save
 in memory to create the default OCP profiles is a few hundred KB. However,=
 this concern can easily be addressed by having the redfish daemon operate =
on saved json files in persistent storage, without changing the API at all.=
 I have concrete data on this from
 my prototype server and it seems reasonable to me. Baseline was 6MB of RSS=
 usage at runtime with the full redfish rack server mockup resident in RAM.=
 That usage climbs to 11-12MB under heavy load and drops back down to 6MB a=
fter load is removed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DBUS Object paths<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /redfish/v1&nbsp; --&gt; Root object<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then, each redfish URI that is published i=
s represented as its own object path<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /redfish/v1/Systems<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /redfish/v1/Chassis<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /redfish/v1/Accounts<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#8230; etc&#8230;<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Interfaces:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; org.openbmc.redfish<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Method: CreateResource<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Method: DeleteResource<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Method: UpdateProperties<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Signal: ResourceCreated<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Signal: ResourceDeleted<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Signal: PropertiesUpdated<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Startup sequence:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; On daemon startup, it will read the saved =
redfish tree from the filesystem create redfish resources for each. It emit=
s &#8220;ResourceCreated&#8221; events for each resource. The saved redfish=
 tree has metadata for each redfish resource
 property to show how each property should be kept up-to-date. Additionally=
, other daemons on the system can listen for the ResourceCreated event and =
enrich the resource with additional data. For example, and OEM daemon can a=
dd new OEM properties to the resource.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">OEM properties:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Specific OEM daemons listen for signals fo=
r creation of the redfish resources they are interested in. Once they know =
about a base resource that they want to extend, they can use the UpdateProp=
erties() method to add new OEM
 properties.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Metadata:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In the saved redfish tree, we can tag prop=
erties so that we can automatically update them. For example, redfish resou=
rce may have a property: { &#8220;Id&#8221;: &#8220;abc123&#8221; }. If thi=
s redfish property should be populated with the contents
 of a dbus property, we could have a metadata extension for this property l=
ike so: { &#8220;Id@metadata&#8221;: { &#8220;plugin&#8221;: &#8220;dbus_pr=
operty&#8221;, &#8220;object_path&#8221;: &#8220;org.openbmc.Chassis&#8221;=
, &#8220;property&#8221;: &#8220;chassis_tag&#8221; }}. In this way, we can=
 create different plugins to get data from
 different parts of the system. Note that this metadata is for the base red=
fish server. If more complicated things need to be done, they can be done i=
n another daemon which creates redfish resources or modified/updates existi=
ng resources using the standard
 API.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Write side (PUT/PATCH/POST/DELETE):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For each redfish resource property, the re=
dfish server associates metadata with it to determine how to handle GET/PUT=
/POST/PATCH/DELETE and has some base behaviors built in that can be extende=
d via DBUS. Base behavior is
 to handle PATCH/PUT by updating the internal data and emitting a Propertie=
sUpdated Event, POST by emitting ResourceCreated, DELETE by emitting a Reso=
urceDeleted event. However, this behavior is probably not useful for most p=
roperty updates where validation
 or other processing needs to take place. For this, we allow metadata to de=
fine a DBUS method to call to do the property updates. For externally creat=
ed resources, the associated metadata should detail which dbus methods to c=
all.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Michael<o:p></o:p></p>
</div>
</body>
</html>

--_000_5ffd560ef1664dd8806fa7904dddf7f8ausx13mps334AMERDELLCOM_--
