Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrg0p1qz0zDq7c
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 15:44:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5J5hxPB070962
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 01:44:55 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b64htgew7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 01:44:55 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 18 Jun 2017 23:44:54 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 18 Jun 2017 23:44:53 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5J5iqqm20316282; Sun, 18 Jun 2017 22:44:52 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C92436E03A;
 Sun, 18 Jun 2017 23:44:52 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.207.113])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with SMTP id 1EDF06E038;
 Sun, 18 Jun 2017 23:44:51 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id F1CC84EC5FE; Mon, 19 Jun 2017 15:44:48 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management
In-Reply-To: <DF60C6B0-BEF2-4CBA-B5D8-6B85EF0F158A@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <87y3sv8str.fsf@linux.vnet.ibm.com>
 <DF60C6B0-BEF2-4CBA-B5D8-6B85EF0F158A@linux.vnet.ibm.com>
Date: Mon, 19 Jun 2017 15:44:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 17061905-0028-0000-0000-000007D62EBD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007254; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00876840; UDB=6.00436738; IPR=6.00656979; 
 BA=6.00005429; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015878; XFM=3.00000015;
 UTC=2017-06-19 05:44:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061905-0029-0000-0000-00003647AFC7
Message-Id: <87mv945y5r.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706190098
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
X-List-Received-Date: Mon, 19 Jun 2017 05:44:58 -0000

Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>> Why is there mboxbridge separate from phosphor-mboxd?
>
> Because the mboxbridge is being used by other companies as a reference
> to be able to implement the mailbox daemon in their own BMC firmware
> stack for other openpower systems, we didn=E2=80=99t want to =E2=80=9Cpol=
lute=E2=80=9D the
> repository with openbmc-specific and c++ implementation that could
> confuse them.

Why are there OpenBMC specific things in mboxd?

Why can't the reference implementation be used? What's deficient in it?

--=20
Stewart Smith
OPAL Architect, IBM.
