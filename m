Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT32z24FfzDr0Y
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:39:07 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AMd2ID037005
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:05 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c8vv8hmw3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:05 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 18:39:04 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 18:39:01 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AMd1L732243866; Thu, 10 Aug 2017 22:39:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C502AE03B;
 Thu, 10 Aug 2017 18:39:18 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id BAB24AE034;
 Thu, 10 Aug 2017 18:39:17 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com, bjwyman@gmail.com,
 mspinler@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 1/4] dt-bindings: i2c: Document the IBM
 POWER system power supply device
Date: Thu, 10 Aug 2017 17:38:53 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081022-0008-0000-0000-0000026CF018
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900486; UDB=6.00450827; IPR=6.00680687; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:39:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081022-0009-0000-0000-000036557E76
Message-Id: <1502404736-23655-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100352
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
X-List-Received-Date: Thu, 10 Aug 2017 22:39:07 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/i2c/ibm,power-ps.txt        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
new file mode 100644
index 0000000..2ea8ea2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
@@ -0,0 +1,21 @@
+Device-tree bindings for IBM POWER system power supplies
+--------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,power-ps";
+ - reg = < I2C bus address >;		: Address of the power supply on the
+					  I2C bus.
+
+Example:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #interrupt-cells = <1>;
+        < more properties >
+
+        power_ps@68 {
+            compatible = "ibm,power-ps";
+            reg = <0x68>;
+        };
+    };
-- 
1.8.3.1
