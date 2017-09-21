Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xypTY6n9rzDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 06:42:57 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8LKfABY036674
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 16:42:55 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d4e3a6244-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 16:42:55 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Thu, 21 Sep 2017 14:42:54 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Sep 2017 14:42:52 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8LKgp5f9830666
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 13:42:51 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC0A0BE03B
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 14:42:51 -0600 (MDT)
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.190])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS id 803CCBE03A
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 14:42:51 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_1568FA19-9ED0-40F0-B631-4193045BFE32"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC Image Management - Witherspoon
Date: Thu, 21 Sep 2017 15:40:40 -0500
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <5E11AC40-EE32-479D-90F2-9F684B0DBE2A@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <5E11AC40-EE32-479D-90F2-9F684B0DBE2A@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17092120-0028-0000-0000-00000864A801
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007774; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920389; UDB=6.00462479; IPR=6.00700610; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017240; XFM=3.00000015;
 UTC=2017-09-21 20:42:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092120-0029-0000-0000-000037A55F88
Message-Id: <4CD017EF-FFCA-45E3-875B-5E6CB0B98847@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709210279
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
X-List-Received-Date: Thu, 21 Sep 2017 20:42:58 -0000


--Apple-Mail=_1568FA19-9ED0-40F0-B631-4193045BFE32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Today, the support for UBI on BMC will be turned on for the Witherspoon =
platform. This support (that can be enabled on any system via the =
machine feature "obmc-ubi-fs=E2=80=9D) allows for the storage of the BMC =
image files in UBI volumes and takes advantage of the 2nd BMC chip on =
the system to support dual images.

The method for updating the BMC are the same as updating the virtual =
PNOR where the BMC tarfile is uploaded to the BMC, followed by setting =
the RequestedActivation property to Active. After the activation is =
successful, the BMC can be rebooted.

The openbmc-sfw tool located here helps with the querying and updating =
process: https://github.com/geissonator/openbmc-events =
<https://github.com/geissonator/openbmc-events>

To move from the existing static layout for the first time, this script =
can be used (this will reformat the BMC chip clearing all user =
settings): =
https://gist.github.com/charleshofer/e753f88deff0c75eda196eb24877fa0c =
<https://gist.github.com/charleshofer/e753f88deff0c75eda196eb24877fa0c>

I=E2=80=99ll be updating the docs/code-update.md file to reflect this =
change.



> On Aug 2, 2017, at 12:23 PM, Adriana Kobylak <anoo@linux.vnet.ibm.com> =
wrote:
>=20
> This week, the support for virtual pnor on witherspoon (which =
reformats the pnor chip to ubi) will be turned on.
> REST interfaces and copying partition files for patching replace =
pflash for updating and patching the pnor.
>=20
> Additional details of the implementation and instructions are =
documented here:
> https://gerrit.openbmc-project.xyz/#/c/4756/ =
<https://gerrit.openbmc-project.xyz/#/c/4756/>
> https://gerrit.openbmc-project.xyz/#/c/5433/ =
<https://gerrit.openbmc-project.xyz/#/c/5433/>
>=20
>=20
>> On Jun 13, 2017, at 1:10 PM, Adriana Kobylak <anoo@linux.vnet.ibm.com =
<mailto:anoo@linux.vnet.ibm.com>> wrote:
>>=20
>> In the next coming days, the changes to the host bios update =
procedure will be available for use.
>>=20
>> Notable changes are using a squashfs image that includes individual =
pnor partition files instead of the ffs (.pnor) image, formatting the =
pnor chip as ubi to store these files (allowing for the storage of more =
than one image), and mailbox daemon updates to support these changes =
(new phosphor-mboxd repo).
>>=20
>> Regarding the mailbox daemon, the mboxbridge repository is staying as =
a reference implementation and has been cloned into phosphor-mboxd. Any =
system using mailbox and running with a flashed ffs pnor image (instead =
of updating to the ubi layout) would still need the reference mboxbridge =
implementation. The openbmc build is being updated to build =
phosphor-mboxd as the default.
>>=20
>> A system can be updated transparently from running with an ffs pnor =
image to the squashfs image via the Software dbus interfaces. In a =
similar way, a system with a ubi-formatted pnor can be flashed with an =
ffs pnor image using pflash.
>>=20
>> The first round of documentation updates are here: =
https://gerrit.openbmc-project.xyz/#/c/4756/ =
<https://gerrit.openbmc-project.xyz/#/c/4756/>
>> Reviewers welcome :)
>=20


