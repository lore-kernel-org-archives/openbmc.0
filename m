Return-Path: <austenc@us.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQgLY5tRNzDqWs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 18:42:45 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 17 Mar 2016 01:42:42 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Mar 2016 01:42:33 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 150FA3E40030
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 01:42:33 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2H7gVvx17104972
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 00:42:33 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2H7gVTv022693
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 01:42:31 -0600
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2H7gV1L022606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 01:42:31 -0600
Message-Id: <201603170742.u2H7gV1L022606@d03av01.boulder.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 17 Mar 2016 01:42:31 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 17 Mar 2016 01:42:30 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 17 Mar 2016 07:42:25 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 17 Mar 2016 07:42:12 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016031707421178-57195 ;
 Thu, 17 Mar 2016 07:42:11 +0000 
In-Reply-To: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
Subject: Re: [PATCH] runqemu: Add palmetto target
From: "Chris Austen" <austenc@us.ibm.com>
To: joel@jms.id.au
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Date: Thu, 17 Mar 2016 07:42:11 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>,
 <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_02292016_FP2 March 07, 2016
X-LLNOutbound: False
X-Disclaimed: 51703
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16031707-0025-0000-0000-000022DC18D4
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0.059325; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005046; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000151; SDB=6.00674521; UDB=6.00308694; UTC=2016-03-17
 07:42:25
x-cbparentid: 16031707-5920-0000-0000-000006AE3C3D
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 07:42:46 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" ><div>&nbsp;</div>
<div>Add your command to the same help file here you see the existing qemua=
rm target</div>
<div>&nbsp;</div>
<div>You can now run 'bitbake &lt;target&gt;'</div>
<div>Common targets are:<br>&nbsp;&nbsp;&nbsp;&nbsp; obmc-phosphor-image</d=
iv>
<div>You can also run generated qemu images with a command like:<br>&nbsp;&=
nbsp;&nbsp;&nbsp; runqemu qemuarm &lt;&lt;&lt;&lt;&lt;---------WHERE EVER T=
HAT COMES FROM</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" ><div>&nbsp;</div>
<div>&nbsp;</div>
<div>I hit a build failure, but it went away the 2nd time I tried.&nbsp; Pr=
obably just ignore unless that is an interesting data point.</div>
<div>&nbsp;</div>
<div><div>| ERROR: Function failed: Fetcher failure for URL: 'git://git.qem=
u.org/qemu.git;protocol=3Dgit'. Unable to fetch URL from any source.<br>ERR=
OR: Task 71 (virtual:native:/home/causten/openbmc-barreleye/meta/recipes-de=
vtools/qemu/qemu=5Fgit.bb, do=5Ffetch) failed with exit code '1'</div></div>
<div><div>&nbsp;</div>
<div>No network yet :(&nbsp;&nbsp; Makes things hard to use.&nbsp; Can you =
add an ethernet device?</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Joel Stanley &lt;joel@jms.id.a=
u&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.=
ozlabs.org&gt;<br>To: Andrew Jeffery &lt;andrew@aj.id.au&gt;<br>Cc: OpenBMC=
 &lt;openbmc@lists.ozlabs.org&gt;<br>Subject: Re: [PATCH] runqemu: Add palm=
etto target<br>Date: Thu, Mar 17, 2016 12:20 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Thu, Mar 17, 2016 at 3:22 PM, Andrew Jeffery &lt;andrew@aj.id.au&gt=
; wrote:<br>&gt; The patch does a few things, but is more for inciting feed=
back than for<br>&gt; merging:<br>&gt;<br>&gt; * Adds qemu=5Fgit.bb in favo=
ur of qemu=5F2.4.0.bb<br>&gt; * Configured to build from master, at the com=
mit merging the AST2400 support<br>&gt; * Adds a runqemu target 'palmetto'<=
br><br>This is a good idea. Fix up the commit message so we can merge it :)=
<br><br>&gt;<br>&gt; diff --git a/yocto-poky/meta/recipes-devtools/qemu/qem=
u.inc b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc<br>&gt; index f6c0ae=
3..80ba2ca 100644<br>&gt; --- a/yocto-poky/meta/recipes-devtools/qemu/qemu.=
inc<br>&gt; +++ b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc<br><br>yoc=
to-poky is supposed to be the upstream repository, and shouldn't be<br>patc=
hed by us.<br><br>I don't know how poky lets us override built in recipies =
with those<br>from other meta- packages. Can we carry your qemu-git.bb in<b=
r>meta-whatever instead?<br><br>Patrick, do you have any suggestions here?<=
br><br><br>&gt; diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/script=
s/runqemu<br>&gt; index 23cf5be..f09da50 100755<br>&gt; --- a/yocto-poky/sc=
ripts/runqemu<br>&gt; +++ b/yocto-poky/scripts/runqemu<br><br>The changes t=
o this script look like a good start.<br><br>&gt; @@ -110,7 +110,7 @@ while=
 true; do<br>&gt; &nbsp; &nbsp; &nbsp;arg=3D${1}<br>&gt; &nbsp; &nbsp; &nbs=
p;case "$arg" in<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"qemux86" | "qem=
ux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \<br>&gt; =
- &nbsp; &nbsp; &nbsp; &nbsp;"qemumips64" | "qemush4" &nbsp;| "qemuppc" | "=
qemumicroblaze" | "qemuzynq")<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;"qemumip=
s64" | "qemush4" &nbsp;| "qemuppc" | "qemumicroblaze" | "qemuzynq" | "palme=
tto")<br><br>Perhaps call it qemupalmetto? qemupalmbmc? to match the existi=
ng ones.<br><br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[ -z "=
$MACHINE" ] &amp;&amp; MACHINE=3D$arg || \<br>&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error "conflicting MACHINE types [$MA=
CHINE] and [$arg]"<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
;;<br>&gt; @@ -236,13 +236,13 @@ fi<br>&gt;<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@=
lists.ozlabs.org<br><a href=3D"https://lists.ozlabs.org/listinfo/openbmc" t=
arget=3D"=5Fblank" >https://lists.ozlabs.org/listinfo/openbmc</a></font></d=
iv></blockquote></div></div></div></div><BR>
