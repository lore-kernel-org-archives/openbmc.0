Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2By72FF2zDr21
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 11:16:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2017 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; d="scan'208,217";a="4521773"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga006.jf.intel.com with ESMTP; 20 Dec 2017 16:16:06 -0800
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 20 Dec 2017 16:16:05 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.57]) by
 ORSMSX162.amr.corp.intel.com ([169.254.3.44]) with mapi id 14.03.0319.002;
 Wed, 20 Dec 2017 16:16:06 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Request for comments: C++ embedded webserver
Thread-Topic: Request for comments: C++ embedded webserver
Thread-Index: AdN4ftVuoDXj0cc0QHy/ckqdQwlbewBSDjqgAATuHMA=
Date: Thu, 21 Dec 2017 00:16:05 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4B2271@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
 <378cc02cd4ce475698b52e1a242fc669@ausx13mps334.AMER.DELL.COM>
In-Reply-To: <378cc02cd4ce475698b52e1a242fc669@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_7E9441B1E5EFFD4681F54958E82169932F4B2271ORSMSX114amrcor_"
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
X-List-Received-Date: Thu, 21 Dec 2017 00:16:16 -0000

--_000_7E9441B1E5EFFD4681F54958E82169932F4B2271ORSMSX114amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

These are all great comments.  Let me see if I can walk you through my thou=
ght process for some of them.

Thank you for your thoughts;  Keep them coming if you have more.

-Ed

From: Michael.E.Brown@dell.com [mailto:Michael.E.Brown@dell.com]
Sent: Wednesday, December 20, 2017 11:50 AM
To: Tanous, Ed <ed.tanous@intel.com>; openbmc@lists.ozlabs.org
Subject: RE: Request for comments: C++ embedded webserver

I started reviewing some of the code, and I have quite a few thoughts, let'=
s see if I can convey them without writing a book. The main aspect I'm look=
ing at is the redfish interface, but many of these apply equally well to th=
e REST and redfish parts. Here are my initial thoughts when looking at this=
 proposal.

1) extensibility: I see openbmc as a base that many people will want to bui=
ld upon. To enable that, we need to be able to have easy ways to extend or =
override the things in the base.

My thoughts here mirror your own, and it's a problem that I don't think has=
 been solved.  In my mind, these are huge opens for me that I would like to=
 see how to resolve without making a lot of mess.


-          Compile time extensions vs runtime loadable - open question
My preference would be for a compile time superset of functionality.  I dis=
like the idea of managing a runtime dynamic library registration scheme, du=
e to the lack of traceability in code, and problems I've had in the past, b=
ut if you have ideas here, I'm all ears.


-          Need to add OEM extensions to individual URLs

-          Need to override specific properties in an individual URL

-          Need to be able to add entire new URI trees

-          Need to extend existing trees with links/references to new trees

At one point, the different sub trees were detectable and selectable at bui=
ld time as header only libraries.  If you look at redfish_v1.hpp, specifica=
lly the request_routes function, essentially all endpoints are "registered"=
 with the url handler at runtime, but compiled into the main application.  =
The way this was implemented uses the registration scheme for generating th=
e individual redfish sub routes, so in theory a newly registered URL would =
be somewhat self-contained, and the higher level redfish routes would autom=
atically add the routes to the tree.  The way this was built allows overrid=
ing essentially any endpoint with your own code at compile time using anoth=
er registration.  There is a lot more work to do here, but I think the desi=
gn supports what you want, at least in principal if not in examples.

You are absolutely right, there is a lot of stuff hardcoded to values that =
will need to be overridden.  My preference would be to push the things that=
 need to be configurable to dbus parameters so it can be modified at will, =
and by any client.  With that said, I suspect that won't work in all cases,=
 and we likely need to start with a couple examples of endpoints that need =
to be configured differently.


-          Need to dynamically generate the metadata URIs
Completely agree.


My commentary while reviewing this code is that I don't immediately see obv=
ious ways of doing any of these extensions that don't effectively fork the =
entire codebase and make future maintenance much more difficult.

