Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 584211A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:10:20 +1100 (AEDT)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 29 Jan 2016 14:10:18 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 29 Jan 2016 14:10:17 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id DF1F52BB0057
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:10:16 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0T49jd043122868
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:09:53 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0T49iTa018206
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:09:44 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0T49gaL017915
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:09:44 +1100
Message-Id: <201601290409.u0T49gaL017915@d23av01.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 28 Jan 2016 21:09:34 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 28 Jan 2016 21:09:33 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 29 Jan 2016 04:09:32 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 29 Jan 2016 04:09:30 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016012904092998-3376 ;
 Fri, 29 Jan 2016 04:09:29 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v9] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <87y4b9yr9a.fsf@linux.vnet.ibm.com>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: stewart@linux.vnet.ibm.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Fri, 29 Jan 2016 04:09:29 +0000
Sensitivity: 
MIME-Version: 1.0
References: <87y4b9yr9a.fsf@linux.vnet.ibm.com>,
 <1453445426-28994-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453445426-28994-2-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 6983
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16012904-0029-0000-0000-000043F29C6C
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004849; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00652068; UDB=6.00295112; UTC=2016-01-29
 04:09:31
x-cbparentid: 16012904-4536-0000-0000-000005E8484A
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
X-List-Received-Date: Fri, 29 Jan 2016 04:10:20 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >OK, that's a fair suggestion.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I will fix this.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"=
ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, P=
eng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPOWER Enablement.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Stewart Smith &lt;=
stewart@linux.vnet.ibm.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@s=
twcx.xyz&gt;, openbmc@lists.ozlabs.org<br>Cc: Peng Fei BG Gou/China/IBM@IBM=
CN<br>Subject: Re: [PATCH phosphor-host-ipmid v9] Add get/set boot option i=
pmid command support with correct DBUS property handling.<br>Date: Fri, Jan=
 29, 2016 11:56 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes:<br>&gt; &nbs=
p;struct get=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=
=5Ft parameter;<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft set;<br>&gt; &nbsp; &=
nbsp; &nbsp;uint8=5Ft block;<br>&gt; &nbsp;} &nbsp;=5F=5Fattribute=5F=5F ((=
packed));<br>&gt; &nbsp;<br>&gt; +struct set=5Fsys=5Fboot=5Foptions=5Ft {<b=
r>&gt; + &nbsp; &nbsp;uint8=5Ft parameter;<br>&gt; + &nbsp; &nbsp;union {<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;struct {<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;uint8=5Ft d1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;uint8=5Ft d2;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint8=5Ft d3;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft=
 d4;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d5;<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d6;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d7;<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d8;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;} data8;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft data64;<br>&gt; =
+ &nbsp; &nbsp;} data;<br>&gt; +} &nbsp;=5F=5Fattribute=5F=5F ((packed));<b=
r><br>Why not "uint8=5Ft d[8]" ?<br><br><br>--<br>Stewart Smith<br>OPAL Arc=
hitect, IBM.</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
