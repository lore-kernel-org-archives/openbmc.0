Return-Path: <austenc@us.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qv0473Q8PzDq5y
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 07:39:34 +1000 (AEST)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 25 Apr 2016 15:39:32 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 25 Apr 2016 15:39:30 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 054E83E4003B
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 15:39:30 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3PLdTA738338646
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 14:39:29 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3PLdTon005790
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 15:39:29 -0600
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3PLdTn9005762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 15:39:29 -0600
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 25 Apr 2016 17:39:28 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 25 Apr 2016 17:39:27 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 25 Apr 2016 21:39:26 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 25 Apr 2016 21:39:24 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016042521392350-458611 ;
 Mon, 25 Apr 2016 21:39:23 +0000 
Subject: Re: [PATCH skeleton] Replace BUILD_ID with VERSION_ID in then
 inventory
In-Reply-To: <1461615651-31359-2-git-send-email-openbmc-patches@stwcx.xyz>
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc-patches@stwcx.xyz
Cc: openbmc@lists.ozlabs.org
Date: Mon, 25 Apr 2016 21:39:24 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1461615651-31359-2-git-send-email-openbmc-patches@stwcx.xyz>,
 <1461615651-31359-1-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04042016_FP6 April 15, 2016
X-LLNOutbound: False
X-Disclaimed: 10843
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16042521-0013-0000-0000-0000349651F9
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005202; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000160; SDB=6.00693259; UDB=6.00319865; UTC=2016-04-25
 21:39:25
x-cbparentid: 16042521-7792-0000-0000-00000336AF0A
Message-Id: <OFB7D627EE.88478494-ON00257FA0.0076F6B9-00257FA0.0076F6BB@notes.na.collabserv.com>
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
X-List-Received-Date: Mon, 25 Apr 2016 21:39:36 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >reviewed by Chris Austen &lt;austenc@us.=
ibm.com&gt;
<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: OpenBMC Patches &lt;openbmc-pa=
tches@stwcx.xyz&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+austenc=3Dus.=
ibm.com@lists.ozlabs.org&gt;<br>To: openbmc@lists.ozlabs.org<br>Cc:<br>Subj=
ect: [PATCH skeleton] Replace BUILD=5FID with VERSION=5FID in then inventor=
y<br>Date: Mon, Apr 25, 2016 3:21 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >From: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br><br>Add VERSION=5FID =
to the inventory instead of BUILD=5FID because<br>the version (git tag) is =
the value that gets updated during<br>a firmware update, the build id remai=
ns constant.<br>---<br>&nbsp;bin/inventory=5Fitems.py | 2 +-<br>&nbsp;1 fil=
e changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/bin/inventory=
=5Fitems.py b/bin/inventory=5Fitems.py<br>index 6320f90..0a90569 100755<br>=
--- a/bin/inventory=5Fitems.py<br>+++ b/bin/inventory=5Fitems.py<br>@@ -71,=
7 +71,7 @@ def getVersion():<br>&nbsp; for line in f:<br>&nbsp; p =3D line.=
rstrip('\n')<br>&nbsp; parts =3D line.rstrip('\n').split('=3D')<br>- if (pa=
rts[0] =3D=3D "BUILD=5FID"):<br>+ if (parts[0] =3D=3D "VERSION=5FID"):<br>&=
nbsp; version =3D parts[1]<br>&nbsp; return version<br>&nbsp;<br>--<br>2.8.=
1<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D"ht=
tps://lists.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists=
.ozlabs.org/listinfo/openbmc</a></font></div></blockquote></div></div></div=
></div><BR>