--Apple-Mail=_1568FA19-9ED0-40F0-B631-4193045BFE32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Today, the support for UBI on BMC will be turned on for the =
Witherspoon platform. This support (that can be enabled on any system =
via the machine feature "obmc-ubi-fs=E2=80=9D) allows for the storage of =
the BMC image files in UBI volumes and takes advantage of the 2nd BMC =
chip on the system to support dual images.<div class=3D""><br =
class=3D""></div><div class=3D"">The method for updating the BMC are the =
same as updating the virtual PNOR where the BMC tarfile is uploaded to =
the BMC, followed by setting the RequestedActivation property to Active. =
After the activation is successful, the BMC can be rebooted.</div><div =
class=3D""><br class=3D""></div><div class=3D"">The =
openbmc-sfw&nbsp;tool located here helps with the querying and updating =
process:&nbsp;<a href=3D"https://github.com/geissonator/openbmc-events" =
class=3D"">https://github.com/geissonator/openbmc-events</a></div><div =
class=3D""><br class=3D""></div><div class=3D"">To move from the =
existing static layout for the first time, this script can be used (this =
will reformat the BMC chip clearing all user settings):&nbsp;<a =
href=3D"https://gist.github.com/charleshofer/e753f88deff0c75eda196eb24877f=
a0c" =
class=3D"">https://gist.github.com/charleshofer/e753f88deff0c75eda196eb248=
77fa0c</a></div><div class=3D""><br class=3D""></div><div class=3D""><div =
class=3D"">I=E2=80=99ll be updating the docs/code-update.md file to =
reflect this change.</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Aug 2, 2017, at 12:23 PM, Adriana Kobylak &lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html charset=3Dus-ascii" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; -webkit-line-break: after-white-space;" class=3D""><div =
class=3D"">This week, the support for virtual pnor on witherspoon (which =
reformats the pnor chip to ubi) will be turned on.</div><div =
class=3D"">REST interfaces and copying partition files for patching =
replace pflash for updating and patching the pnor.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Additional details of =
the implementation and instructions are documented here:</div><div =
class=3D""><a href=3D"https://gerrit.openbmc-project.xyz/#/c/4756/" =
class=3D"">https://gerrit.openbmc-project.xyz/#/c/4756/</a></div><div =
class=3D""><a href=3D"https://gerrit.openbmc-project.xyz/#/c/5433/" =
class=3D"">https://gerrit.openbmc-project.xyz/#/c/5433/</a></div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Jun =
13, 2017, at 1:10 PM, Adriana Kobylak &lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"auto" =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D"">In the next coming =
days, the changes to the host bios update procedure will be available =
for use.<div class=3D""><br class=3D""></div><div class=3D"">Notable =
changes are using a squashfs image that includes individual pnor =
partition files instead of the ffs (.pnor) image, formatting the pnor =
chip as ubi to store these files (allowing for the storage of more than =
one image), and mailbox daemon updates to support these changes (new =
phosphor-mboxd repo).</div><div class=3D""><br class=3D""></div><div =
class=3D"">Regarding the mailbox daemon, the mboxbridge repository is =
staying as a reference implementation and has been cloned into =
phosphor-mboxd. Any system using mailbox and running with a flashed ffs =
pnor image (instead of updating to the ubi layout) would still need the =
reference mboxbridge implementation. The openbmc build is being updated =
to build phosphor-mboxd as the default.</div><div class=3D""><br =
class=3D""></div><div class=3D"">A system can be updated transparently =
from running with an ffs pnor image to the squashfs image via the =
Software dbus interfaces. In a similar way, a system with a =
ubi-formatted pnor can be flashed with an ffs pnor image using =
pflash.</div><div class=3D""><br class=3D""></div><div class=3D"">The =
first round of documentation updates are here:&nbsp;<a =
href=3D"https://gerrit.openbmc-project.xyz/#/c/4756/" =
class=3D"">https://gerrit.openbmc-project.xyz/#/c/4756/</a></div><div =
class=3D"">Reviewers welcome :)</div></div></div>
</div></blockquote></div><br class=3D""></div></div></blockquote></div><br=
 class=3D""></div></div></body></html>=

--Apple-Mail=_1568FA19-9ED0-40F0-B631-4193045BFE32--
