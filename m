Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLyQ41T08zDsSh
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:49:31 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710ml4m129463
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:49:29 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2a86mdr1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:49:29 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:49:28 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:49:25 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710nPHR19071134; Tue, 1 Aug 2017 00:49:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB167112047;
 Mon, 31 Jul 2017 20:49:18 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 725F7112034;
 Mon, 31 Jul 2017 20:49:18 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 6/6] dt-bindings: i2c: Add FSI-attached I2C
 master dt binding documentation
Date: Mon, 31 Jul 2017 19:49:06 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501548546-21096-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501548546-21096-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0048-0000-0000-000001CCA02B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895759; UDB=6.00448039; IPR=6.00675947; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:49:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0049-0000-0000-000042141762
Message-Id: <1501548546-21096-7-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010009
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
X-List-Received-Date: Tue, 01 Aug 2017 00:49:32 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-fsi.txt | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-fsi.txt b/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
new file mode 100644
index 0000000..b1be2ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
@@ -0,0 +1,40 @@
+Device-tree bindings for FSI-attached I2C master and busses
+-----------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,i2c-fsi";
+ - reg = < address size >;		: The FSI CFAM address and address
+					  space size.
+ - #address-cells = <1>;		: Number of address cells in child
+					  nodes.
+ - #size-cells = <0>;			: Number of size cells in child nodes.
+ - child nodes				: Nodes to describe busses off the I2C
+					  master.
+
+Child node required properties:
+ - reg = < port number >		: The port number on the I2C master.
+
+Child node optional properties:
+ - child nodes				: Nodes to describe devices on the I2C
+					  bus.
+
+Examples:
+
+    i2c@1800 {
+        compatible = "ibm,i2c-fsi";
+        reg = < 0x1800 0x400 >;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-bus@0 {
+            reg = <0>;
+        };
+
+        i2c-bus@1 {
+            reg = <1>;
+
+            eeprom@50 {
+                compatible = "vendor,dev-name";
+            };
+        };
+    };
-- 
1.8.3.1
