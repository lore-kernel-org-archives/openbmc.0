Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnzMC1C1PzDqL3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 06:51:35 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5EKmk52002116
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:51:32 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b388u3ydw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:51:32 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 14 Jun 2017 16:51:31 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Jun 2017 16:51:29 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5EKpTMd3735860; Wed, 14 Jun 2017 20:51:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99C5011204B;
 Wed, 14 Jun 2017 16:51:34 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.200.165])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id D5FB7112054;
 Wed, 14 Jun 2017 16:51:31 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/3] drivers/hwmon: Document optional dev tree
 property 'fault-max-fan'
Date: Wed, 14 Jun 2017 15:51:13 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170614205115.47342-1-cbostic@linux.vnet.ibm.com>
References: <20170614205115.47342-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17061420-0036-0000-0000-0000022B2816
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007232; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00874809; UDB=6.00435495; IPR=6.00654901; 
 BA=6.00005421; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015827; XFM=3.00000015;
 UTC=2017-06-14 20:51:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061420-0037-0000-0000-000040BA3C52
Message-Id: <20170614205115.47342-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 14 Jun 2017 20:51:35 -0000

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
