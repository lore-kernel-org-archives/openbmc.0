Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpZB06Q6JzDqL8
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 06:00:40 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5FJwfL5048044
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:38 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b3s5j60g8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:37 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 15 Jun 2017 14:00:37 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Jun 2017 14:00:35 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5FK0Zjf65667204; Thu, 15 Jun 2017 13:00:35 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB0266E035;
 Thu, 15 Jun 2017 14:00:34 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 9BE3E6E053;
 Thu, 15 Jun 2017 14:00:34 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 0/3] Config max31785 based on devtree attrs
Date: Thu, 15 Jun 2017 15:00:30 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17061520-0016-0000-0000-000006F9630B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007238; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00875272; UDB=6.00435772; IPR=6.00655361; 
 BA=6.00005423; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015840; XFM=3.00000015;
 UTC=2017-06-15 20:00:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061520-0017-0000-0000-00003A220EA0
Message-Id: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706150345
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
X-List-Received-Date: Thu, 15 Jun 2017 20:00:41 -0000

Add optional property for max31785 in device tree to indicate that fan PWM
should be set to 100% on fault.  Driver references this property during
initialization time to set fault response appropriately.
----
Changes in v2:
	- Set fault response for fans on pages 0-3 was previously only
          setting page 0.


Christopher Bostic (3):
  drivers/hwmon: Document optional dev tree property 'fault-max-fan'
  arch/arm/boot/dts: Add optional property for max31785
  drivers/hwmon: max31785 Set fan fault response based on dev tree

 Documentation/devicetree/bindings/hwmon/max31785.txt | 20 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 drivers/hwmon/max31785.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

-- 
1.8.2.2
