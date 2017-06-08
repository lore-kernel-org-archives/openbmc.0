Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wk7fv2q3lzDqPG
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 00:51:51 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v58Eo4Ni029960
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jun 2017 10:51:48 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2axv36hcuk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 10:51:47 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 8 Jun 2017 10:51:46 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 8 Jun 2017 10:51:44 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v58EpiiZ34603024
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jun 2017 14:51:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1A23AC03A
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 10:51:41 -0400 (EDT)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS id 660E7AC040
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 10:51:41 -0400 (EDT)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 8 Jun 2017 08:51:43 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Thu, 8 Jun 2017 08:51:41 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 8 Jun 2017 14:51:40 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 8 Jun 2017 14:51:37 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017060814513735-652636 ;
 Thu, 8 Jun 2017 14:51:37 +0000 
MIME-Version: 1.0
In-Reply-To: <CACPK8XdMs6DQRk2DWAYwgtta3cGfpEm9mjZ7TqFCsADj4LW5oQ@mail.gmail.com>
Subject: Re: New Platform Guide
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "openbmc"<openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, Patrick
 Venture <venture@google.com>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Thu, 8 Jun 2017 09:51:36 -0500
References: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
 <CACPK8XdMs6DQRk2DWAYwgtta3cGfpEm9mjZ7TqFCsADj4LW5oQ@mail.gmail.com>
X-KeepSent: C991E0D3:6E4146E7-86258139:00503142;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 41343
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BAADFC3B7D28f9e8a93df938690918c09BB0BAADFC3B7D2"
Content-Disposition: inline
x-cbid: 17060814-0036-0000-0000-00000223F980
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.190768
X-IBM-SpamModules-Versions: BY=3.00007195; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00871940; UDB=6.00433728; IPR=6.00651929; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015745; XFM=3.00000015;
 UTC=2017-06-08 14:51:39
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-08 13:27:31 - 6.00006865
x-cbparentid: 17060814-6358-0000-0000-000011168F2F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007195; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00871940; UDB=6.00433728; IPR=6.00651929; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015746; XFM=3.00000015;
 UTC=2017-06-08 14:51:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFC991E0D3.6E4146E7-ON86258139.00503142-86258139.0051A0EA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706080266
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 14:51:51 -0000


--0__=09BB0BAADFC3B7D28f9e8a93df938690918c09BB0BAADFC3B7D2
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
06/08/2017 02:10:26 AM:

> From: Joel Stanley <joel@jms.id.au>
> To: Patrick Venture <venture@google.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 06/08/2017 02:11 AM
> Subject: Re: New Platform Guide
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> Hi Patrick,
>
> On Thu, Jun 8, 2017 at 3:48 AM, Patrick Venture <venture@google.com>
wrote:
> > Where is the new platform guide?
> >
> > In trying to get the quanta board running with everything; I've often
run
> > into stumbling blocks when trying to define what packages are required
and
> > what need to be replaced with custom versions -- for things like
sensors.
> >
> > Often I've been more or less reduced to checking the journal logs to
see if
> > something is saying why it's not running (settings.py was crashing
which
> > meant ipmid wouldn't start as an example).  It took some source
searching to
> > figure out that x really depended on some object existing.  Often those
were
> > in the service file, but not every time.  And especially as OpenBMC is
a
> > moving target, this has been somewhat discouraging.  Especially when
the
> > "supported" platforms all stem from the skeleton which still has its
fingers
> > in many places.
>
> As an end-user of the userspace who does not grok the systemd part of
> OpenBMC, I also find it hard to navigate. I look forward to
> improvements in this area.
>
> >
> > That said, there are a lot of dependencies between packages, and things
that
> > you receive that maybe you don't want or need or aren't
configuredproperly.
> > For example, I don't know why or what the led-manager is doing but it's
on
> > my system running.  I don't believe I configured it.
> >
> > If there is a guide, then I didn't see it and I apologize.
> >
> > If there isn't a guide -- I can start one; however, I won't really have
to
> > do it properly until some time in July.  My approach would be, create a
new
> > platform that mimics Zaius but under a different name and see what it
takes
> > to output a similar image and what is really required -- although
difficult
> > for me to test.  So maybe a new Quanta image from scratch and see
what's
> > running, and why and what things need to be configured.
>
> I would appreciate this too. Let me know if I can help out.
>
> Cheers,
>
> Joel
>

No better time then the present... Add/edit as you see fit.  Then we can at
least assign some tasks out

Goal for document:  Allow an experienced engineering team to port existing
hardware to OpenBMC
Topics:
- Yocto Layering to support your board
- Does your hardware have supported device drivers
- How to deal with non hwmon supported devices
- How to implement the default set of packages (thermal, inventory, ipmi,
led, etc)
- How to swapping a default package with a proprietary one
- Adding packages
- Testing against the OpenBMC verification suite


