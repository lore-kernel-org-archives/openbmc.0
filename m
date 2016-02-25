Return-Path: <miltonm@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A77811A0063
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 10:51:31 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 25 Feb 2016 16:51:29 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 25 Feb 2016 16:51:21 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 03DC23E4003F
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 16:51:21 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1PNpKHv34668672
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 16:51:20 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1PNpKlk005444
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 16:51:20 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1PNpJ0j005364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 16:51:20 -0700
Message-Id: <201602252351.u1PNpJ0j005364@d03av01.boulder.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 25 Feb 2016 18:51:19 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 25 Feb 2016 18:51:18 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 25 Feb 2016 23:51:17 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 25 Feb 2016 23:51:16 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016022523511560-522670 ;
 Thu, 25 Feb 2016 23:51:15 +0000 
In-Reply-To: <1456396970.27420.90.camel@aj.id.au>
Subject: Re: [PATCH openbmc 8/9] initfs: Add flash clear and update during init
From: "Milton Miller II" <miltonm@us.ibm.com>
To: andrew@aj.id.au
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 25 Feb 2016 23:51:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1456396970.27420.90.camel@aj.id.au>,
 <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456339224-27295-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02152016_FP2 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 51871
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022523-0009-0000-0000-000012BDC180
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.165392; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004964; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000148; SDB=6.00664961; UDB=6.00303006; UTC=2016-02-25
 23:51:17
x-cbparentid: 16022523-4536-0000-0000-00000654519E
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
X-List-Received-Date: Thu, 25 Feb 2016 23:51:32 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br><font color=3D"#990099">-----Andrew Jeffery &lt;<a target=3D=
"=5Fblank" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote: -=
----</font><br><br>&gt;To: OpenBMC Patches &lt;<a target=3D"=5Fblank" href=
=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt;,<br=
>&gt;<a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">openbm=
c@lists.ozlabs.org</a><br>&gt;From: Andrew Jeffery &lt;<a target=3D"=5Fblan=
k" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;<br>&gt;Date: 02/=
25/2016 04:43AM<br>&gt;Cc: Milton Miller II/Austin/IBM@IBMUS<br>&gt;Subject=
: Re: [PATCH openbmc 8/9] initfs: Add flash clear and update<br>&gt;during =
init<br>&gt;<br>&gt;On Wed, 2016-02-24 at 12:40 -0600, OpenBMC Patches wrot=
e:<br>&gt;&gt; From: Milton Miller &lt;<a target=3D"=5Fblank" href=3D"mailt=
o:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&gt;&gt; A=
dd code to clear the rwfs (preserving files from the whitelist)<br>&gt;&gt;=
 during init, by a command line option.<br>&gt;&gt; <br>&gt;&gt; Also allow=
 it to be triggered by the file system not being a jffs2.<br>&gt;<br>&gt;So=
 this helps avoid a two-stage upgrade process right? We write a new<br>&gt;=
(fixed wrt spi-nor) image-kernel and an updated image-initrd, reboot,<br>&g=
t;and then have obmc-init.sh switch the rwfs partition to JFFS2. Is<br>&gt;=
this<br>&gt;worth mentioning?<br>&gt;<br><br>Well, I gave oral instructions=
 at our morning scrum.&nbsp; Its a one-time<br>conversion, and can be acoom=
plished by leaving out image-rwfs<br>when updating.<br><br>We could also le=
ave a zero-length image-rwfs.<br><br>Also, we have a u-boot update to go wi=
th this kernel (to see serial<br>ouput when rebooting).<br><br><br>&gt;A cl=
eaning function seems useful; did you give any thought to a<br>&gt;factory<=
br>&gt;-reset function (i.e. not preserving the whitelist files)? I don't<b=
r>&gt;think this is covered either here or in obmc-update.sh? Avoiding<br>&=
gt;pflash<br>&gt;would be nice but it's probably a separate problem.<br><br=
>Norm has a setting to remove the whitelist when doing the update on<br>shu=
tdown version.&nbsp; There is a pending request (that I need to rebase) <br=
>to split the whitelist into seperate files by component.&nbsp; It still ne=
eds to <br>distribute the files to various recipes that are included.<br><b=
r>I don't support pflash for bmc update, and bmc=5Fupdate.py<br>in skeleton=
 has been updated to copy images since Jan 30.<br><br>&gt;<br>&gt;Otherwise=
:<br>&gt;<br>&gt;Reviewed-by: Andrew Jeffery &lt;<a target=3D"=5Fblank" hre=
f=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;<br>&gt;<br><br>Thanks.=
<br>milton<br><br></font><BR>
