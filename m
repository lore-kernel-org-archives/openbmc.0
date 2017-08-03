Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN9fG0dVgzDrJR
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 10:19:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v730ImGg019540
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 20:19:15 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c3r5a2476-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 20:19:15 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 18:19:14 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 18:19:13 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v730JD8m64946196; Wed, 2 Aug 2017 17:19:13 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 398136A03D;
 Wed,  2 Aug 2017 18:19:13 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.211.191])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP id 87D066A041;
 Wed,  2 Aug 2017 18:19:12 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 95C964EC562; Thu,  3 Aug 2017 10:19:10 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Image Management - Witherspoon
In-Reply-To: <5E11AC40-EE32-479D-90F2-9F684B0DBE2A@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <5E11AC40-EE32-479D-90F2-9F684B0DBE2A@linux.vnet.ibm.com>
Date: Thu, 03 Aug 2017 10:19:10 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17080300-0028-0000-0000-000008214D59
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007473; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896709; UDB=6.00448609; IPR=6.00676897; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016505; XFM=3.00000015;
 UTC=2017-08-03 00:19:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080300-0029-0000-0000-000036F66EA5
Message-Id: <87k22llczl.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030003
X-Mailman-Approved-At: Thu, 03 Aug 2017 15:27:37 +1000
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
X-List-Received-Date: Thu, 03 Aug 2017 00:19:18 -0000

Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
> This week, the support for virtual pnor on witherspoon (which reformats the pnor chip to ubi) will be turned on.
> REST interfaces and copying partition files for patching replace pflash for updating and patching the pnor.
>
> Additional details of the implementation and instructions are documented here:
> https://gerrit.openbmc-project.xyz/#/c/4756/ <https://gerrit.openbmc-project.xyz/#/c/4756/>
> https://gerrit.openbmc-project.xyz/#/c/5433/ <https://gerrit.openbmc-project.xyz/#/c/5433/>
>
>
>> On Jun 13, 2017, at 1:10 PM, Adriana Kobylak <anoo@linux.vnet.ibm.com> wrote:
>> 
>> In the next coming days, the changes to the host bios update procedure will be available for use.
>> 
>> Notable changes are using a squashfs image that includes individual pnor partition files instead of the ffs (.pnor) image, formatting the pnor chip as ubi to store these files (allowing for the storage of more than one image), and mailbox daemon updates to support these changes (new phosphor-mboxd repo).
>> 
>> Regarding the mailbox daemon, the mboxbridge repository is staying as a reference implementation and has been cloned into phosphor-mboxd. Any system using mailbox and running with a flashed ffs pnor image (instead of updating to the ubi layout) would still need the reference mboxbridge implementation. The openbmc build is being updated to build phosphor-mboxd as the default.
>> 
>> A system can be updated transparently from running with an ffs pnor image to the squashfs image via the Software dbus interfaces. In a similar way, a system with a ubi-formatted pnor can be flashed with an ffs pnor image using pflash.
>> 
>> The first round of documentation updates are here: https://gerrit.openbmc-project.xyz/#/c/4756/ <https://gerrit.openbmc-project.xyz/#/c/4756/>
>> Reviewers welcome :)

This breaks all our scripts and workflow.

-- 
Stewart Smith
OPAL Architect, IBM.
