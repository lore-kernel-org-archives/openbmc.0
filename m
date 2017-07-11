Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x6bKF3lP4zDqgQ
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 07:47:29 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6BLiBTZ080701
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 17:47:27 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bn0mw8v35-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 17:47:26 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 11 Jul 2017 17:47:25 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 11 Jul 2017 17:47:24 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6BLlOML53870824; Tue, 11 Jul 2017 21:47:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DE3E124035;
 Tue, 11 Jul 2017 17:44:52 -0400 (EDT)
Received: from birb.localdomain (unknown [9.81.208.142])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP id 3FB7E124037;
 Tue, 11 Jul 2017 17:44:51 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id C184E4EC748; Wed, 12 Jul 2017 07:47:18 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management
In-Reply-To: <ED39C0D3-EE2E-4D03-9B70-D6F0AD0F3AC7@linux.vnet.ibm.com>
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
 <87wp8528xc.fsf@linux.vnet.ibm.com>
 <ED39C0D3-EE2E-4D03-9B70-D6F0AD0F3AC7@linux.vnet.ibm.com>
Date: Wed, 12 Jul 2017 07:47:18 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 17071121-0048-0000-0000-000001C16B76
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007351; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00886195; UDB=6.00442335; IPR=6.00666344; 
 BA=6.00005468; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016184; XFM=3.00000015;
 UTC=2017-07-11 21:47:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071121-0049-0000-0000-000041DA1AFE
Message-Id: <87a84abq8p.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-11_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707110347
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
X-List-Received-Date: Tue, 11 Jul 2017 21:47:29 -0000

Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>> On Jun 21, 2017, at 12:42 AM, Stewart Smith <stewart@linux.vnet.ibm.com>=
 wrote:
>>=20
>> Adriana Kobylak <anoo@linux.vnet.ibm.com <mailto:anoo@linux.vnet.ibm.com=
>> writes:
>>>> On Jun 19, 2017, at 12:44 AM, Stewart Smith <stewart@linux.vnet.ibm.co=
m> wrote:
>>>>=20
>>>> Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>>>>>> Why is there mboxbridge separate from phosphor-mboxd?
>>>>>=20
>>>>> Because the mboxbridge is being used by other companies as a reference
>>>>> to be able to implement the mailbox daemon in their own BMC firmware
>>>>> stack for other openpower systems, we didn=E2=80=99t want to =E2=80=
=9Cpollute=E2=80=9D the
>>>>> repository with openbmc-specific and c++ implementation that could
>>>>> confuse them.
>>>>=20
>>>> Why are there OpenBMC specific things in mboxd?
>>>>=20
>>>> Why can't the reference implementation be used? What's deficient in it?
>>>=20
>>> For OpenBMC, we=E2=80=99re having the PNOR chip with a filesystem, so m=
boxd
>>> would read/write files instead of looking for the data at an offset in
>>> the chip. Nothing deficient with it, just a different implementation
>>> that needs to be handled.
>>=20
>> Why not have an MBOX protocol that supports partitions/files natively
>> then? Why not develop this upstream? Surely this is something others
>> could be interested in.
>>=20
> It=E2=80=99d be available in the openbmc/phosphor-mboxd repo for anybody =
that
> wants to use it. Or what do you mean by develop it upstream?

I mean in https://github.com/openbmc/mboxbridge - the reference
implementation.

>> It seems really backwards having a bunch of things convert to/from FFS
>> for no reason.
>
> We=E2=80=99re not converting back and forth, if the pnor is blank, we=E2=
=80=99ll
> attach ubi to it, and if the pnor is formatted as ffs it=E2=80=99ll be
> reformatted once to ubi.

I mean that I don't see any patches changing how we build things in
op-build, so there has to be some unpacking of the content going on
there.

--=20
Stewart Smith
OPAL Architect, IBM.
