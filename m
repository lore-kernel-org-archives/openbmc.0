Return-Path: <gkeishin@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447zsC2DSNzDq7n
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 00:18:21 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QDFQOI097234
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 08:18:16 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qw3fraghs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 08:18:16 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Tue, 26 Feb 2019 13:18:15 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 26 Feb 2019 13:18:11 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019022613181107-561396 ;
 Tue, 26 Feb 2019 13:18:11 +0000 
In-Reply-To: <f53bcaf6-bb52-963e-bb7c-eb58b1ac6561@intel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Redfish: Network test findings
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Tue, 26 Feb 2019 18:48:10 +0530
References: <OF53FC2776.6CFC8561-ON002583A9.00391CD8-652583A9.003ABCA8@LocalDomain>
 <OF3C14C139.B5348C62-ON002583A9.00475679-652583A9.005AF2E2@notes.na.collabserv.com>
 <f53bcaf6-bb52-963e-bb7c-eb58b1ac6561@intel.com>
MIME-Version: 1.0
X-KeepSent: 07B302A4:58205C4C-002583AD:0047E1C1;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 59235
X-TNEFEvaluated: 1
x-cbid: 19022613-5101-0000-0000-00000E6A6477
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.088317
X-IBM-SpamModules-Versions: BY=3.00010667; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01166637; UDB=6.00609410; IPR=6.00947243; 
 BA=6.00006241; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025748; XFM=3.00000015;
 UTC=2019-02-26 13:18:13
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-02-26 09:13:45 - 6.00009632
x-cbparentid: 19022613-5102-0000-0000-00006EF07367
Message-Id: <OF07B302A4.58205C4C-ON002583AD.0047E1C1-652583AD.0049132B@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 0048E16B652583AD_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 13:18:24 -0000


--=_alternative 0048E16B652583AD_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

From:   Ed Tanous <ed.tanous@intel.com>
To:     openbmc@lists.ozlabs.org
Date:   02/22/2019 10:47 PM
Subject:        Re: Redfish: Network test findings
Sent by:        "openbmc"=20
<openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>





On 2/22/19 8:33 AM, Prashanth Katti1 wrote:
> Hi Ed Tanous,
>=20
> Here are the finding on Network test for bmcweb.
> .
> Could you look into the following issues and let us know.
>=20

I'm happy to review any patches that resolve some, or all of these.
Based on the titles, a lot of these look like enhancement requests for
parameters that aren't currently implemented, or misunderstandings about
how Redfish error codes work.

If you have some initial triage done to identify the failure modes on
these, that would help a lot to get them resolved quickly.  If you need
any specific background to help triage, I'm almost always on IRC (and
obviously this list).

-Ed

--------------------

Ed,

    We were looking for the initial configuration for IP , MAC, hostname , =

gateway, DHCP enable to be working.

    Well, yes the others could be enhancement or perhaps to be done.

    For now, if you could take a quick look at those github logged issues=20
and help us understand what is expected
    and what would be the correct way to validate those in those terms of=20
bug vs features, so that, we can request
    our folks to help contribute on it, if required.=20
=20
Thanks=20
George Keishing






--=_alternative 0048E16B652583AD_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"


<br><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif"=
>From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Ed
Tanous &lt;ed.tanous@intel.com&gt;</span><br><span style=3D" font-size:9pt;=
color:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">openbmc@lists.ozlabs.org</span><br><span style=3D" font-size:9=
pt;color:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">02/22/2019
10:47 PM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Re:
Redfish: Network test findings</span><br><span style=3D" font-size:9pt;colo=
r:#5f5f5f;font-family:sans-serif">Sent
by: &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-fa=
mily:sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</span><br><h=
r noshade><br><br><br><tt><span style=3D" font-size:10pt"><br><br>On 2/22/1=
9 8:33 AM, Prashanth Katti1 wrote:<br>&gt; Hi Ed Tanous,<br>&gt; <br>&gt; H=
ere are the finding on Network test for bmcweb.<br>&gt; .<br>&gt; Could you=
 look into the following issues and let us know.<br>&gt; <br><br>I'm happy =
to review any patches that resolve some, or all of these.<br>Based on the t=
itles, a lot of these look like enhancement requests for<br>parameters that=
 aren't currently implemented, or misunderstandings about<br>how Redfish er=
ror codes work.<br><br>If you have some initial triage done to identify the=
 failure modes on<br>these, that would help a lot to get them resolved quic=
kly. &nbsp;If you
need<br>any specific background to help triage, I'm almost always on IRC (a=
nd<br>obviously this list).<br><br>-Ed<br><br>--------------------</span></=
tt><br><br><tt><span style=3D" font-size:10pt">Ed,</span></tt><br><br><tt><=
span style=3D" font-size:10pt">&nbsp; &nbsp; We were looking for
the initial configuration for IP , MAC, hostname , gateway, DHCP enable
to be working.</span></tt><br><br><tt><span style=3D" font-size:10pt">&nbsp=
; &nbsp; Well, yes the others
could be enhancement or perhaps to be done.</span></tt><br><br><tt><span st=
yle=3D" font-size:10pt">&nbsp; &nbsp; For now, if you could
take a quick look at those github logged issues and help us understand
what is expected</span></tt><br><tt><span style=3D" font-size:10pt">&nbsp; =
&nbsp; and what would be the
correct way to validate those in those terms of bug vs features, so that,
we can request</span></tt><br><tt><span style=3D" font-size:10pt">&nbsp; &n=
bsp; our folks to help contribute
on it, if required. </span></tt><br><tt><span style=3D" font-size:10pt">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; </span></tt><br><tt><span style=3D" font-size:10pt">Thanks </span></=
tt><br><tt><span style=3D" font-size:10pt">George Keishing</span></tt><br><=
br><br><br><BR>
--=_alternative 0048E16B652583AD_=--
