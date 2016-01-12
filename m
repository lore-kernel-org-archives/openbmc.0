Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 107491A0D59
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:58:14 +1100 (AEDT)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Tue, 12 Jan 2016 12:58:12 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 12 Jan 2016 12:58:11 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id D71523578058
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:58:10 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C2w4mb22610156
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:58:12 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C2vc8L030533
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:57:38 +1100
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C2vaXV030198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:57:37 +1100
Message-Id: <201601120257.u0C2vaXV030198@d23av04.au.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Mon, 11 Jan 2016 21:57:27 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 11 Jan 2016 21:57:26 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Tue, 12 Jan 2016 02:57:25 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 12 Jan 2016 02:57:22 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016011202581796-563286 ;
 Tue, 12 Jan 2016 02:58:17 +0000 
In-Reply-To: <20160112020228.GA19934@localhost.localdomain>
Subject: Re: [PATCH phosphor-host-ipmid v7] Add get/set boot option ipmid
 command support with correct DBUS property handling.
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: sam@mendozajonas.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Tue, 12 Jan 2016 02:57:21 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 29903
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16011202-0025-0000-0000-000002BB8D95
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004778; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000131; SDB=6.00644000; UDB=6.00290288; UTC=2016-01-12
 02:57:23
x-cbparentid: 16011202-5920-0000-0000-000005A44588
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
X-List-Received-Date: Tue, 12 Jan 2016 02:58:15 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" >Hey Sam,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks for this information. Actually there is no compila=
tion error for the following code snip but the functionality is not correct=
. We should have PRIx64&nbsp;outside of the quote with a whitespace before =
it.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I actually discovered this in another branch during testi=
ng but unfortunately I forgot to merge it with my pull request, shame on me=
!&nbsp;There will be an update soon.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&gt; - &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;b=
uf, *data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5F=
value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf(buf, "%PRIx64", &amp;ret=
urn=5Fvalue);</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"=
ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, P=
eng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Sam Mendoza-Jonas =
&lt;sam@mendozajonas.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@stw=
cx.xyz&gt;<br>Cc: openbmc@lists.ozlabs.org, Peng Fei BG Gou/China/IBM@IBMCN=
<br>Subject: Re: [PATCH phosphor-host-ipmid v7] Add get/set boot option ipm=
id command support with correct DBUS property handling.<br>Date: Tue, Jan 1=
2, 2016 10:05 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hi,<br><br>On Mon, Jan 11, 2016 at 06:50:39PM -0600, OpenBMC Patches w=
rote:<br>&gt; From: shgoupf &lt;shgoupf@cn.ibm.com&gt;<br><br>(snip)<br><br=
>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf, *data=5Flen);=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5Fvalue;<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;sscanf(buf, "%PRIx64", &amp;return=5Fvalue);<br>=
<br>I just noticed this change from the previous version; have you tested<b=
r>this? I believe you need to use the PRIx64 specifier like this:<br><br>ss=
canf(buf, "%" PRIx64, &amp;return=5Fvalue);<br><br>Where PRIx64 is not with=
in the quotes. Do you get an error when you<br>build this?<br><br>Regards,<=
br>Sam Mendoza-Jonas</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
