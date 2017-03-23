Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpWXL53QGzDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 14:01:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2N2wrfi067608
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 23:01:01 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29bv3hj4ca-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 23:01:01 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 22 Mar 2017 21:01:00 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Mar 2017 21:00:57 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2N30uSh8061374; Wed, 22 Mar 2017 20:00:56 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8668BE03A;
 Wed, 22 Mar 2017 21:00:56 -0600 (MDT)
Received: from birb.localdomain (unknown [9.83.1.34])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP id 85B7FBE03E;
 Wed, 22 Mar 2017 21:00:55 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 50B43228D8D6; Thu, 23 Mar 2017 14:00:50 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Chris Austen <austenc@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: possible hackathon
In-Reply-To: <OF3D2CC421.3C763A88-ON862580EB.006DE8D6-862580EB.0078D20E@notes.na.collabserv.com>
References: <OF3D2CC421.3C763A88-ON862580EB.006DE8D6-862580EB.0078D20E@notes.na.collabserv.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 23 Mar 2017 14:00:50 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17032303-0020-0000-0000-00000B9FBB99
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006832; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837588; UDB=6.00411784; IPR=6.00615355; 
 BA=6.00005232; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014768; XFM=3.00000013;
 UTC=2017-03-23 03:00:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032303-0021-0000-0000-00005B1474E2
Message-Id: <87y3vwu271.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230027
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
X-List-Received-Date: Thu, 23 Mar 2017 03:01:07 -0000

Chris Austen <austenc@us.ibm.com> writes:
> I'm not saying there is, but if there was a possibility for a hackathon are
> there any ideas out there that would be of interest?  Some things off the
> top of my head would be...
>
> Updated simulation model
> remote python scripts to collect thermal data from the host
> Redfish dbus discovery
> bmc swarm... talk dbus over multiple BMCs
> System XML builder
> OpenStack Ironic pluggin

op-test-framework integration.

I have the most basic of basic bits of OpenBMC support:
https://github.com/open-power/op-test-framework/blob/master/common/OpTestOpenBMC.py

but it lacks support for literally everything except getting access to
host console.

The reality is, if we're going to ship OpenBMC based OpenPOWER machines,
we need to be able to test them with our automated tests, which means
either the current REST API has to be consumed, or something like
RedFish needs to happen (and be consumed).

It could be helpful to have the OPAL test teams work alongside OpenBMC
dev on this and a good view into the world of living with OpenBMC?

-- 
Stewart Smith
OPAL Architect, IBM.