Without devolving into a small novel (I'd rather just show the ideas as cod=
e) my thought was that there would be a Cmake step to detect applicable hea=
ders and generate a "register" file that would be compiled in.  This assume=
s that the modifiable parts of the handler infrastructure aren't sourced fr=
om DBus.  In general, a dbus workflow would look like this:

Call mapper to determine dbus objects expose a "Chassis" interfaces
For Chassis in chassis objects:
              Register endpoint

I hope that dbus could cover most of the configurability that's needed, but=
 I haven't trodden too far down this path yet.

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

This was the original direction I went, and very quickly backtracked as the=
 complexity grew.  This assumes the mapping of dbus property to a redfish p=
roperty is 1:1 and can be covered generically.  I found this to not be the =
case for a few reasons:

Some values needed conversions: ie, openbmc sensors are scaled integers tha=
t require a float conversion using two values on the bus.
Some properties don't exist on dbus at all, and need to be sourced from wit=
hin the daemon (like Manager UUID)
Some properties will likely need to be generated from files on disk (like C=
omputerSystem UUID)
Some properties will need to generate files onto disk, and take special act=
ions (like writing an SSL certificate)
Some properties and structures are aggregated into a single call instead of=
 exposed separately, despite coming from the same "property" name (like in =
the case of the thermal schema) they are aggregated as dbus objects that co=
ntain some hardcoded fields, as well as some generated fields.
Some properties will need to be cached from dbus for performance on larger =
systems (sensor readings come to mind here).
Some properties will need to be read-only instead of read write.  While thi=
s is captured in the property descriptions of DBus, I wasn't comfortable ma=
king the security assumption that anything that's writeable on dbus should =
be writeable externally.
Some properties require a call to the mapper to map an available interface =
name to the object on the bus that supports that interface.
Some properties will likely require a system call to return the result (Pri=
vileges schema getting user group membership for example).

There are probably more avenues of flexibility here and in the end, I ended=
 up with a rats nest of special cases that usually only applied to a single=
 property.  I suspect I swung the hammer back too far here toward hardcodin=
g, and there is likely a middle ground that would result in less code, but =
for the number of schemas this patchset currently supports, I didn't find a=
ny abstractions that were useful.


3) performance: It looks like you currently make backend calls to satisfy r=
equests for data. This means that more frontend calls will result in higher=
 load on the backend. This means that it would be possible for frontend loa=
d to impact things like power/thermal reaction times without some limits on=
 the frontend webserver.
This is very true, and on my list of things that need tackling.  Imposing l=
imits correctly (so they're not exposable as DOS attack vectors) is a non-t=
rivial problem.  With that said, the crow framework supports middleware's t=
hat I think can be enabled to help with this.  For certain things, I don't =
think this can be avoided, as DBus is currently our source of "truth" for s=
ystem state.

However, the DBUS architecture has a signal based system for generating eve=
nts that we could leverage.
I had a prototypes of exactly this for sensors at one time.  This is someth=
ing I think can be reasonably abstracted as a "dbus cache" that can be reus=
ed reliably.  Ideally I'd like to work this cache into an ETag header handl=
er so most unchanged requests can be sourced without even regenerating or s=
toring the return json.

The webserver could keep an internal copy of all of its JSON output and sub=
scribe to DBUS signals/events to update that internal cache. This way, exte=
rnal web requests do not automatically translate every time into internal D=
BUS calls. The webserver could easily satisfy most web requests using data =
it already has on hand. This would result in much higher performance
It should be noted, this caching mechanism becomes a tradeoff of total syst=
em speed for response time speed.  As all the values need to be cached in t=
he webserver, this means that there are process context switches to the web=
 server on every property change.  While great for the web response times a=
nd performance, it's pretty detrimental to the rest of the system, as most =
BMC targets are single core ARM devices without a lot of extra CPU power.  =
We should run some performance measurements of the impact in both cases and=
 talk about the tradeoffs.  There might be some compromise here by using pr=
ocess priority, but I don't have great data here.

4) security: the redfish standard has extension points to enable uploading =
new permission mappings or dynamically create roles and permissions. It's n=
ot clear to me how we would satisfy these dynamic security requirements
This is intentionally omitted in this push because a lot of the user manage=
ment architecture is in flux and under discussion in the OpenBmc community.=
  Today, the webserver simply logs in as a given user using PAM, then does =
