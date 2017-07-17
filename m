Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBGbk674zzDrF4
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 07:27:46 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6HLOOSG142061
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 17:27:44 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2brrfehne6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 17:27:43 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 17 Jul 2017 17:27:43 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 17 Jul 2017 17:27:41 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6HLRerI25624794; Mon, 17 Jul 2017 21:27:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8D81AC03A;
 Mon, 17 Jul 2017 17:27:49 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.207.188])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id C2896AC040;
 Mon, 17 Jul 2017 17:27:47 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/2] Add GPIO keys polled for pca955x
Date: Mon, 17 Jul 2017 16:27:30 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17071721-0048-0000-0000-000001C59A27
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007379; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889021; UDB=6.00444028; IPR=6.00669194; 
 BA=6.00005476; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016252; XFM=3.00000015;
 UTC=2017-07-17 21:27:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071721-0049-0000-0000-000041EB9CB5
Message-Id: <20170717212732.8629-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-17_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707170345
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
X-List-Received-Date: Mon, 17 Jul 2017 21:27:47 -0000

Define gpio keys polled devices in the device tree for fan presence lines off of
the pca955x. Enable GPIO keys polled config option.

Christopher Bostic (2):
  ARM: dts: aspeed: Add gpio-keys-polled for fan presence
  ARM: configs: aspeed: Add GPIO_KEYS_POLLED

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 34 ++++++++++++++++++++++++
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 2 files changed, 35 insertions(+)

-- 
1.8.2.2
