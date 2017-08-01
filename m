Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLycx2TcYzDsRW
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:57 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wdHw001990
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:55 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c26yy6r8t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:55 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:54 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:51 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wpbG26870010; Tue, 1 Aug 2017 00:58:51 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2417CAC041;
 Mon, 31 Jul 2017 20:59:05 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id C4736AC040;
 Mon, 31 Jul 2017 20:59:04 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 10/10] dt-bindings: i2c: Add P8 OCC hwmon
 driver documentation
Date: Mon, 31 Jul 2017 19:58:27 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0056-0000-0000-000003AFA087
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895762; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0057-0000-0000-000007E5C91E
Message-Id: <1501549107-22323-11-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010012
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
X-List-Received-Date: Tue, 01 Aug 2017 00:58:57 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for I2C-based OCC hwmon driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
new file mode 100644
index 0000000..8c765d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
@@ -0,0 +1,25 @@
+Device-tree bindings for I2C-based On-Chip Controller hwmon driver
+------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p8-occ-hwmon";
+ - reg = <I2C address>;			: I2C bus address
+
+Examples:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clock-frequency = <100000>;
+        < more properties >
+
+        occ-hwmon@1 {
+            compatible = "ibm,p8-occ-hwmon";
+            reg = <0x50>;
+        };
+
+        occ-hwmon@2 {
+            compatible = "ibm,p8-occ-hwmon";
+            reg = <0x51>;
+        };
+    };
-- 
1.8.3.1
