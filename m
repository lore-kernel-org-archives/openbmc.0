Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wstsM11KXzDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:42:46 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5L5ci5f136940
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 01:42:44 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b7j2g9jb8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 01:42:44 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 20 Jun 2017 23:42:43 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Jun 2017 23:42:43 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5L5ggva61407484; Tue, 20 Jun 2017 22:42:42 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C67013603C;
 Tue, 20 Jun 2017 23:42:42 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.208.22])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP id A158C13603A;
 Tue, 20 Jun 2017 23:42:41 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9E5094EC5FE; Wed, 21 Jun 2017 15:42:39 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management
In-Reply-To: <C82D2909-D48E-4F2E-9C84-C0AAAB763AFA@linux.vnet.ibm.com>
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
Date: Wed, 21 Jun 2017 15:42:39 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 17062105-0024-0000-0000-000016B057F4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007264; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877693; UDB=6.00437252; IPR=6.00657829; 
 BA=6.00005434; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015905; XFM=3.00000015;
 UTC=2017-06-21 05:42:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062105-0025-0000-0000-00004B78BECA
Message-Id: <87wp8528xc.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706210092
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
X-List-Received-Date: Wed, 21 Jun 2017 05:42:47 -0000

Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>> On Jun 19, 2017, at 12:44 AM, Stewart Smith <stewart@linux.vnet.ibm.com>=
 wrote:
>>=20
>> Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>>>> Why is there mboxbridge separate from phosphor-mboxd?
>>>=20
>>> Because the mboxbridge is being used by other companies as a reference
>>> to be able to implement the mailbox daemon in their own BMC firmware
>>> stack for other openpower systems, we didn=E2=80=99t want to =E2=80=9Cp=
ollute=E2=80=9D the
>>> repository with openbmc-specific and c++ implementation that could
>>> confuse them.
>>=20
>> Why are there OpenBMC specific things in mboxd?
>>=20
>> Why can't the reference implementation be used? What's deficient in it?
>
> For OpenBMC, we=E2=80=99re having the PNOR chip with a filesystem, so mbo=
xd
> would read/write files instead of looking for the data at an offset in
> the chip. Nothing deficient with it, just a different implementation
> that needs to be handled.

Why not have an MBOX protocol that supports partitions/files natively
then? Why not develop this upstream? Surely this is something others
could be interested in.

It seems really backwards having a bunch of things convert to/from FFS
for no reason.

The host already has such abstractions as we have it for FSP systems.

--=20
Stewart Smith
OPAL Architect, IBM.
