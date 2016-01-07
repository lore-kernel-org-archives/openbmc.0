Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 81ECC1A0228
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 14:28:48 +1100 (AEDT)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 13:28:46 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 7 Jan 2016 13:28:43 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 8E1492CE8056
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 14:28:43 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u073Saip4718674
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 14:28:45 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u073SAst002234
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 14:28:10 +1100
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u073S8IJ002096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 14:28:09 +1100
Message-Id: <201601070328.u073S8IJ002096@d23av06.au.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 6 Jan 2016 22:28:00 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 6 Jan 2016 22:27:58 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 03:27:56 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 Jan 2016 03:27:54 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016010703283655-4951 ; Thu, 7 Jan 2016 03:28:36 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <568DC239.2090601@ozlabs.org>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: jk@ozlabs.org
Cc: cyrilbur@gmail.com, openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Thu, 7 Jan 2016 03:27:53 +0000
Sensitivity: 
MIME-Version: 1.0
References: <568DC239.2090601@ozlabs.org>,<20160106160934.493e446f@camb691>
 <1451956226-19954-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201601060613.u066Dbgg023586@d23av03.au.ibm.com>
 <20160106175701.196f6a77@camb691>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 56031
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16010703-1618-0000-0000-0000036F69AB
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004760; HX=3.00000238; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00641622; UDB=6.00288869; UTC=2016-01-07
 03:27:56
x-cbparentid: 16010703-0598-0000-0000-000005DEBF69
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
X-List-Received-Date: Thu, 07 Jan 2016 03:28:48 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hey Jeremy,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >For the signature itself, I believe the current way I'm u=
sing it is what exactly the sd=5Fbus API requires (except for converting th=
ose inline strings to static const global variables). I cannot figure out a=
 way other than that. Any suggestions on how to handle the signatures in a =
better way?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Again, currently those signatures are exactly what those =
methods/property calls required, and they are working fine according to my =
test. Please let me know if this community has a better way or has any conv=
ention of doing that.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, Peng Fei (=E8=8B=
=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Jeremy Kerr &lt;jk=
@ozlabs.org&gt;<br>To: Cyril Bur &lt;cyrilbur@gmail.com&gt;, Peng Fei BG Go=
u/China/IBM@IBMCN<br>Cc: openbmc@lists.ozlabs.org, openbmc-patches@stwcx.xy=
z<br>Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ip=
mid command support with correct DBUS property handling.<br>Date: Thu, Jan =
7, 2016 9:42 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hi all,<br><br>&gt; Again, I'm not saying it won't work but I'm trying=
 to understand why the<br>&gt; complexity in these signatures, it doesn't s=
eem like it's being used and<br>&gt; pointless complexity doesn't help anyo=
ne.<br><br>Yes - I'd prefer to get these method signatures correct before o=
ther<br>code starts relying on it.<br><br>[the same philosophy applies to t=
he contributions in general - we should<br>be aiming to get the patch as co=
rrect as possible, rather than trying to<br>fix up later]<br><br>Regards,<b=
r><br><br>Jeremy</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
