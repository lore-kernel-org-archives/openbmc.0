Return-Path: <miltonm@us.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2FBCD1A0063
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 10:54:41 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 16:54:39 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 23 Feb 2016 16:54:33 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 53B6F19D803F
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 16:42:30 -0700 (MST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1NNsWno30998768
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 23:54:32 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1NNogL7030687
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 18:50:42 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1NNofGi030682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 18:50:41 -0500
Message-Id: <201602232350.u1NNofGi030682@d01av05.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 16:54:32 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 23 Feb 2016 16:54:29 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 23:54:28 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 23 Feb 2016 23:54:26 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016022323542595-496069 ;
 Tue, 23 Feb 2016 23:54:25 +0000 
In-Reply-To: <CACPK8XeAq+0RHcdDLP=ezEetCimnAPhDEFz0GJkqFYg4iE4-Lw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] oe_mkimage: Use consistent indentation
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 23 Feb 2016 23:54:25 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XeAq+0RHcdDLP=ezEetCimnAPhDEFz0GJkqFYg4iE4-Lw@mail.gmail.com>,
 <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-2-git-send-email-andrew@aj.id.au>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 11999
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022323-8236-0000-0000-000016661893
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.038135; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004955; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000147; SDB=6.00664056; UDB=6.00302443; UTC=2016-02-23
 23:54:27
x-cbparentid: 16022323-9900-0000-0000-000006460BF9
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
X-List-Received-Date: Tue, 23 Feb 2016 23:54:42 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>About 02/23/2016 04:55PM in some time zone, Joel Stanley wrote:<=
br>&gt;On Wed, Feb 24, 2016 at 1:14 AM, Andrew Jeffery &lt;<a target=3D"=5F=
blank" href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;<br>&gt;wrote=
:<br>&gt;&gt; It was inconsistent with the rest of the file, which seems to=
 use 7<br>&gt;&gt; spaces. In particular, vim-sleuth was detecting the inde=
ntation<br>&gt;style<br>&gt;&gt; from the first indent(s) in the file, whic=
h were in the oe=5Fmkimage<br>&gt;&gt; function.<br>&gt;<br>&gt;7 spaces se=
ems kind of unusual.<br>&gt;<br>&gt;Upstream bbclass files are a mixture; I=
'd go with 8 spaces as I<br>&gt;suspect that was the intent in this file.<b=
r>&gt;<br><br>Looks like yocto-poky/meta/classes/image=5Ftypes=5Fuboot.bbcl=
ass<br>upon which this is based used 4 spaces for the function that<br>was =
copied.<br><br>Going to 8 spaces puts one \ over 80 columns in do=5Fgenerat=
e=5Fflash<br>but its after a || so it can just be dropped and the shell wil=
l parse the <br>next line implicitly.<br><br>I don't care if we leave it at=
 7 for now or go to 8.<br><br><br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Andre=
w Jeffery &lt;<a target=3D"=5Fblank" href=3D"mailto:andrew@aj.id.au">andrew=
@aj.id.au</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt;  meta-phosphor/classes/obmc-p=
hosphor-image=5Ftypes=5Fuboot.bbclass | 6<br>&gt;+++---<br>&gt;&gt;  1 file=
 changed, 3 insertions(+), 3 deletions(-)<br>&gt;<br><br>milton<br></font><=
BR>
