Return-Path: <austenc@us.ibm.com>
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63C5D1A0C94
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 16:17:50 +1100 (AEDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 30 Oct 2015 23:17:48 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 30 Oct 2015 23:17:46 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 790271FF0021
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:05:57 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id t9V5GcpM8716610
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 22:16:38 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9V5Hjkf002568
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:17:45 -0600
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9V5HieN002544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:17:45 -0600
Message-Id: <201510310517.t9V5HieN002544@d03av05.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 31 Oct 2015 01:17:44 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 31 Oct 2015 01:17:41 -0400
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 31 Oct 2015 05:17:40 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 31 Oct 2015 05:17:39 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2015103105175194-11750 ;
 Sat, 31 Oct 2015 05:17:51 +0000 
In-Reply-To: 
Subject: We have a candidate driver
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Sat, 31 Oct 2015 05:17:38 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_10192015_FP1 October 21, 2015
X-LLNOutbound: False
X-Disclaimed: 56851
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15103105-0033-0000-0000-000006A0DEC2
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004552; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00610490; UDB=6.00269527; UTC=2015-10-31
 05:17:40
x-cbparentid: 15103105-9900-0000-0000-000004B6E3AA
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
X-List-Received-Date: Sat, 31 Oct 2015 05:17:52 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks to the hard work you all put in we now have a code=
 level that can power on without any patches.&nbsp; It boots all the way to=
 Petitboot.&nbsp; There are still some issues to resolve so please take tim=
e to check your emails this weekend and stick around on irc.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Norm is flying on Monday to deliver the firmware to Foxco=
nn and provide some training on usage.&nbsp; Take lots of notes Norm!&nbsp;=
</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I need some help verifying that this image can boot beyon=
d Petitboot and up all the way to a real OS.&nbsp; Any volunteers?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><strong>Palmetto Files for flashing this first candidate.=
...</strong></div>
<div dir=3D"ltr" >tftp server 9.3.164.219</div>
<div dir=3D"ltr" >/tftpboot/initrd=5F1031=5F2</div>
<div dir=3D"ltr" >/tftpboot/cuImage=5F1031=5F2</div>
<div dir=3D"ltr" >&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div><BR>
