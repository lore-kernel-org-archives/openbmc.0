Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7bPF2KZRzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 14:54:41 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v963sbMp133425
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 23:54:38 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddwufk2k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 23:54:38 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 6 Oct 2017 03:54:25 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 6 Oct 2017 03:54:22 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017100603542150-1156719 ;
 Fri, 6 Oct 2017 03:54:21 +0000 
MIME-Version: 1.0
In-Reply-To: <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
Subject: Re: OpenBMC helper scripts repositories
To: "Chris Austen" <austenc@us.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>,
 "openbmc"<openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Thu, 5 Oct 2017 22:54:20 -0500
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
X-KeepSent: 921CDA64:CB068039-862581B1:00153196;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 37459
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B22DF86B7068f9e8a93df938690918c09BB0B22DF86B706"
Content-Disposition: inline
x-cbid: 17100603-3815-0000-0000-000002D605AB
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.433748;
 ST=0; TS=0; UL=0; ISC=; MB=0.016733
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927093; UDB=6.00466465; IPR=6.00707348; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017416; XFM=3.00000015;
 UTC=2017-10-06 03:54:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-05 20:10:38 - 6.00007419
x-cbparentid: 17100603-3816-0000-0000-0000936167C6
Message-Id: <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 03:54:41 -0000


--0__=09BB0B22DF86B7068f9e8a93df938690918c09BB0B22DF86B706
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII




https://github.com/causten/tools/tree/master/obmc  I've also got those
files.  things have evolved and I not kept the error logging or code update
refreshed to any of the new xyz paths.  However, leds.py still can toggle
the LEDS on a system and obmcrequests.py (my library for bmc communication)
can work offline if the data has been captured.

"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
10/05/2017 09:52:43 PM:

> From: "Chris Austen" <austenc@us.ibm.com>
> To: Andrew Jeffery <andrew@aj.id.au>
> Cc: OpenBMC <openbmc@lists.ozlabs.org>
> Date: 10/05/2017 09:53 PM
> Subject: Re: OpenBMC helper scripts repositories
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> Mine too... https://github.com/causten/openbmc-tutorials
>
>
> "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
> wrote on 10/05/2017 08:55:40 PM:
>
> > From: Andrew Jeffery <andrew@aj.id.au>
> > To: OpenBMC <openbmc@lists.ozlabs.org>
> > Date: 10/05/2017 08:56 PM
> > Subject: OpenBMC helper scripts repositories
> > Sent by: "openbmc" <openbmc-bounces
+austenc=3Dus.ibm.com@lists.ozlabs.org>
> >
> > Hello,
> >
> > I've noticed that we've grown several helper script repositories, with
> > a mix of intents.
> >
> > So far we have:
> >
> > https://github.com/williamspatrick/openbmc-events
> >
> > and the seemingly more active fork:
> >
> > https://github.com/geissonator/openbmc-events
> >
> > Along with something Joel cooked up a while back:
> >
> > https://github.com/shenki/obmc-ctrl
> >
> > and some scripts that I've written:
> >
> > https://github.com/amboar/obmc-scripts/
> >
> > Is it worth consolidating these efforts? If we do I think the result
> > should be low friction wrt merging changes, and some hacking should
> > always be expected if you're going to use the repository. Consolidating
> > might help avoid duplicate effort.
> >
> > Cheers,
> >
> > Andrew[attachment "signature.asc" deleted by Chris Austen/Austin/IBM]

--0__=09BB0B22DF86B7068f9e8a93df938690918c09BB0B22DF86B706
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2"><br></font><a href=3D"https://github.com/ca=
usten/tools/tree/master/obmc"><font size=3D"2">https://github.com/causten/t=
ools/tree/master/obmc</font></a><font size=3D"2">  I've also got those file=
s.  things have evolved and I not kept the error logging or code update ref=
reshed to any of the new xyz paths.  However, leds.py still can toggle the =
LEDS on a system and obmcrequests.py (my library for bmc communication) can=
 work offline if the data has been captured.</font><br><br><tt><font size=
=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.o=
zlabs.org&gt; wrote on 10/05/2017 09:52:43 PM:<br><br>&gt; From: &quot;Chri=
s Austen&quot; &lt;austenc@us.ibm.com&gt;</font></tt><br><tt><font size=3D"=
2">&gt; To: Andrew Jeffery &lt;andrew@aj.id.au&gt;</font></tt><br><tt><font=
 size=3D"2">&gt; Cc: OpenBMC &lt;openbmc@lists.ozlabs.org&gt;</font></tt><b=
r><tt><font size=3D"2">&gt; Date: 10/05/2017 09:53 PM</font></tt><br><tt><f=
ont size=3D"2">&gt; Subject: Re: OpenBMC helper scripts repositories</font>=
</tt><br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&quot; &lt;openbmc=
-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;</font></tt><br><tt><font=
 size=3D"2">&gt; <br>&gt; Mine too... <a href=3D"https://github.com/causten=
/openbmc-tutorials">https://github.com/causten/openbmc-tutorials</a><br>&gt=
; <br>&gt; <br>&gt; &quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ib=
m.com@lists.ozlabs.org&gt; <br>&gt; wrote on 10/05/2017 08:55:40 PM:<br>&gt=
; <br>&gt; &gt; From: Andrew Jeffery &lt;andrew@aj.id.au&gt;<br>&gt; &gt; T=
o: OpenBMC &lt;openbmc@lists.ozlabs.org&gt;<br>&gt; &gt; Date: 10/05/2017 0=
8:56 PM<br>&gt; &gt; Subject: OpenBMC helper scripts repositories<br>&gt; &=
gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@l=
ists.ozlabs.org&gt;<br>&gt; &gt; <br>&gt; &gt; Hello,<br>&gt; &gt; <br>&gt;=
 &gt; I've noticed that we've grown several helper script repositories, wit=
h<br>&gt; &gt; a mix of intents.<br>&gt; &gt; <br>&gt; &gt; So far we have:=
<br>&gt; &gt; <br>&gt; &gt; <a href=3D"https://github.com/williamspatrick/o=
penbmc-events">https://github.com/williamspatrick/openbmc-events</a><br>&gt=
; &gt; <br>&gt; &gt; and the seemingly more active fork:<br>&gt; &gt; <br>&=
gt; &gt; <a href=3D"https://github.com/geissonator/openbmc-events">https://=
github.com/geissonator/openbmc-events</a><br>&gt; &gt; <br>&gt; &gt; Along =
with something Joel cooked up a while back:<br>&gt; &gt; <br>&gt; &gt; <a h=
ref=3D"https://github.com/shenki/obmc-ctrl">https://github.com/shenki/obmc-=
ctrl</a><br>&gt; &gt; <br>&gt; &gt; and some scripts that I've written:<br>=
&gt; &gt; <br>&gt; &gt; <a href=3D"https://github.com/amboar/obmc-scripts/"=
>https://github.com/amboar/obmc-scripts/</a><br>&gt; &gt; <br>&gt; &gt; Is =
it worth consolidating these efforts? If we do I think the result<br>&gt; &=
gt; should be low friction wrt merging changes, and some hacking should<br>=
&gt; &gt; always be expected if you're going to use the repository. Consoli=
dating<br>&gt; &gt; might help avoid duplicate effort.<br>&gt; &gt; <br>&gt=
; &gt; Cheers,<br>&gt; &gt; <br>&gt; &gt; Andrew[attachment &quot;signature=
.asc&quot; deleted by Chris Austen/Austin/IBM] </font></tt><BR>
</body></html>

--0__=09BB0B22DF86B7068f9e8a93df938690918c09BB0B22DF86B706--
