Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rrcg72PpJzDqF6
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jul 2016 01:58:27 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6FFvfCw126703
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:58:25 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 246k21n0k0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:58:24 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 15 Jul 2016 11:58:23 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 15 Jul 2016 11:58:20 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id CF57CC90048
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:58:09 -0400 (EDT)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6FFwMG011076042
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 15:58:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43F88AE034
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:58:19 -0400 (EDT)
Received: from d50lp32.co.us.ibm.com (unknown [9.17.249.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS id EFB8FAE04B
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:58:18 -0400 (EDT)
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 15 Jul 2016 09:58:18 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 15 Jul 2016 09:58:15 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 15 Jul 2016 15:58:14 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 15 Jul 2016 15:58:09 -0000
X-IBM-Helo: us1a3-smtp04.a3.dal06.isc4sb.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016071515580940-320808 ;
 Fri, 15 Jul 2016 15:58:09 +0000 
MIME-Version: 1.0
In-Reply-To: <1468577985.954.22.camel@aj.id.au>
Subject: Re: openbmc qemu vs Cedric qemu is different
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Cedric Le Goater <clegoater@fr.ibm.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 15 Jul 2016 10:58:12 -0500
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
 <1468546975.5679.32.camel@jms.id.au> <1468577985.954.22.camel@aj.id.au>
X-KeepSent: 920CED31:64D6B88A-86257FF1:00579A2D;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 5283
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD"
x-cbid: 16071515-0040-0000-0000-000000D13550
X-IBM-ISS-SpamDetectors: Score=0.394815; BY=0.282394; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.394815; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005498; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000174; SDB=6.00730782; UDB=6.00342470; UTC=2016-07-15
 15:58:14
x-cbparentid: 16071515-5102-0000-0000-000000759017
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF920CED31.64D6B88A-ON86257FF1.00579A2D-86257FF1.0057B9EA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-15_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607150167
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 15:58:27 -0000

--0__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD
Content-type: multipart/alternative; 
	Boundary="1__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD"


--1__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


Sounds like you have a workable plan.  Thank you.  The test team will run
off of https://github.com/legoater/qemu (branch:aspeed) until the
openbmc/qemu gets the needed updates.


Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)



From:	Andrew Jeffery <andrew@aj.id.au>
To:	Joel Stanley <joel@jms.id.au>, Chris Austen/Austin/IBM@IBMUS,
            openbmc@lists.ozlabs.org
Cc:	Cedric Le Goater <clegoater@fr.ibm.com>
Date:	07/15/2016 05:20 AM
Subject:	Re: openbmc qemu vs Cedric qemu is different



On Fri, 2016-07-15 at 11:12 +0930, Joel Stanley wrote:
> Hello Chris,
>
> On Thu, 2016-07-14 at 13:27 -0500, Chris Austen wrote:
> >
> > Hi Joel,
> > last night you indicated that our openbmc/qemu had enough for
> > networking the palmetto-bmc. I don't think that is 100% true. I
> > believe Cedric's repo has some additional changes that should be
> > integrated back in to openbmc/qemu. Hopefully you two can figure out
> > what commits are needed to get us back to one working repo.
> I don't recall claming that. I think you're confusing me with Andrew.

Sounds about right.

>
> I'll let Andrew clarify the situation.
>
> Cheers,
>
> Joel
>
> >
> >
> >
> > causten@causten-VirtualBox:~/gitstuff/obmcqemu/build/arm-softmmu
> > $ ./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> > >
> > > -drive file=3D~/palmetto-qemu/flash-palmetto,format=3Draw,if=3Dmtd \
> > > -net nic,macaddr=3DC0:FF:EE:00:00:02,model=3Dftgmac100 \
> > > -net bridge,id=3Dnet0,helper=3D/usr/lib/qemu-bridge-helper,br=3Dvirbr0
> > qemu-system-arm: Unsupported NIC model: ftgmac100

Cedric's outlined the differences between his github repo and
openbmc/qemu, but I wouldn't have thought the differences would account
for this. Have you confirmed you're running the right qemu-system-arm
binary?

I believe I tested the networking before pushing Cedric's changes to
openbmc/qemu around 3 weeks ago, but I could be mistaken. Having said
that, as Cedric outlined, there may be some broken behaviour due to
fixes for ASPEED's movement of the EDO[RT]R bits in the MAC, so we
should resolve any issues as soon as possible.

Unfortunately I haven't kept pace with Cedric's work as I've been
distracted with other problems, but I intend on making up what ground I
can after I send my kernel patches upstream.

Cheers,

Andrew[attachment "signature.asc" deleted by Chris Austen/Austin/IBM]

--1__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p>Sounds like you have a workable plan.  Thank you.  The test =
team will run off of <a href=3D"https://github.com/legoater/qemu">https://g=
ithub.com/legoater/qemu</a> (branch:aspeed) until the openbmc/qemu gets the=
 needed updates.  <br><br><br>Chris Austen<br>POWER Systems Enablement Mana=
ger <br>(512) 286-5184 (T/L: 363-5184)<br><br><img width=3D"16" height=3D"1=
6" src=3D"cid:1=5F=5F=3D09BBF562DFC41CBD8f9e8a93df938690918c09B@" border=3D=
"0" alt=3D"Inactive hide details for Andrew Jeffery ---07/15/2016 05:20:17 =
AM---On Fri, 2016-07-15 at 11:12 +0930, Joel Stanley wrote: &gt; H"><font c=
olor=3D"#424282">Andrew Jeffery ---07/15/2016 05:20:17 AM---On Fri, 2016-07=
-15 at 11:12 +0930, Joel Stanley wrote: &gt; Hello Chris,</font><br><br><fo=
nt size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Andrew=
 Jeffery &lt;andrew@aj.id.au&gt;</font><br><font size=3D"2" color=3D"#5F5F5=
F">To:        </font><font size=3D"2">Joel Stanley &lt;joel@jms.id.au&gt;, =
Chris Austen/Austin/IBM@IBMUS, openbmc@lists.ozlabs.org</font><br><font siz=
e=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">Cedric Le Goat=
er &lt;clegoater@fr.ibm.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F=
">Date:        </font><font size=3D"2">07/15/2016 05:20 AM</font><br><font =
size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re: op=
enbmc qemu vs Cedric qemu is different</font><br><hr width=3D"100%" size=3D=
"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>On Fri=
, 2016-07-15 at 11:12 +0930, Joel Stanley wrote:<br>&gt; Hello Chris,<br>&g=
t; <br>&gt; On Thu, 2016-07-14 at 13:27 -0500, Chris Austen wrote:<br>&gt; =
&gt; <br>&gt; &gt; Hi Joel,=A0<br>&gt; &gt; last night you indicated that o=
ur openbmc/qemu had enough for<br>&gt; &gt; networking the palmetto-bmc. I =
don't think that is 100% true. I<br>&gt; &gt; believe Cedric's repo has som=
e additional changes that should be<br>&gt; &gt; integrated back in to open=
bmc/qemu. Hopefully you two can figure out<br>&gt; &gt; what commits are ne=
eded to get us back to one working repo.=A0<br>&gt; I don't recall claming =
that. I think you're confusing me with Andrew.<br><br>Sounds about right.<b=
r><br>&gt; <br>&gt; I'll let Andrew clarify the situation.<br>&gt; <br>&gt;=
 Cheers,<br>&gt; <br>&gt; Joel<br>&gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt;=
 &gt; <br>&gt; &gt; causten@causten-VirtualBox:~/gitstuff/obmcqemu/build/ar=
m-softmmu<br>&gt; &gt; $ ./qemu-system-arm -m 256 -M palmetto-bmc -nographi=
c \<br>&gt; &gt; &gt; <br>&gt; &gt; &gt; -drive file=3D~/palmetto-qemu/flas=
h-palmetto,format=3Draw,if=3Dmtd \<br>&gt; &gt; &gt; -net nic,macaddr=3DC0:=
FF:EE:00:00:02,model=3Dftgmac100 \<br>&gt; &gt; &gt; -net bridge,id=3Dnet0,=
helper=3D/usr/lib/qemu-bridge-helper,br=3Dvirbr0<br>&gt; &gt; qemu-system-a=
rm: Unsupported NIC model: ftgmac100=A0<br><br>Cedric's outlined the differ=
ences between his github repo and<br>openbmc/qemu, but I wouldn't have thou=
ght the differences would account<br>for this. Have you confirmed you're ru=
nning the right qemu-system-arm<br>binary?<br><br>I believe I tested the ne=
tworking before pushing Cedric's changes to<br>openbmc/qemu around 3 weeks =
ago, but I could be mistaken. Having said<br>that, as Cedric outlined, ther=
e may be some broken behaviour due to<br>fixes for ASPEED's movement of the=
 EDO[RT]R bits in the MAC, so we<br>should resolve any issues as soon as po=
ssible.<br><br>Unfortunately I haven't kept pace with Cedric's work as I've=
 been<br>distracted with other problems, but I intend on making up what gro=
und I<br>can after I send my kernel patches upstream.<br><br>Cheers,<br><br=
>Andrew[attachment &quot;signature.asc&quot; deleted by Chris Austen/Austin=
/IBM] </tt><br><BR>
</body></html>

--1__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD--


--0__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF562DFC41CBD8f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF562DFC41CBD8f9e8a93df938690918c09BBF562DFC41CBD--