no role or privilege checks apart from if the user is enabled.  My assumpti=
on is that the authentication middleware would be extended with a module fo=
r this dynamic security mapping.  With that said, I haven't looked at that =
part of redfish in depth, and all our previous experience used fixed roles =
so I'm very keen if you guys have some experience here.

Token infrastructure: I haven't looked at this code yet. In general, though=
, I really like having token-based security middleware so that we can provi=
de extensions to support OAuth 2.0 and OpenID Connect support. The main ide=
a here is that we need a way to delegate security decisions to a trusted th=
ird party. If we are using standard JWT tokens compatible with OIDC for ide=
ntity, this makes the transition much easier.
All of the token infrastructure is flexible, and what's there was mostly bu=
ilt as a "get it to work" type thing.  I intentionally avoided JWT initiall=
y because I had no experience with using them outside of a few toy apps, an=
d there are concerns about the session timeout capabilities, given the fact=
 that systems can have a huge variant in the system clock during cmos reset=
.  The ability to get a shared secret onto the BMC and store it securely al=
so concern me, but I suspect they are solvable problems with enough thinkin=
g about it.

Thanks again for all your thoughts.

--
Michael

From: openbmc [mailto:openbmc-bounces+michael.e.brown=3Ddell.com@lists.ozla=
bs.org] On Behalf Of Tanous, Ed
Sent: Monday, December 18, 2017 10:08 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.=
org>>
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


