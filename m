Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x63Xq60CVzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 10:55:39 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6B0ru0T056507
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 20:55:37 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bmd1peehh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 20:55:37 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 10 Jul 2017 18:55:36 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Jul 2017 18:55:33 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6B0tXHP56754230; Mon, 10 Jul 2017 17:55:33 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42D15C6037;
 Mon, 10 Jul 2017 18:55:33 -0600 (MDT)
Received: from [9.80.215.18] (unknown [9.80.215.18])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS id 8FB18C603C;
 Mon, 10 Jul 2017 18:55:32 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_4F738DA1-DF75-4B9B-918F-87BA9A4C661D"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC Image Management
Date: Mon, 10 Jul 2017 19:53:12 -0500
In-Reply-To: <OFAF8C53AE.6841FFA9-ON86258145.00526192-86258145.0052B9D4@notes.na.collabserv.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
To: Chris Austen <austenc@us.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <87y3sv8str.fsf@linux.vnet.ibm.com>
 <DF60C6B0-BEF2-4CBA-B5D8-6B85EF0F158A@linux.vnet.ibm.com>
 <87mv945y5r.fsf@linux.vnet.ibm.com>
 <C82D2909-D48E-4F2E-9C84-C0AAAB763AFA@linux.vnet.ibm.com>
 <OFAF8C53AE.6841FFA9-ON86258145.00526192-86258145.0052B9D4@notes.na.collabserv.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17071100-0024-0000-0000-000016D36705
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007346; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00885777; UDB=6.00442085; IPR=6.00665927; 
 BA=6.00005465; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016167; XFM=3.00000015;
 UTC=2017-07-11 00:55:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071100-0025-0000-0000-00004BC61926
Message-Id: <6975C49A-9B3C-4CD7-8A2E-A36612F51781@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707110011
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
X-List-Received-Date: Tue, 11 Jul 2017 00:55:40 -0000


--Apple-Mail=_4F738DA1-DF75-4B9B-918F-87BA9A4C661D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 20, 2017, at 10:03 AM, Chris Austen <austenc@us.ibm.com> wrote:
>=20
> "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org =
<mailto:openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>> wrote on =
06/20/2017 09:38:40 AM:
>=20
>=20
> >=20
> > For OpenBMC, we=E2=80=99re having the PNOR chip with a filesystem, =
so mboxd=20
> > would read/write files instead of looking for the data at an offset=20=

> > in the chip. Nothing deficient with it, just a different=20
> > implementation that needs to be handled.
>=20
> I have been recommending that if you want to try OpenBMC on your =
system (that is not running  OpenBMC now) that the BMC chip be swapped.  =
Does the offset vs filesystem change force the PNOR flash image to be =
forever changed too?
>=20
>=20
Not forever, it can be reflashed back to ffs using pflash. If the =
virtual pnor is not desired to be used on that system (since in this =
example the user just wants to try out openbmc) it can be disabled via a =
config flag when building the bmc image. Ex:

=
https://github.com/openbmc/openbmc/commit/dd05b963e1847a1f56b11825a7d39602=
b6151165 =
<https://github.com/openbmc/openbmc/commit/dd05b963e1847a1f56b11825a7d3960=
2b6151165>

> >=20
> > >=20
> > > --=20
> > > Stewart Smith
> > > OPAL Architect, IBM.
> >=20
> Chris Austen
> POWER Systems Enablement Manager=20
>=20


--Apple-Mail=_4F738DA1-DF75-4B9B-918F-87BA9A4C661D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 20, 2017, at 10:03 AM, Chris Austen &lt;<a =
href=3D"mailto:austenc@us.ibm.com" class=3D"">austenc@us.ibm.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><p =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><tt class=3D""><font size=3D"2" class=3D"">"openbmc" &lt;<a =
href=3D"mailto:openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org" =
class=3D"">openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org</a>&gt; =
wrote on 06/20/2017 09:38:40 AM:<br class=3D""><br =
class=3D""></font></tt><tt class=3D""><font size=3D"2" class=3D""><br =
class=3D"">&gt;<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&gt; For OpenBMC, we=E2=80=99re having the PNOR chip with a =
filesystem, so mboxd<span class=3D"Apple-converted-space">&nbsp;</span><br=
 class=3D"">&gt; would read/write files instead of looking for the data =
at an offset<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&gt; in the chip. Nothing deficient with it, just a =
different<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&gt; implementation that needs to be handled.<br =
class=3D""></font></tt><br class=3D""><tt class=3D""><font size=3D"2" =
class=3D"">I have been recommending that if you want to try OpenBMC on =
your system (that is not running &nbsp;OpenBMC now) that the BMC chip be =
swapped. &nbsp;Does the offset vs filesystem change force the PNOR flash =
image to be forever changed too?</font></tt><br class=3D""><br =
class=3D""></p></div></blockquote>Not forever, it can be reflashed back =
to ffs using pflash. If the virtual pnor is not desired to be used on =
that system (since in this example the user just wants to try out =
openbmc) it can be disabled via a config flag when building the bmc =
image. Ex:</div><div><br class=3D""></div><div><a =
href=3D"https://github.com/openbmc/openbmc/commit/dd05b963e1847a1f56b11825=
a7d39602b6151165" =
class=3D"">https://github.com/openbmc/openbmc/commit/dd05b963e1847a1f56b11=
825a7d39602b6151165</a></div><div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D""><p style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><tt =
class=3D""><font size=3D"2" class=3D"">&gt;<span =
class=3D"Apple-converted-space">&nbsp;</span></font></tt><br =
class=3D""><tt class=3D""><font size=3D"2" class=3D"">&gt; &gt;<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">&gt; &gt; =
--<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">&gt; =
&gt; Stewart Smith<br class=3D"">&gt; &gt; OPAL Architect, IBM.<br =
class=3D"">&gt;<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""></font></tt><font size=3D"2" class=3D"">Chris Austen<br =
class=3D"">POWER Systems Enablement Manager<span =
class=3D"Apple-converted-space">&nbsp;</span></font></p></div></blockquote=
></div><br class=3D""></body></html>=

--Apple-Mail=_4F738DA1-DF75-4B9B-918F-87BA9A4C661D--
