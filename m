Return-Path: <miltonm@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 708591A0007
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 11:09:24 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 19:09:21 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 23 Feb 2016 19:09:18 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 62D7838C8026
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 19:09:18 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1O09IF631785000
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 00:09:18 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1O09HbI018311
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 19:09:18 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1O09HOI018272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 19:09:17 -0500
Message-Id: <201602240009.u1O09HOI018272@d01av04.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 17:09:17 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 23 Feb 2016 17:09:14 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 24 Feb 2016 00:09:13 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 24 Feb 2016 00:09:12 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016022400091114-502241 ;
 Wed, 24 Feb 2016 00:09:11 +0000 
In-Reply-To: <1456238703-11117-6-git-send-email-andrew@aj.id.au>
Subject: Re: [PATCH v3 5/6] openbmc: Lift mkfs opts to variables and use
 OVERRIDES capability
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 24 Feb 2016 00:09:11 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1456238703-11117-6-git-send-email-andrew@aj.id.au>,
 <1456238703-11117-1-git-send-email-andrew@aj.id.au>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 54043
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022400-0057-0000-0000-000003829959
X-IBM-ISS-SpamDetectors: Score=0.410169; BY=0.037561; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410169; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004955; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000147; SDB=6.00664061; UDB=6.00302446; UTC=2016-02-24
 00:09:13
x-cbparentid: 16022400-0598-0000-0000-0000068CC176
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
X-List-Received-Date: Wed, 24 Feb 2016 00:09:25 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br>Andrew Jeffery &lt;<a target=3D"=5Fblank" href=3D"mailto:and=
rew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>&gt;Subject: [PATCH v3 5/6]=
 openbmc: Lift mkfs opts to variables and use<br>&gt;OVERRIDES capability<b=
r>&gt;<br>&gt;Moves the ext4-specific mkfs options out to configuration var=
iables.<br>&gt;OVERLAY=5FMKFS=5FOPTS can be overridden using the usual bitb=
ake OVERRIDES<br>&gt;mechanism, where the override postfix is 'rwfs-${OVERL=
AY=5FBASETYPE}',<br>&gt;e.g. rwfs-ext4.<br>&gt;<br>&gt;Signed-off-by: Andre=
w Jeffery &lt;<a target=3D"=5Fblank" href=3D"mailto:andrew@aj.id.au">andrew=
@aj.id.au</a>&gt;<br>&gt;---<br>&gt; .../classes/obmc-phosphor-image=5Ftype=
s=5Fuboot.bbclass          | 12<br>&gt;+++++++++++-<br>&gt; 1 file changed,=
 11 insertions(+), 1 deletion(-)<br>&gt;<br>&gt;diff --git<br>&gt;a/meta-ph=
osphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass<br>&gt;b/meta-ph=
osphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass<br>&gt;index 961=
93a3..f75cdc1 100644<br>&gt;--- a/meta-phosphor/classes/obmc-phosphor-image=
=5Ftypes=5Fuboot.bbclass<br>&gt;+++ b/meta-phosphor/classes/obmc-phosphor-i=
mage=5Ftypes=5Fuboot.bbclass<br>&gt;@@ -23,6 +23,12 @@ FLASH=5FROFS=5FOFFSE=
T ?=3D "4864"<br>&gt; FLASH=5FRWFS=5FOFFSET ?=3D "28672"<br>&gt; RWFS=5FSIZ=
E ?=3D "4096"<br>&gt; <br>&gt;+# Avoid setting 'ext4' or 'jffs2' in OVERRID=
ES as this breaks the<br>&gt;build. Prefix<br>&gt;+# with 'rwfs-' to avoid =
option collisions.<br>&gt;+DISTROOVERRIDES .=3D ":rwfs-${OVERLAY=5FBASETYPE=
}"<br><br>or more simply comment the reason it breaks:<br><br># OVERRIDES o=
f just the file system type are reserved for <br># the primary image type.&=
nbsp; Prefix with rwfs- for the overlay.<br><br>otherwise,<br>Acked-by: Mil=
ton Miller &lt;<a target=3D"=5Fblank" href=3D"mailto:miltonm@us.ibm.com">mi=
ltonm@us.ibm.com</a>&gt;<br><br>milton<br></font><BR>
