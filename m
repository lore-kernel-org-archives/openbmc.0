Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpZB36Mj1zDqL8
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 06:00:43 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5FJxjaV008273
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:41 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b3sprcpg8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 16:00:40 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 15 Jun 2017 14:00:39 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Jun 2017 14:00:36 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5FK0aMN17236118; Thu, 15 Jun 2017 13:00:36 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 351956E035;
 Thu, 15 Jun 2017 14:00:36 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id EA9576E03A;
 Thu, 15 Jun 2017 14:00:35 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 1/3] drivers/hwmon: Document optional dev
 tree property 'fault-max-fan'
Date: Thu, 15 Jun 2017 15:00:31 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
References: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17061520-0004-0000-0000-000012615C42
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007238; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00875273; UDB=6.00435772; IPR=6.00655361; 
 BA=6.00005423; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015840; XFM=3.00000015;
 UTC=2017-06-15 20:00:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061520-0005-0000-0000-00007FC5C97A
Message-Id: <20170615200033.67387-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 15 Jun 2017 20:00:44 -0000

Document new optional device tree property 'fault-max-fan'.  This
property indicates that the max31785 should be configured to drive
fan with 100% PWM duty cycle on fault condition.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 Documentation/devicetree/bindings/hwmon/max31785.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
new file mode 100644
index 0000000..2b0190d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max31785.txt
@@ -0,0 +1,20 @@
+Bindings for MAX31785 I2C fan controller
+
+Reference:
+[1]	https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+
+Required properties:
+- compatible : "maxim,max31785"
+- reg        : I2C address, 0x52.
+
+Optional properties, default is to retain the chip's current setting:
+- fault-max-fan : When present this property indicates to set fan to 100% PWM
+                  duty cycle on FAULT condition.
+
+Example:
+
+        max31785@52 {
+                compatible = "maxim,max31785";
+                reg = <0x52>;
+                fault-max-fan;
+        };
-- 
1.8.2.2
