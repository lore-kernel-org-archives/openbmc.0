Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D086D1A003F
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 15:03:09 +1100 (AEDT)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 18 Jan 2016 14:03:08 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 18 Jan 2016 14:03:05 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 872CA2BB0054
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 15:03:05 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0I42vIc8454312
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 15:03:05 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0I42XpZ011109
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 15:02:33 +1100
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0I42UR2010958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 15:02:32 +1100
Message-Id: <201601180402.u0I42UR2010958@d23av01.au.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sun, 17 Jan 2016 23:02:22 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 17 Jan 2016 23:02:20 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 18 Jan 2016 04:02:18 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 18 Jan 2016 04:02:17 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016011804030665-5541 ;
 Mon, 18 Jan 2016 04:03:06 +0000 
In-Reply-To: <201601160723.u0G7NPMm014807@d01av01.pok.ibm.com>
Subject: Re: [PATCH skeleton] skeleton: Add BMC cold_reset() method to
 org.openbmc.control.Bmc dbus interface
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: "Chris Austen" <austenc@us.ibm.com>
Cc: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>, openbmc
 <openbmc@lists.ozlabs.org>
Date: Mon, 18 Jan 2016 04:02:17 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <201601160723.u0G7NPMm014807@d01av01.pok.ibm.com>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01042016_FP2 January 15, 2016
X-LLNOutbound: False
X-Disclaimed: 2227
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16011804-0013-0000-0000-0000028CE536
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.03469; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004805; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000133; SDB=6.00646856; UDB=6.00292006; UTC=2016-01-18
 04:02:18
x-cbparentid: 16011804-7792-0000-0000-00000197CCD3
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
X-List-Received-Date: Mon, 18 Jan 2016 04:03:09 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Hi Chris,<br><br>Sorry I did not follow what you mean. The dbus inte=
rface "org.openbmc.control.Bmc" is already in Skeleton.<br>We just add a me=
thod "cold=5Freset()" to it. Do you mean we need to add a new dbus interfac=
e? Where should we add?<br><br>Are there any existing examples?<br><br>Than=
ks,<br>-Yi <br><br><br><font color=3D"#990099">-----"openbmc" &lt;<a target=
=3D"=5Fblank" href=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozla=
bs.org">openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote:=
 -----</font><br><br>&gt;To: "OpenBMC Patches" &lt;<a target=3D"=5Fblank" h=
ref=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt;<=
br>&gt;From: "Chris Austen" <br>&gt;Sent by: "openbmc" <br>&gt;Date: 01/16/=
2016 03:34PM<br>&gt;Cc: openbmc &lt;<a target=3D"=5Fblank" href=3D"mailto:o=
penbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;<br>&gt;Subject: R=
e: [PATCH skeleton] skeleton: Add BMC cold=5Freset() method<br>&gt;to org.o=
penbmc.control.Bmc dbus interface<br>&gt;<br>&gt;Needs to move out of skele=
ton. &nbsp;Use sdbus no gdbus<br>&gt;<br>&gt;Sent from my iPhone using IBM =
Verse<br>&gt;<br>&gt;On Jan 16, 2016, 12:31:39 AM, "OpenBMC Patches"<br>&gt=
;&lt;<a target=3D"=5Fblank" href=3D"mailto:openbmc-patches@stwcx.xyz">openb=
mc-patches@stwcx.xyz</a>&gt; wrote:<br>&gt;The&nbsp;host&nbsp;sends&nbsp;IP=
MI&nbsp;'cold&nbsp;reset'&nbsp;command&nbsp;to&nbsp;reset&nbsp;BMC.&nbsp;Ip=
mid<br>&gt;calls&nbsp;the&nbsp;org.openbmc.control.Bmc::cold=5Freset()&nbsp=
;to&nbsp;do&nbsp;reset.<br>&gt;cold=5Freset()&nbsp;just&nbsp;invoke&nbsp;"r=
eboot&nbsp;--force",&nbsp;which&nbsp;in&nbsp;effect<br>&gt;same&nbsp;as&nbs=
p;a&nbsp;'cold'&nbsp;reset.<br>&gt;<a target=3D"=5Fblank" href=3D"https://g=
ithub.com/openbmc/skeleton/pull/28">https://github.com/openbmc/skeleton/pul=
l/28</a><br>&gt;William&nbsp;(1):<br>&gt;&nbsp;skeleton:&nbsp;Add&nbsp;BMC&=
nbsp;cold=5Freset()&nbsp;method&nbsp;to&nbsp;org.openbmc.control.Bmc&nbsp;d=
bu<br>&gt;s<br>&gt;&nbsp;&nbsp;&nbsp;interface<br>&gt;interfaces/openbmc=5F=
intf.c&nbsp;|&nbsp;56&nbsp;+++++++++++++++++++++++---------------<br>&gt;--=
-------<br>&gt;interfaces/openbmc=5Fintf.h&nbsp;|&nbsp;10&nbsp;++++-----<br=
>&gt;objects/control=5Fbmc=5Fobj.c&nbsp;|&nbsp;35&nbsp;++++++++++++++++++++=
+++++----<br>&gt;xml/openbmc=5Fintf.xml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
|&nbsp;&nbsp;2&nbsp;+-<br>&gt;4&nbsp;files&nbsp;changed,&nbsp;65&nbsp;inser=
tions(+),&nbsp;38&nbsp;deletions(-)<br>&gt;--&nbsp;<br>&gt;2.6.4<br>&gt;=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt;open=
bmc&nbsp;mailing&nbsp;list<br>&gt;<a target=3D"=5Fblank" href=3D"mailto:ope=
nbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>&gt;<a target=3D"=5F=
blank" href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozl=
abs.org/listinfo/openbmc</a><br>&gt;<br>&gt;  =5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt;openbmc mailing list<br>&gt;=
<a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lis=
ts.ozlabs.org</a><br>&gt;<a target=3D"=5Fblank" href=3D"https://lists.ozlab=
s.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>&g=
t;</font><BR>
