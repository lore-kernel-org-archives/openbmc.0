Return-Path: <austenc@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 904941A08A3
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2015 11:24:46 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 12 Nov 2015 17:24:44 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 12 Nov 2015 17:24:41 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 11A9019D8026
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 17:12:49 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAD0NDDT7209460
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 17:23:13 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAD0OeYm030360
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 17:24:40 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAD0Oesn030327
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 17:24:40 -0700
Message-Id: <201511130024.tAD0Oesn030327@d03av02.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 12 Nov 2015 19:24:40 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 12 Nov 2015 19:24:37 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 13 Nov 2015 00:24:35 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 13 Nov 2015 00:24:33 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015111300243022-530867 ;
 Fri, 13 Nov 2015 00:24:30 +0000 
In-Reply-To: 
Subject: dbus connections
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 13 Nov 2015 00:24:30 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_11022015_FP3 November 10, 2015
X-LLNOutbound: False
X-Disclaimed: 28655
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15111300-0009-0000-0000-00000FB50C12
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004589; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00616564; UDB=6.00273180; UTC=2015-11-13
 00:24:34
x-cbparentid: 15111300-9588-0000-0000-000000D32A2B
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
X-List-Received-Date: Fri, 13 Nov 2015 00:24:47 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Brad found a problem today where the ipm=
i processes are creating dbus connections rather then relying on the parent=
 IPMI starting program.&nbsp; What happens is each error log is a connectio=
n, each fru is a connection. on our palmettos this wasn't obvious but on a =
broken Barreleye with 115 error logs and 46 different FRUs if certainly was=
.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >so how to fix this.&nbsp; #1 you could just extern the ip=
mid.C's bus variable to the files that need it.&nbsp; OR you could add the =
bus variable to every single ipmi calback input parameter.&nbsp;&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thoughts?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>&nbsp;</div>
<div>&nbsp;</div>
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div><BR>
