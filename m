Return-Path: <miltonm@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 324C11A0103
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 10:37:06 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 16:37:03 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 23 Feb 2016 16:37:01 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id DAABF19D8042
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 16:24:57 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1NNb0fa31260726
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 16:37:00 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1NNb0S0007815
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 16:37:00 -0700
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1NNaxHK007793
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 16:37:00 -0700
Message-Id: <201602232337.u1NNaxHK007793@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 18:36:59 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 23 Feb 2016 18:36:58 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2016 23:36:57 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 23 Feb 2016 23:36:56 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016022323365591-485225 ;
 Tue, 23 Feb 2016 23:36:55 +0000 
In-Reply-To: <CACPK8XfMJWUjNv8+fZQyGdKVqN-QVVo-vUVKX0s=vWUD2+AwOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] obmc-{init,
 update}.sh: Cope with alternate RW FS types
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 23 Feb 2016 23:36:55 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XfMJWUjNv8+fZQyGdKVqN-QVVo-vUVKX0s=vWUD2+AwOg@mail.gmail.com>,
 <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-4-git-send-email-andrew@aj.id.au>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 49591
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022323-0005-0000-0000-00001CB41F01
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.041224; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004955; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000147; SDB=6.00664050; UDB=6.00302440; UTC=2016-02-23
 23:36:56
x-cbparentid: 16022323-7792-0000-0000-0000022007F5
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
X-List-Received-Date: Tue, 23 Feb 2016 23:37:06 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">(me found a new mailer option)<br><br>Around 02/23/2016 05:02PM in s=
ome time zone, Joel Stanley wrote:<br>&gt;<br>&gt;On Wed, Feb 24, 2016 at 1=
:15 AM, Andrew Jeffery &lt;<a target=3D"=5Fblank" href=3D"mailto:andrew@aj.=
id.au">andrew@aj.id.au</a>&gt;<br>&gt;wrote:<br>&gt;&gt; Busybox's blkid is=
 a little hamstrung, requiring some processing of<br>&gt;&gt;the<br>&gt;&gt=
; output to emulate what can be achieved with a couple of options<br>&gt;&g=
t;with<br>&gt;&gt; blkid from util-linux.<br>&gt;&gt;<br>&gt;&gt; Similar t=
o findmtd(), the code for probe=5Ffs=5Ftype() and<br>&gt;&gt;blkid=5Ffs=5Ft=
ype()<br>&gt;&gt; is duplicated between obmc-{init,update}.sh. Some conside=
ration<br>&gt;&gt;should<br>&gt;&gt; be given to splitting out common funct=
ionality into well-defined<br>&gt;&gt; sourcable scripts.<br>&gt;<br>&gt;Wh=
y not do that? :)<br><br>Well, for one , it reduces the reliability of the =
script and increases <br>the time by requiring opening and finding addition=
al files.&nbsp; But we <br>could put all these variables in that file with =
it.<br><br>I vote for later.<br><br>&gt;<br>&gt;Put an example of the input=
 and what you expect as the output in the<br>&gt;comment.<br>&gt;<br><br>On=
e can run the command if they need to see it, and its common to<br>ubuntu a=
nd busybox.<br><br>&gt;&gt; +       blkid $1 \<br>&gt;&gt; +               =
| tr ' ' '\n' \<br>&gt;&gt; +               | awk -F=3D '/TYPE/ { print $2 =
}' \<br>&gt;&gt; +               | tr -d '"'<br>&gt;&gt; +}<br>&gt;&gt; +<b=
r><br>But more awk less pipes!<br><br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 blkid $1 \<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | tr ' ' '\n' \<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | awk -F=3D '/TYPE/=
 { print $2 }' \<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | tr -d '"'<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; blkid $1 | awk ' { if (match($0, / TYPE=3D"[^"]*"/)) {<br>+&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; print substr ($0, RSTART+7, RLENGTH-8);<br>+&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; exit 0; }<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; }'<br><br>busybox awk does not have the gawk match thi=
rd arg; the exit 0 <br>says first arg only which should be redundant, and t=
he extra new line <br>makes it a bit more readable at the expense of being =
the 4th line.<br>alternatively we could look at each arg in a for loop but =
I decided it<br>just added more code than matching the leading space.<br><b=
r>This also gets rid of those trailing backslashes (otherwise accomplished =
<br>by putting the pipe at the end of the line).<br><br>(I'll submit this a=
s a patch on top; you can fold or rebase).<br><br>&gt;&gt; +probe=5Ffs=5Fty=
pe() {&gt;&gt; +       fst=3D$(blkid=5Ffs=5Ftype $1)<br>&gt;&gt; +       ec=
ho ${fst:=3Djffs2}<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt;  rwfs=3D$(findm=
td rwfs)<br>&gt;&gt;<br>&gt;&gt;  rwdev=3D/dev/mtdblock${rwfs#mtd}<br>&gt;&=
gt; -rwfst=3Dext4<br>&gt;<br>&gt;Would it make sense to do the same as the =
init case, where you set<br>&gt;rwfst to $(probe=5Ffs=5Ftype $rwdev)?<br><b=
r>Not as useful because the type needs be able to change <br>between before=
 and after ... so we need 2 options and one can <br>not be probed until aft=
er flashing.<br><br>milton<br></font><BR>
