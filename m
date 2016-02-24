Return-Path: <miltonm@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C32D91A0013
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 11:31:50 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 19:31:47 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 23 Feb 2016 19:31:46 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id C74DC38C8026
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 19:31:45 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1O0VjNx22216934
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 00:31:45 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1O0Vj6s026497
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 19:31:45 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1O0ViW9026479
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 19:31:44 -0500
Message-Id: <201602240031.u1O0ViW9026479@d01av01.pok.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 19:31:44 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 23 Feb 2016 19:31:42 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 24 Feb 2016 00:31:41 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 24 Feb 2016 00:31:38 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016022400313732-501254 ;
 Wed, 24 Feb 2016 00:31:37 +0000 
In-Reply-To: <1456272691.27420.26.camel@aj.id.au>
Subject: Re: [PATCH v3 3/6] obmc-{init,
 update}.sh: Cope with alternate RW FS types
From: "Milton Miller II" <miltonm@us.ibm.com>
To: andrew@aj.id.au
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 24 Feb 2016 00:31:38 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1456272691.27420.26.camel@aj.id.au>,
 <CACPK8XfMJWUjNv8+fZQyGdKVqN-QVVo-vUVKX0s=vWUD2+AwOg@mail.gmail.com>,
 <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-4-git-send-email-andrew@aj.id.au>
 <201602232337.u1NNb2FU028651@d01av02.pok.ibm.com>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 53999
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022400-0041-0000-0000-0000035D4B98
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.035966; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004955; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000147; SDB=6.00664069; UDB=6.00302451; UTC=2016-02-24
 00:31:39
x-cbparentid: 16022400-4536-0000-0000-0000064918AA
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
X-List-Received-Date: Wed, 24 Feb 2016 00:31:51 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br>Andrew Jeffery &lt;<a target=3D"=5Fblank" href=3D"mailto:and=
rew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>&gt;On Tue, 2016-02-23 at 2=
3:36 +0000, Milton Miller II wrote:<br>&gt;&gt; Around 02/23/2016 05:02PM i=
n some time zone, Joel Stanley wrote:<br>&gt;&gt; &gt;On Wed, Feb 24, 2016 =
at 1:15 AM, Andrew Jeffery &lt;<a target=3D"=5Fblank" href=3D"mailto:andrew=
@aj.id.au">andrew@aj.id.au</a>&gt;<br>&gt;&gt; &gt;wrote:<br>&gt;&gt; &gt;&=
gt; Busybox's blkid is a little hamstrung, requiring some processing<br>&gt=
;&gt; &gt;&gt; of the<br>&gt;&gt; &gt;&gt; output to emulate what can be ac=
hieved with a couple of options<br>&gt;&gt; &gt;&gt; with<br>&gt;&gt; &gt;&=
gt; blkid from util-linux.<br><br>...<br><br>&gt;&gt; But more awk less pip=
es!<br>&gt;&gt; <br>&gt;&gt; -       blkid $1 \<br>&gt;&gt; -              =
 | tr ' ' '\n' \<br>&gt;&gt; -               | awk -F=3D '/TYPE/ { print $2=
 }' \<br>&gt;&gt; -               | tr -d '"'<br>&gt;&gt; +       blkid $1 =
| awk ' { if (match($0, / TYPE=3D"[^"]*"/)) {<br>&gt;&gt; +                =
               print substr ($0, RSTART+7,<br>&gt;RLENGTH-8);<br>&gt;&gt; +=
                               exit 0; }<br>&gt;&gt; +                     =
  }'<br>&gt;<br>&gt;IMO this alternative is less readable: I find it relati=
vely harder to<br>&gt;parse the regex (with character classes and repetitio=
n operators) and<br>&gt;then perform substring indexing, than to follow the=
 pipeline of<br>&gt;substitutions and a straight text match. Horses for cou=
rses? Less<br>&gt;pipes<br>&gt;means less subprocesses but do we really car=
e here?<br>&gt;<br><br>Yea, I wasn't totallly happy with the result.&nbsp; =
But sub is messy in awk <br>compared to sed.&nbsp; We need to kill everythi=
ng before our requested <br>field and everything after its final quote:<br>=
<br>blkid /dev/mtdblock6 | sed -e 's/^.*TYPE=3D"//' -e 's/".*$//'<br><br>An=
d it provdes the expected output if you change TYPE to UUID.<br><br>milton<=
br></font><BR>
