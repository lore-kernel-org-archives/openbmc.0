Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsrl46l8CzDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 14:07:12 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5L43pWD127438
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 00:07:10 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b72hj68q6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 00:07:10 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 21 Jun 2017 00:07:09 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 21 Jun 2017 00:07:07 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5L476KM59900084; Wed, 21 Jun 2017 04:07:06 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC2BE124037;
 Wed, 21 Jun 2017 00:04:37 -0400 (EDT)
Received: from birb.localdomain (unknown [9.81.208.22])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP id 07FFC12405B;
 Wed, 21 Jun 2017 00:04:36 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 343D24EC5FE; Wed, 21 Jun 2017 14:07:03 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC and Redfish - intro
In-Reply-To: <OFFA529A42.5FDE064B-ON86258145.00576CCE-86258145.005CA593@notes.na.collabserv.com>
References: <OFFA529A42.5FDE064B-ON86258145.00576CCE-86258145.005CA593@notes.na.collabserv.com>
Date: Wed, 21 Jun 2017 14:07:03 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17062104-0052-0000-0000-00000229537D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007264; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877693; UDB=6.00437252; IPR=6.00657829; 
 BA=6.00005433; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015905; XFM=3.00000015;
 UTC=2017-06-21 04:07:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062104-0053-0000-0000-0000510A7959
Message-Id: <87bmpi2dco.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-20_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706210068
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
X-List-Received-Date: Wed, 21 Jun 2017 04:07:13 -0000

Chris Austen <austenc@us.ibm.com> writes:
> Well that is a loaded subject line!
>
> We have talked for a while about wanting to support the DMTF Redfish REST
> interface.  Support would allow operators to adhere to a growing industry
> standard and allow communities such as OCP (Open Compute Project) a
> platform to put in to practice their profiles.  I think Operators and API
> developers would also appreciate the interface.

AS someone who's likely to consume it (via our test infrastructure for
OpenPOWER firmware), I'm really keen to see it.

I know at least one other BMC implementation we interact with is doing
RedFish, and it'd be good to have only one set of code to talk to BMCs,
rather than the current situation.

-- 
Stewart Smith
OPAL Architect, IBM.
