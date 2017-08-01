Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM4836W73zDrK8
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 15:07:47 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7155Sma059567
 for <openbmc@lists.ozlabs.org>; Tue, 1 Aug 2017 01:07:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2c5ar6t6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Aug 2017 01:07:44 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 1 Aug 2017 01:07:43 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 1 Aug 2017 01:07:41 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7157fVm25297062
 for <openbmc@lists.ozlabs.org>; Tue, 1 Aug 2017 05:07:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9382AE034
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 01:07:54 -0400 (EDT)
Received: from birb.localdomain (unknown [9.81.212.169])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP id 5A1FFAE03C
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 01:07:54 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id AD5EB4EC562; Tue,  1 Aug 2017 15:07:36 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: REST API docs
Date: Tue, 01 Aug 2017 15:07:36 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17080105-0040-0000-0000-00000388AF12
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007463; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895846; UDB=6.00448091; IPR=6.00676033; 
 BA=6.00005504; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016476; XFM=3.00000015;
 UTC=2017-08-01 05:07:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080105-0041-0000-0000-0000077CD876
Message-Id: <87y3r3ooyv.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010085
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
X-List-Received-Date: Tue, 01 Aug 2017 05:07:48 -0000

The documentation up at:
https://github.com/openbmc/docs/blob/master/host-management.md
says /org/openbmc but we here tales in internal bug reports that
everything is switching to /xyz/openbmc_project.

Except, I don't recall seeing any deprecation plan.... is there
one?

We're heavily using this now for op-test-framework, and there's a patch
to switch it, but I need to know how far back/forwards the existing/new
interfaces are supported.

See:
https://github.com/open-power/op-test-framework/pull/150/commits/e05b1a89e032b1bbe14d9a177afa46f1a2c6413c

Also, could some more effort please be put into communicating these
changes. These kind of surprises aren't great for our already
constrained team.

-- 
Stewart Smith
OPAL Architect, IBM.
