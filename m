Return-Path: <miltonm@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2CD1A0063
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 10:55:49 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 25 Feb 2016 16:55:47 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 25 Feb 2016 16:55:45 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id EB1C23E40047
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 16:55:44 -0700 (MST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1PNti5228115072
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 23:55:44 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1PNtigA025942
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 18:55:44 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1PNthFg025878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 18:55:44 -0500
Message-Id: <201602252355.u1PNthFg025878@d01av04.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 25 Feb 2016 16:55:43 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 25 Feb 2016 16:55:41 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 25 Feb 2016 23:55:40 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 25 Feb 2016 23:55:38 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016022523553753-523428 ;
 Thu, 25 Feb 2016 23:55:37 +0000 
In-Reply-To: <1456373652.27420.67.camel@aj.id.au>
Subject: Re: [PATCH openbmc 9/9] initfs: Use stty to drain output before reboot
From: "Milton Miller II" <miltonm@us.ibm.com>
To: andrew@aj.id.au
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 25 Feb 2016 23:55:37 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1456373652.27420.67.camel@aj.id.au>,
 <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456339224-27295-10-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02152016_FP2 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 47595
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022523-0005-0000-0000-00001CC6B483
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.035528; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004964; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000148; SDB=6.00664963; UDB=6.00303007; UTC=2016-02-25
 23:55:39
x-cbparentid: 16022523-5938-0000-0000-00000231DF17
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
X-List-Received-Date: Thu, 25 Feb 2016 23:55:49 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br><font color=3D"#990099">-----Andrew Jeffery &lt;<a target=3D=
"=5Fblank" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote: -=
----</font><br><br>&gt;To: OpenBMC Patches &lt;<a target=3D"=5Fblank" href=
=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt;,<br=
>&gt;<a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">openbm=
c@lists.ozlabs.org</a><br>&gt;From: Andrew Jeffery &lt;<a target=3D"=5Fblan=
k" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;<br>&gt;Date: 02/=
24/2016 10:14PM<br>&gt;Cc: Milton Miller II/Austin/IBM@IBMUS<br>&gt;Subject=
: Re: [PATCH openbmc 9/9] initfs: Use stty to drain output<br>&gt;before re=
boot<br>&gt;<br>&gt;On Wed, 2016-02-24 at 12:40 -0600, OpenBMC Patches wrot=
e:<br>&gt;&gt; From: "Milton D. Miller II" &lt;<a target=3D"=5Fblank" href=
=3D"mailto:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&=
gt;&gt; To see all the messages during shutdown call stty cooked.<br>&gt;&g=
t; <br>&gt;&gt; A side effect of setting any mode is it will call ioctl(TIO=
C=5FDRAIN)<br>&gt;<br>&gt;So due to past indiscretions and increasing my ow=
n understanding I<br>&gt;tried to follow this up. Seems that:<br>&gt;<br>&g=
t;* TIOC=5FDRAIN doesn't appear to be a thing?<br>&gt;* Google knows more a=
bout TIOCDRAIN, but not a lot?<br>&gt;* TCSADRAIN might be more useful to m=
ention here?<br>&gt;<br>&gt;If I were to follow it up the TIOC=5FDRAIN , wh=
ere should I look?<br>&gt;<br>&gt;Should this part of the commit message be=
 changed?<br><br>Yes it should have, but while you raised it on irc last ni=
ght I didn't <br>read this message until several hours after I told Norm to=
 merge <br>the code.&nbsp; Sorry.<br><br>&gt;<br>&gt;However, I've followed=
 the busybox stty implementation to the point<br>&gt;of<br>&gt;calling tcse=
tattr(..., TCSADRAIN, ...), so the change looks like it<br>&gt;should do wh=
at we want. Also you've documented testing it below, so<br>&gt;that helps :=
)<br>&gt;<br><br>Yes. I also looked at the code to figure out what was need=
ed.<br><br>&gt;&gt; to drain the buffers first without regard to any change=
 in the<br>&gt;mode.<br>&gt;&gt; <br>&gt;&gt; Shutdown and flash update now=
 show the final ouptut<br>&gt;<br>&gt;typo: output<br>&gt;<br><br>Yes that =
it is :-).<br><br>&gt;Otherwise,<br>&gt;<br>&gt;Acked-by: Andrew Jeffery &l=
t;<a target=3D"=5Fblank" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a=
>&gt;<br>&gt;<br>&gt;&gt;  and "Rebooting"<br>&gt;&gt; message before the r=
eboot system call.<br>&gt;&gt; <br><br>Milton<br></font><BR>
