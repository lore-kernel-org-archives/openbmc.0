Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyR4t0FNLzDqPQ
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:57 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0A943i1140409
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:55 -0500
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27vt6q5asm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:55 -0500
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Tue, 10 Jan 2017 19:07:52 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 Jan 2017 19:07:50 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id D61693578057
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0A97qT951183666
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:52 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0A97nPm002238
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0A97nQ7002234
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5A050A0222
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/5] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
Date: Tue, 10 Jan 2017 20:06:36 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170110090640.12608-1-cyrilbur@gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011009-0016-0000-0000-0000020B145B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011009-0017-0000-0000-00000635F33C
Message-Id: <20170110090640.12608-2-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2
 spamscore=2 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701100129
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
X-List-Received-Date: Tue, 10 Jan 2017 09:07:58 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 .../devicetree/bindings/mailbox/aspeed-mbox.txt    | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
new file mode 100644
index 000000000000..633cd534d91c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
@@ -0,0 +1,44 @@
+ASpeed Mailbox Driver
+=====================
+
+The ASpeed mailbox allows for communication between different
+processors. The mailbox on the ASpeed ast2400 and ast2500 is a set of
+16 single byte data registers along with interrupt and configuration
+registers directly on the SoC. These are memory mapped on the aspeed
+and can be accessed via the SuperIO registers on the other processor.
+
+Device Node:
+============
+This represents the mailbox on the Soc.
+
+As the mailbox registers sit on the LPC bus, it makes most sense for
+the device to be within the LPC host node. See
+Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
+information. This does not have to be the case, provided the reg
+property can give the full address of the mbox registers.
+
+Required Properties:
+--------------------
+- compatible:	Should be one of the following,
+				"aspeed,ast2400-mbox" for ast2400 SoCs
+				"aspeed,ast2500-mbox" for ast2500 SoCs
+
+- reg:			Contains the mailbox address register range (base
+				address and length). Keeping in mind that if the node
+				exists within the LPC host node and that base is
+				relative to that.
+
+- interrupts:	Contains interrupt information for the mailbox device.
+
+- #mbox-cells:	Common property, should be 1.
+
+Example:
+--------
+
+mbox: mbox@180 {
+	compatible = "aspeed,ast2400-mbox";
+	reg = <0x180 0x5c>;
+	interrupts = <46>;
+	#mbox-cells = <1>;
+};
+
-- 
2.11.0
