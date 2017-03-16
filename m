Return-Path: <ananth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkLZ55r8nzDqZ7
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 19:03:08 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2G7wmCs076960
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 04:03:01 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2978fj3k5g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 04:03:00 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ananth@linux.vnet.ibm.com>;
 Thu, 16 Mar 2017 04:02:59 -0400
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Mar 2017 04:02:57 -0400
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2G82tFk16974130; Thu, 16 Mar 2017 01:02:55 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ACDFBE044;
 Thu, 16 Mar 2017 02:02:55 -0600 (MDT)
Received: from thinktux.in.ibm.com (unknown [9.124.35.51])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 3A189BE038;
 Thu, 16 Mar 2017 02:02:55 -0600 (MDT)
Received: by thinktux.in.ibm.com (Postfix, from userid 1000)
 id E2B1F1A0A42; Thu, 16 Mar 2017 13:32:52 +0530 (IST)
Date: Thu, 16 Mar 2017 13:32:52 +0530
From: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: mahesh@linux.vnet.ibm.com, hegdevasant@linux.vnet.ibm.com,
 vsainath@linux.vnet.ibm.com
Subject: Out-of-band SRESET
Reply-To: ananth@linux.vnet.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 17031608-0056-0000-0000-0000030EC8F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006791; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00834549; UDB=6.00409850; IPR=6.00612201; 
 BA=6.00005214; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014671; XFM=3.00000013;
 UTC=2017-03-16 08:02:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031608-0057-0000-0000-00000744C7F3
Message-Id: <20170316080252.GB24841@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-16_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703160065
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
X-List-Received-Date: Thu, 16 Mar 2017 08:03:10 -0000

Hi,

One requirement from a OpenPOWER service point-of-view is to be able to
trigger an out-of-band SRESET on a unresponsive system. We can then have
the necessary plumbing in the host Linux kernel to either drop the
machine into a debugger or trigger a dump capture, if configured.

On P9, this would translate to a series of SCOM operations for the SBE
It would be good to have a REST API defined to cater to this specific
purpose.

The API should cater to:
- SRESET a core
- SRESET a chip
- SRESET all cores

Thoughts?

Regards,
Ananth