--0__=09BB0BAADFC3B7D28f9e8a93df938690918c09BB0BAADFC3B7D2
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces=
+austenc=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 06/08/2017 02:10:26 AM:=
<br><br>&gt; From: Joel Stanley &lt;joel@jms.id.au&gt;</font></tt><br><tt><=
font size=3D"2">&gt; To: Patrick Venture &lt;venture@google.com&gt;</font><=
/tt><br><tt><font size=3D"2">&gt; Cc: OpenBMC Maillist &lt;openbmc@lists.oz=
labs.org&gt;</font></tt><br><tt><font size=3D"2">&gt; Date: 06/08/2017 02:1=
1 AM</font></tt><br><tt><font size=3D"2">&gt; Subject: Re: New Platform Gui=
de</font></tt><br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&quot; &l=
t;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;</font></tt><br>=
<tt><font size=3D"2">&gt; <br>&gt; Hi Patrick,<br>&gt; <br>&gt; On Thu, Jun=
 8, 2017 at 3:48 AM, Patrick Venture &lt;venture@google.com&gt; wrote:<br>&=
gt; &gt; Where is the new platform guide?<br>&gt; &gt;<br>&gt; &gt; In tryi=
ng to get the quanta board running with everything; I've often run<br>&gt; =
&gt; into stumbling blocks when trying to define what packages are required=
 and<br>&gt; &gt; what need to be replaced with custom versions -- for thin=
gs like sensors.<br>&gt; &gt;<br>&gt; &gt; Often I've been more or less red=
uced to checking the journal logs to see if<br>&gt; &gt; something is sayin=
g why it's not running (settings.py was crashing which<br>&gt; &gt; meant i=
pmid wouldn't start as an example). &nbsp;It took some source searching to<=
br>&gt; &gt; figure out that x really depended on some object existing. &nb=
sp;Often those were<br>&gt; &gt; in the service file, but not every time. &=
nbsp;And especially as OpenBMC is a<br>&gt; &gt; moving target, this has be=
en somewhat discouraging. &nbsp;Especially when the<br>&gt; &gt; &quot;supp=
orted&quot; platforms all stem from the skeleton which still has its finger=
s<br>&gt; &gt; in many places.<br>&gt; <br>&gt; As an end-user of the users=
pace who does not grok the systemd part of<br>&gt; OpenBMC, I also find it =
hard to navigate. I look forward to<br>&gt; improvements in this area.<br>&=
gt; <br>&gt; &gt;<br>&gt; &gt; That said, there are a lot of dependencies b=
etween packages, and things that<br>&gt; &gt; you receive that maybe you do=
n't want or need or aren't configuredproperly.<br>&gt; &gt; For example, I =
don't know why or what the led-manager is doing but it's on<br>&gt; &gt; my=
 system running. &nbsp;I don't believe I configured it.<br>&gt; &gt;<br>&gt=
; &gt; If there is a guide, then I didn't see it and I apologize.<br>&gt; &=
gt;<br>&gt; &gt; If there isn't a guide -- I can start one; however, I won'=
t really have to<br>&gt; &gt; do it properly until some time in July. &nbsp=
;My approach would be, create a new<br>&gt; &gt; platform that mimics Zaius=
 but under a different name and see what it takes<br>&gt; &gt; to output a =
similar image and what is really required -- although difficult<br>&gt; &gt=
; for me to test. &nbsp;So maybe a new Quanta image from scratch and see wh=
at's<br>&gt; &gt; running, and why and what things need to be configured.<b=
r>&gt; <br>&gt; I would appreciate this too. Let me know if I can help out.=
<br>&gt; <br>&gt; Cheers,<br>&gt; <br>&gt; Joel<br>&gt; <br></font></tt><br=
><tt><font size=3D"2">No better time then the present... Add/edit as you se=
e fit. &nbsp;Then we can at least assign some tasks out </font></tt><br><br=
><tt><font size=3D"2">Goal for document: &nbsp;Allow an experienced enginee=
ring team to port existing hardware to OpenBMC</font></tt><br><tt><font siz=
e=3D"2">Topics: </font></tt><br><tt><font size=3D"2">- Yocto Layering to su=
pport your board</font></tt><br><tt><font size=3D"2">- Does your hardware h=
ave supported device drivers</font></tt><br><tt><font size=3D"2">- How to d=
eal with non hwmon supported devices</font></tt><br><tt><font size=3D"2">- =
How to implement the default set of packages (thermal, inventory, ipmi, led=
, etc)</font></tt><br><tt><font size=3D"2">- How to swapping a default pack=
age with a proprietary one</font></tt><br><tt><font size=3D"2">- Adding pac=
kages</font></tt><br><tt><font size=3D"2">- Testing against the OpenBMC ver=
ification suite</font></tt><br><br><BR>
</body></html>

--0__=09BB0BAADFC3B7D28f9e8a93df938690918c09BB0BAADFC3B7D2--