--_000_7E9441B1E5EFFD4681F54958E82169932F4B2271ORSMSX114amrcor_
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
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal-compose;
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
@list l1
	{mso-list-id:1329210559;
	mso-list-type:hybrid;
	mso-list-template-ids:-75435932 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">These are all great co=
mments.&nbsp; Let me see if I can walk you through my thought process for s=
ome of them.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thank you for your tho=
ughts;&nbsp; Keep them coming if you have more.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-Ed<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Michael.E.Brown@dell.com [mailto:Michae=
l.E.Brown@dell.com]
<br>
<b>Sent:</b> Wednesday, December 20, 2017 11:50 AM<br>
<b>To:</b> Tanous, Ed &lt;ed.tanous@intel.com&gt;; openbmc@lists.ozlabs.org=
<br>
<b>Subject:</b> RE: Request for comments: C&#43;&#43; embedded webserver<o:=
p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">My thoughts here mirror yo=
ur own, and it&#8217;s a problem that I don&#8217;t think has been solved.&=
nbsp; In my mind, these are huge opens for me that I would like to see how =
to resolve without making a lot of mess.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Compile time e=
xtensions vs runtime loadable &#8211; open question<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:59.25pt"><span style=3D"color:r=
ed">My preference would be for a compile time superset of functionality.&nb=
sp; I dislike the idea of managing a runtime dynamic library registration s=
cheme, due to the lack of traceability in code,
 and problems I&#8217;ve had in the past, but if you have ideas here, I&#82=
17;m all ears.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:59.25pt"><span style=3D"color:r=
ed"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to add OE=
M extensions to individual URLs<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to overri=
de specific properties in an individual URL<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to be abl=
e to add entire new URI trees<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to extend=
 existing trees with links/references to new trees<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">At one point, the differen=
t sub trees were detectable and selectable at build time as header only lib=
raries.&nbsp; If you look at redfish_v1.hpp, specifically the request_route=
s function, essentially all endpoints are
 &#8220;registered&#8221; with the url handler at runtime, but compiled int=
o the main application.&nbsp; The way this was implemented uses the registr=
ation scheme for generating the individual redfish sub routes, so in theory=
 a newly registered URL would be somewhat self-contained,
 and the higher level redfish routes would automatically add the routes to =
the tree.&nbsp; The way this was built allows overriding essentially any en=
dpoint with your own code at compile time using another registration.&nbsp;=
 There is a lot more work to do here, but
 I think the design supports what you want, at least in principal if not in=
 examples.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:red">You are absolutely right, =
there is a lot of stuff hardcoded to values that will need to be overridden=
.&nbsp; My preference would be to push the things that need to be configura=
ble to dbus parameters so it can be modified
 at will, and by any client.&nbsp; With that said, I suspect that won&#8217=
;t work in all cases, and we likely need to start with a couple examples of=
 endpoints that need to be configured differently.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.25in=
;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"mso-list:=
Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Need to dynami=
cally generate the metadata URIs<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Completely agree.</span><s=
pan style=3D"color:red"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">My commentary while re=
viewing this code is that I don&#8217;t immediately see obvious ways of doi=
ng any of these extensions that don&#8217;t effectively fork the entire cod=
ebase and make future maintenance much more difficult.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Without devolving into a s=
mall novel (I&#8217;d rather just show the ideas as code) my thought was th=
at there would be a Cmake step to detect applicable headers and generate a =
&#8220;register&#8221; file that would be compiled in.&nbsp;
 This assumes that the modifiable parts of the handler infrastructure aren&=
#8217;t sourced from DBus.&nbsp; In general, a dbus workflow would look lik=
e this:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:red">Call mapper to determine d=
bus objects expose a &#8220;Chassis&#8221; interfaces<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">For Chassis in chassis obj=
ects:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Register endpoint<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:red">I hope that dbus could cov=
er most of the configurability that&#8217;s needed, but I haven&#8217;t tro=
dden too far down this path yet.<o:p></o:p></span></p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">This was the original dire=
ction I went, and very quickly backtracked as the complexity grew.&nbsp; Th=
is assumes the mapping of dbus property to a redfish property is 1:1 and ca=
n be covered generically.&nbsp; I found this to
 not be the case for a few reasons:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some values needed convers=
ions: ie, openbmc sensors are scaled integers that require a float conversi=
on using two values on the bus.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties don&#8217;=
t exist on dbus at all, and need to be sourced from within the daemon (like=
 Manager UUID)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties will likel=
y need to be generated from files on disk (like ComputerSystem UUID)<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties will need =
to generate files onto disk, and take special actions (like writing an SSL =
certificate)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties and struct=
ures are aggregated into a single call instead of exposed separately, despi=
te coming from the same &#8220;property&#8221; name (like in the case of th=
e thermal schema) they are aggregated as dbus objects
 that contain some hardcoded fields, as well as some generated fields.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties will need =
to be cached from dbus for performance on larger systems (sensor readings c=
ome to mind here).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties will need =
to be read-only instead of read write.&nbsp; While this is captured in the =
property descriptions of DBus, I wasn&#8217;t comfortable making the securi=
ty assumption that anything that&#8217;s writeable on
 dbus should be writeable externally.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties require a =
call to the mapper to map an available interface name to the object on the =
bus that supports that interface.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Some properties will likel=
y require a system call to return the result (Privileges schema getting use=
r group membership for example).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:red">There are probably more av=
enues of flexibility here and in the end, I ended up with a rats nest of sp=
ecial cases that usually only applied to a single property.&nbsp; I suspect=
 I swung the hammer back too far here toward
 hardcoding, and there is likely a middle ground that would result in less =
code, but for the number of schemas this patchset currently supports, I did=
n&#8217;t find any abstractions that were useful.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">3) performance: It loo=
ks like you currently make backend calls to satisfy requests for data. This=
 means that more frontend calls will result in higher load on the backend. =
This means that it would be possible
 for frontend load to impact things like power/thermal reaction times witho=
ut some limits on the frontend webserver.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">This is very true, and on =
my list of things that need tackling.&nbsp; Imposing limits correctly (so t=
hey&#8217;re not exposable as DOS attack vectors) is a non-trivial problem.=
&nbsp; With that said, the crow framework supports middleware&#8217;s
 that I think can be enabled to help with this.&nbsp; For certain things, I=
 don&#8217;t think this can be avoided, as DBus is currently our source of =
&#8220;truth&#8221; for system state.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">However, the DBUS arch=
itecture has a signal based system for generating events that we could leve=
rage.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">I had a prototypes of exac=
tly this for sensors at one time.&nbsp; This
<i>is</i> something I think can be reasonably abstracted as a &#8220;dbus c=
ache&#8221; that can be reused reliably.&nbsp; Ideally I&#8217;d like to wo=
rk this cache into an ETag header handler so most unchanged requests can be=
 sourced without even regenerating or storing the return
 json.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">The webserver could ke=
ep an internal copy of all of its JSON output and subscribe to DBUS signals=
/events to update that internal cache. This way, external web requests do n=
ot automatically translate every time
 into internal DBUS calls. The webserver could easily satisfy most web requ=
ests using data it already has on hand. This would result in much higher pe=
rformance
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">It should be noted, this c=
aching mechanism becomes a tradeoff of total system speed for response time=
 speed.&nbsp; As all the values need to be cached in the webserver, this me=
ans that there are process context switches
 to the web server on every property change.&nbsp; While great for the web =
response times and performance, it&#8217;s pretty detrimental to the rest o=
f the system, as most BMC targets are single core ARM devices without a lot=
 of extra CPU power. &nbsp;We should run some performance
 measurements of the impact in both cases and talk about the tradeoffs.&nbs=
p; There might be some compromise here by using process priority, but I don=
&#8217;t have great data here.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">4) security: the redfi=
sh standard has extension points to enable uploading new permission mapping=
s or dynamically create roles and permissions. It&#8217;s not clear to me h=
ow we would satisfy these dynamic security
 requirements<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">This is intentionally omit=
ted in this push because a lot of the user management architecture is in fl=
ux and under discussion in the OpenBmc community.&nbsp; Today, the webserve=
r simply logs in as a given user using PAM,
 then does no role or privilege checks apart from if the user is enabled.&n=
bsp; My assumption is that the authentication middleware would be extended =
with a module for this dynamic security mapping.&nbsp; With that said, I ha=
ven&#8217;t looked at that part of redfish in depth,
 and all our previous experience used fixed roles so I&#8217;m very keen if=
 you guys have some experience here.<o:p></o:p></span></p>
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
<p class=3D"MsoNormal"><span style=3D"color:red">All of the token infrastru=
cture is flexible, and what&#8217;s there was mostly built as a &#8220;get =
it to work&#8221; type thing.&nbsp; I intentionally avoided JWT initially b=
ecause I had no experience with using them outside of a few
 toy apps, and there are concerns about the session timeout capabilities, g=
iven the fact that systems can have a huge variant in the system clock duri=
ng cmos reset.&nbsp; The ability to get a shared secret onto the BMC and st=
ore it securely also concern me, but
 I suspect they are solvable problems with enough thinking about it.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Thanks again for all your =
thoughts.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Michael<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"></a><span style=3D"color=
:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc [<a href=3D"mailto:openbmc-boun=
ces&#43;michael.e.brown=3Ddell.com@lists.ozlabs.org">mailto:openbmc-bounces=
&#43;michael.e.brown=3Ddell.com@lists.ozlabs.org</a>]
<b>On Behalf Of </b>Tanous, Ed<br>
<b>Sent:</b> Monday, December 18, 2017 10:08 PM<br>
<b>To:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
>openbmc@lists.ozlabs.org</a>&gt;<br>
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
</div>
</body>
</html>

--_000_7E9441B1E5EFFD4681F54958E82169932F4B2271ORSMSX114amrcor_--
