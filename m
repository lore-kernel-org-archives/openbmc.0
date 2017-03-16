Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkj1n4ZCNzDqYN
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:54:53 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2GLs48n151387
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 17:54:48 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 297wd073xm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 17:54:47 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 16 Mar 2017 17:54:47 -0400
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Mar 2017 17:54:44 -0400
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2GLsh9e11665874; Thu, 16 Mar 2017 14:54:43 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFDEA6A03C;
 Thu, 16 Mar 2017 15:54:43 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.212.159])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP id 1D9746A04C;
 Thu, 16 Mar 2017 15:54:41 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 82100228D8D6; Fri, 17 Mar 2017 08:54:39 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>,
 Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>
Cc: mahesh@linux.vnet.ibm.com, openbmc@lists.ozlabs.org,
 vsainath@linux.vnet.ibm.com
Subject: Re: Out-of-band SRESET
In-Reply-To: <20170316153756.j7zqd7ldhrfwqvii@asimov>
References: <20170316080252.GB24841@in.ibm.com>
 <20170316153756.j7zqd7ldhrfwqvii@asimov>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 17 Mar 2017 08:54:39 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17031621-2213-0000-0000-00000165282A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006794; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00834822; UDB=6.00410016; IPR=6.00612477; 
 BA=6.00005215; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014680; XFM=3.00000013;
 UTC=2017-03-16 21:54:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031621-2214-0000-0000-000054BDC207
Message-Id: <87d1dgyjj4.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-16_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703160167
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
X-List-Received-Date: Thu, 16 Mar 2017 21:54:54 -0000

Patrick Williams <patrick@stwcx.xyz> writes:
> On Thu, Mar 16, 2017 at 01:32:52PM +0530, Ananth N Mavinakayanahalli wrote:
>> Hi,
>> 
>> One requirement from a OpenPOWER service point-of-view is to be able to
>> trigger an out-of-band SRESET on a unresponsive system. We can then have
>> the necessary plumbing in the host Linux kernel to either drop the
>> machine into a debugger or trigger a dump capture, if configured.
>> 
>> On P9, this would translate to a series of SCOM operations for the SBE
>> It would be good to have a REST API defined to cater to this specific
>> purpose.
>> 
>> The API should cater to:
>> - SRESET a core
>> - SRESET a chip
>> - SRESET all cores
>> 
>> Thoughts?
>> 
>> Regards,
>> Ananth
>> 
>
> Ananth,
>
> I understand the desire from your end with respect to debugging the
> host.  Is there something we can do to model this better from a REST
> perspective to make this less Power-specific?  Do other architectures
> also have a "send debug interrupt"?

on x86 there's the NMI, which can be sent via "ipmitool power diag"

It also exists in RedFish as a type of restart (on, forceoff,
gracefulrestart, nmi etc)

-- 
Stewart Smith
OPAL Architect, IBM.
