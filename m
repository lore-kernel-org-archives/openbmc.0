Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsVpJ1JxLzDqhk
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 00:38:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5KEXeLp134908
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 10:38:45 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b6mk42k8u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 10:38:45 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 20 Jun 2017 08:38:44 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Jun 2017 08:38:42 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5KEcgUa60882982; Tue, 20 Jun 2017 07:38:42 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E136E045;
 Tue, 20 Jun 2017 08:38:42 -0600 (MDT)
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.218])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS id 426EF6E048;
 Tue, 20 Jun 2017 08:38:42 -0600 (MDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC Image Management
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
In-Reply-To: <87mv945y5r.fsf@linux.vnet.ibm.com>
Date: Tue, 20 Jun 2017 09:38:40 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <87y3sv8str.fsf@linux.vnet.ibm.com>
 <DF60C6B0-BEF2-4CBA-B5D8-6B85EF0F158A@linux.vnet.ibm.com>
 <87mv945y5r.fsf@linux.vnet.ibm.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17062014-0008-0000-0000-0000080ECB26
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007261; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877477; UDB=6.00437122; IPR=6.00657616; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015899; XFM=3.00000015;
 UTC=2017-06-20 14:38:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062014-0009-0000-0000-000042B4AE5C
Message-Id: <C82D2909-D48E-4F2E-9C84-C0AAAB763AFA@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706200258
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
X-List-Received-Date: Tue, 20 Jun 2017 14:38:48 -0000


> On Jun 19, 2017, at 12:44 AM, Stewart Smith =
<stewart@linux.vnet.ibm.com> wrote:
>=20
> Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>>> Why is there mboxbridge separate from phosphor-mboxd?
>>=20
>> Because the mboxbridge is being used by other companies as a =
reference
>> to be able to implement the mailbox daemon in their own BMC firmware
>> stack for other openpower systems, we didn=E2=80=99t want to =
=E2=80=9Cpollute=E2=80=9D the
>> repository with openbmc-specific and c++ implementation that could
>> confuse them.
>=20
> Why are there OpenBMC specific things in mboxd?
>=20
> Why can't the reference implementation be used? What's deficient in =
it?

For OpenBMC, we=E2=80=99re having the PNOR chip with a filesystem, so =
mboxd would read/write files instead of looking for the data at an =
offset in the chip. Nothing deficient with it, just a different =
implementation that needs to be handled.

>=20
> --=20
> Stewart Smith
> OPAL Architect, IBM.
