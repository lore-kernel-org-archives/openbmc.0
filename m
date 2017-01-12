Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzRWM18YSzDqQl
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0C0SsDM110029
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:30:52 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27wrdxg4cy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:30:51 -0500
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 12 Jan 2017 10:30:48 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 Jan 2017 10:30:46 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id EBC8C2BB005B
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:45 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0C0UjDM3998188
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:45 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0C0UiFZ016768
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:45 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0C0UiRQ016756; Thu, 12 Jan 2017 11:30:44 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1B71FA024F;
 Thu, 12 Jan 2017 11:30:44 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
Date: Thu, 12 Jan 2017 11:29:07 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170112002910.3650-1-cyrilbur@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011200-0012-0000-0000-00000202C281
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011200-0013-0000-0000-000006CB9B84
Message-Id: <20170112002910.3650-2-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-11_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 spamscore=1 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701120004
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
X-List-Received-Date: Thu, 12 Jan 2017 00:30:55 -0000

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
