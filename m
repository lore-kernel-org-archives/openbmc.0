Return-Path: <austenc@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BDA291A061E
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 12:53:42 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 21 Feb 2016 18:53:40 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 21 Feb 2016 18:53:39 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id B04851FF001F
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 18:41:48 -0700 (MST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1M1rc6X36503610
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 01:53:38 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1M1rc8V021591
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 20:53:38 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1M1rcq2021588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 20:53:38 -0500
Message-Id: <201602220153.u1M1rcq2021588@d01av03.pok.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 21 Feb 2016 20:53:38 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 21 Feb 2016 20:53:35 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 22 Feb 2016 01:53:34 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 22 Feb 2016 01:53:33 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016022201533184-138548 ;
 Mon, 22 Feb 2016 01:53:31 +0000 
Subject: Re: Linux 4.3.x gone?
In-Reply-To: <1456102444.15159.3.camel@au1.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
To: joel.stanley@au1.ibm.com
Cc: jeremy.kerr@au1.ibm.com, openbmc@lists.ozlabs.org, "Patrick Williams III"
 <iawillia@us.ibm.com>
Date: Mon, 22 Feb 2016 01:53:32 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1456102444.15159.3.camel@au1.ibm.com>,
 <201602200707.u1K77Htb001722@d01av03.pok.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 6971
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022201-0005-0000-0000-00001CA289FD
X-IBM-ISS-SpamDetectors: Score=0.397008; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004945; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000145; SDB=6.00663158; UDB=6.00301905; UTC=2016-02-22
 01:53:33
x-cbparentid: 16022201-5090-0000-0000-0000073C2EFD
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
X-List-Received-Date: Mon, 22 Feb 2016 01:53:43 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >4.4 is lts (supported to 2018)&nbsp; and=
 4.3.x is not?&nbsp; I'm thinking we should have this discussion on our wee=
kly interlock and come up with a migration plan (or not).
<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Joel Stanley &lt;joel.stanley@=
au1.ibm.com&gt;<br>To: Chris Austen/Austin/IBM@IBMUS, openbmc@lists.ozlabs.=
org<br>Cc: Patrick Williams III/Rochester/IBM@IBMUS, Jeremy Kerr &lt;jeremy=
.kerr@au1.ibm.com&gt;<br>Subject: Re: Linux 4.3.x gone?<br>Date: Sun, Feb 2=
1, 2016 6:55 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hi Chris,<br><br>On Sat, 2016-02-20 at 07:07 +0000, Chris Austen wrote=
:<br>&gt; <a href=3D"http://lkml.iu.edu/hypermail/linux/kernel/1602.2/03670=
.html" target=3D"=5Fblank" >http://lkml.iu.edu/hypermail/linux/kernel/1602.=
2/03670.html</a><br>&gt; &nbsp;<br>&gt; How does this effect your up-stream=
ing?&nbsp; When are we moving to 4.4?<br><br>This doesn't affect the upstre=
aming at all. As I mentioned on the call<br>the other day, I have a tree th=
at is based on 4.5-rc3, and this is what<br>I will send upstream once we've=
 had a chance to review it.<br><br>We can move to 4.4 as soon as you and th=
e rest of the team are<br>comfortable. As with any change, there is a small=
 risk of regressions,<br>so we want to do this at an appropriate time.<br><=
br>Cheers,<br><br>Joel</font></div></blockquote></div></div></div></div><BR>
