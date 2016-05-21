Return-Path: <austenc@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rC00z1PzDzDqF4
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2016 08:32:18 +1000 (AEST)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 21 May 2016 16:32:15 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 21 May 2016 16:32:14 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 93F483E40044
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 16:32:13 -0600 (MDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4LMVn5040894572
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 22:32:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C6C82804A
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 18:32:11 -0400 (EDT)
Received: from d50lp02.ny.us.ibm.com (unknown [146.89.104.208])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS id 07C6D2803F
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 18:32:11 -0400 (EDT)
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 21 May 2016 18:32:10 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 21 May 2016 18:32:09 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 21 May 2016 22:32:08 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 21 May 2016 22:32:07 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016052122320617-143954 ;
 Sat, 21 May 2016 22:32:06 +0000 
Subject: Re: Aims for BMC emulation in qemu
In-Reply-To: <1463638966.2703.209.camel@aj.id.au>
From: "Chris Austen" <austenc@us.ibm.com>
To: andrew@aj.id.au
Cc: clg@kaod.org, joel@jms.id.au, openbmc@lists.ozlabs.org, patrick@stwcx.xyz, 
 teddy.reed@gmail.com
Date: Sat, 21 May 2016 22:32:06 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1463638966.2703.209.camel@aj.id.au>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_05022016_FP6 May 16, 2016
X-LLNOutbound: False
X-Disclaimed: 38351
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16052122-0029-0000-0000-00002BDF92C0
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005299; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00705462; UDB=6.00327195; UTC=2016-05-21
 22:32:07
x-cbparentid: 16052122-9900-0000-0000-000007D22954
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <20160521223211.07C6D2803F@b01ledav001.gho.pok.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 21 May 2016 22:32:19 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Thanks for starting this conversation An=
drew.&nbsp; I'll add my thoughts here too.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I think we will eventually get to modeling specific syste=
ms.&nbsp; So we should prepare for that in our architecture.&nbsp; Nothing =
wrong with baby steps though.&nbsp; IBM Power Firmware has found tremendous=
 value in modeling every single server we support since Power6.&nbsp; They =
use SIMICS and have a department of head count devoted to modeling systems.=
&nbsp; As more systems support the Aspeed BMC based servers there will be m=
ore developers asking for simulation support. It is easy to see carving out=
 a developer to support more models.&nbsp; That only works though if we pro=
vide a fertile simple environment.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >It is baby steps though and there is nothing wrong with a=
 " <font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D"2=
" >relaxed accuracy constraints</font> " model for now.&nbsp; The advances =
made already has allowed us to use a qemu model that uses the same apps and=
 kernel version as a Palmetto.&nbsp; Having a road map that slaps on the re=
al Ethernet later seems reasonable.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >So in short I think we want to create a build environment=
 that allows for inaccurate systems.&nbsp; Over time that environment shoul=
d grow from palmettoish to wedgeish, Zaius and witherspoonish</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Andrew Jeffery &lt;andrew@aj.i=
d.au&gt;<br>To: OpenBMC &lt;openbmc@lists.ozlabs.org&gt;<br>Cc: Patrick Wil=
liams &lt;patrick@stwcx.xyz&gt;, Teddy Reed &lt;teddy.reed@gmail.com&gt;, C=
=C3=A9dric Le Goater &lt;clg@kaod.org&gt;, Joel Stanley &lt;joel@jms.id.au&=
gt;, Chris Austen/Austin/IBM@IBMUS<br>Subject: Aims for BMC emulation in qe=
mu<br>Date: Thu, May 19, 2016 1:37 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hey all,<br><br>There's some divide as to whether our qemu machine typ=
es should<br>accurately describe the hardware, or whether compromises can b=
e made.<br>We've been at one extreme with the poky vexpress-based qemuarm s=
ystem,<br>but are progressing towards machine types that are a better refle=
ction<br>of the Aspeed SoCs.<br><br>C=C3=A9dric, Teddy, Joel and myself hav=
e been working on modelling the SoCs'<br>devices but some are more complex =
than others. For example getting<br>network up and running is desirable, bu=
t the the ftgmac100 code that<br>exists[1] has critical bugs and isn't upst=
ream (though we've started<br>fixing it[2][3]). We could use a different NI=
C (e.g. the Cadence GEM),<br>but this doesn't reflect the hardware.<br><br>=
So, do we compromise or not, or can we avoid the problem altogether?<br><br=
>Accuracy of the models is useful for kernel and u-boot development,<br>whe=
re you can iterate quickly on your own machine to gain confidence<br>before=
 deploying to hardware (but obviously requires the models to<br>exist).<br>=
<br>Alternatively, compromising on the models can allow us to accelerate<br=
>userspace development, where some of the hardware details are<br>abstracte=
d. For example, it would be useful to add a network device so<br>the robotf=
ramework&nbsp;tests[4] can be run. Depending on what you are<br>testing, yo=
u might not care for any hardware details.<br><br>At the moment we have a p=
almetto-bmc machine type in upstream qemu<br>(2.6.0) which describes the co=
re devices. Maybe the solution is to keep<br>such machine types as an accur=
ate reflection of the hardware, and<br>define others that have relaxed accu=
racy constraints for different<br>circumstances. I expect we'd be maintaini=
ng a fork if we did so, but it<br>would evaporate over time as more models =
were developed.<br><br>What are your thoughts?<br><br>Andrew<br><br><br>[1]=
&nbsp;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2013-03/msg0=
2601.html" target=3D"=5Fblank" >https://lists.gnu.org/archive/html/qemu-dev=
el/2013-03/msg02601.html</a><br>[2]&nbsp;<a href=3D"https://github.com/shen=
ki/qemu/tree/ftgmac100" target=3D"=5Fblank" >https://github.com/shenki/qemu=
/tree/ftgmac100</a><br>[3]&nbsp;<a href=3D"https://github.com/amboar/qemu/t=
ree/ast2400-net-ftgmac100" target=3D"=5Fblank" >https://github.com/amboar/q=
emu/tree/ast2400-net-ftgmac100</a><br>[4]&nbsp;<a href=3D"https://github.co=
m/mkumatag/openbmc-automation" target=3D"=5Fblank" >https://github.com/mkum=
atag/openbmc-automation</a></font></div>
<div id=3D"MIMEAttachInfoDiv" style=3D"display:none" title=3D"pgp-signature=
|signature.asc" >&nbsp;</div></blockquote></div></div></div><BR>
