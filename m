Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnzM66dKBzDqL3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 06:51:30 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5EKn8C5146856
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:51:28 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b3ae5d8s6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:51:27 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 14 Jun 2017 16:51:27 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Jun 2017 16:51:24 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5EKpOfN54460610; Wed, 14 Jun 2017 20:51:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9890112040;
 Wed, 14 Jun 2017 16:51:29 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.200.165])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id EAFAF112034;
 Wed, 14 Jun 2017 16:51:26 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/3] Config max31785 based on devtree attrs
Date: Wed, 14 Jun 2017 15:51:12 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17061420-2213-0000-0000-000001DCF14A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007232; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00874809; UDB=6.00435495; IPR=6.00654901; 
 BA=6.00005421; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015827; XFM=3.00000015;
 UTC=2017-06-14 20:51:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061420-2214-0000-0000-00005681DADA
Message-Id: <20170614205115.47342-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706140347
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
X-List-Received-Date: Wed, 14 Jun 2017 20:51:32 -0000

Add optional property for max31785 in device tree to indicate that fan PWM
should be set to 100% on fault.  Driver references this property during
initialization time to set fault response appropriately.

Christopher Bostic (3):
  drivers/hwmon: Document optional dev tree property 'fault-max-fan'
  arch/arm/boot/dts: Add optional property for max31785
  drivers/hwmon: max31785 Set fan fault response based on dev tree

 Documentation/devicetree/bindings/hwmon/max31785.txt | 20 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts  | 1 +
 drivers/hwmon/max31785.c | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)

-- 
1.8.2.2
