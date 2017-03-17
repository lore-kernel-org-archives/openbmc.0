Return-Path: <ananth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkv1k724YzDrJF
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 16:25:30 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2H5Nkdm135279
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 01:25:25 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 297yvbd6vq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 01:25:25 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ananth@linux.vnet.ibm.com>;
 Fri, 17 Mar 2017 01:25:24 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Mar 2017 01:25:21 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2H5PLoG41943290; Fri, 17 Mar 2017 05:25:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC16112057;
 Fri, 17 Mar 2017 01:25:20 -0400 (EDT)
Received: from thinktux.in.ibm.com (unknown [9.199.36.131])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id C419F112047;
 Fri, 17 Mar 2017 01:25:19 -0400 (EDT)
Received: by thinktux.in.ibm.com (Postfix, from userid 1000)
 id 588121A1805; Fri, 17 Mar 2017 10:55:15 +0530 (IST)
Date: Fri, 17 Mar 2017 10:55:15 +0530
From: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, mahesh@linux.vnet.ibm.com,
 vsainath@linux.vnet.ibm.com
Subject: Re: Out-of-band SRESET
Reply-To: ananth@linux.vnet.ibm.com
References: <20170316080252.GB24841@in.ibm.com>
 <20170316153756.j7zqd7ldhrfwqvii@asimov>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170316153756.j7zqd7ldhrfwqvii@asimov>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 17031705-0056-0000-0000-0000031210A4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006796; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00834972; UDB=6.00410107; IPR=6.00612628; 
 BA=6.00005215; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014686; XFM=3.00000013;
 UTC=2017-03-17 05:25:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031705-0057-0000-0000-000007481122
Message-Id: <20170317052515.GC24841@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703170045
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
X-List-Received-Date: Fri, 17 Mar 2017 05:25:31 -0000

On Thu, Mar 16, 2017 at 10:37:56AM -0500, Patrick Williams wrote:
> On Thu, Mar 16, 2017 at 01:32:52PM +0530, Ananth N Mavinakayanahalli wrote:
> > Hi,
> > 
> > One requirement from a OpenPOWER service point-of-view is to be able to
> > trigger an out-of-band SRESET on a unresponsive system. We can then have
> > the necessary plumbing in the host Linux kernel to either drop the
> > machine into a debugger or trigger a dump capture, if configured.
> > 
> > On P9, this would translate to a series of SCOM operations for the SBE
> > It would be good to have a REST API defined to cater to this specific
> > purpose.
> > 
> > The API should cater to:
> > - SRESET a core
> > - SRESET a chip
> > - SRESET all cores
> > 
> > Thoughts?
> > 
> > Regards,
> > Ananth
> > 
> 
> Ananth,
> 
> I understand the desire from your end with respect to debugging the
> host.  Is there something we can do to model this better from a REST
> perspective to make this less Power-specific?  Do other architectures
> also have a "send debug interrupt"?

Any option that says nmi for x86 can apply here, IMO.

> Do you need to SRESET targeting an SMT thread?  We will need to come up
> with some kind of identifier for sending the debug interrupts.

For starters, we will be using the SRESET as an unrecoverable entity --
option of last resort. The SRESET all cores will be the most used, but I
can envisage cases where we would need specific cores/threads to be
forced into xmon or such. While it is good to have the design to be able
to accommodate it, targeted SMT thread reset isn't a 'must have' to
begin with.

Ananth
