Return-Path: <cyrilbur@gmail.com>
Authentication-Results: ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmNF21GGRzF1Dm
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 14:26:29 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1L3OusP093052
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 22:26:27 -0500
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g8v9ggjkw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 22:26:27 -0500
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Wed, 21 Feb 2018 03:26:25 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 21 Feb 2018 03:26:24 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1L3QNHr35979352
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:26:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2799042047
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:19:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC62042041
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:19:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:19:00 +0000 (GMT)
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B0789A0135
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 14:26:21 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] dt-bindings: misc: Add bindings for Aspeed
 ast2400/2500 LPC mbox registers
Date: Wed, 21 Feb 2018 14:25:53 +1100
X-Mailer: git-send-email 2.16.2
X-TM-AS-GCONF: 00
x-cbid: 18022103-0040-0000-0000-00000435DAEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022103-0041-0000-0000-000020D7ED9D
Message-Id: <20180221032554.9852-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-20_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802210041
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 03:26:30 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
Before I attempt to upstream this again, I thought I would run it
past this list.
Joel: I'm quite sure what you're carrying in the tree at the moment
is the same plus or minus some whitespace. I've made strong use of
sed to remove any 'mailbox' reference.
If you could double check, thanks.

When I do upstream I'll have a cover-letter which will explain how
Aspeed haven't made our naming lives easy by calling these registers
'mbox'. It makes it impossible to justify calling this driver
anything else but it does expose us to the confusion as to why it
isn't in drivers/mailbox, which really isn't the place for it.

 .../bindings/misc/aspeed,ast2400-mbox.txt          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt b/Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt
new file mode 100644
index 000000000000..b33276e058d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed,ast2400-mbox.txt
@@ -0,0 +1,35 @@
+* Aspeed MBOX Registers
+
+The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
+(BaseBoard Management Controllers) and the MBOX registers can be used
+to perform in-band communication with their host.
+
+Required properties:
+
+- compatible : should be one of
+	"aspeed,ast2400-mbox"
+	"aspeed,ast2500-mbox"
+- reg: physical address and size of the registers
+- interrupts: interrupt number to use for the device
+
+The mbox registers are attached to the LPC bus on AST2400 and AST2500
+platforms, as such the mbox node should exist as a child of the LPC
+node.
+
+Example:
+
+	lpc@1e789000 {
+		compatible = "aspeed,ast2500-lpc", "simple-mfd";
+		reg = <0x1e789000 0x1000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		...
+
+		mbox@180 {
+			compatible = "aspeed,ast2400-mbox";
+			reg = <0x180 0x18>;
+			interrupts = <46>;
+		};
+	};
-- 
2.16.2
