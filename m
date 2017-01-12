Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzRWK5rD2zDqQ1
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0C0SreH019386
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:30:51 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27wxrb146b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:30:51 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 12 Jan 2017 10:30:48 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 Jan 2017 10:30:47 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id A08392BB0057
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:46 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0C0UkQL36503776
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:46 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0C0UjWq023823
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:46 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0C0Uj8X023817; Thu, 12 Jan 2017 11:30:45 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D0F94A024F;
 Thu, 12 Jan 2017 11:30:44 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: [PATCH 2/4] Documentation: dt: misc: Add Aspeed ast2400/2500 LPC
 Control bindings
Date: Thu, 12 Jan 2017 11:29:08 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170112002910.3650-1-cyrilbur@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011200-0044-0000-0000-0000021BBECB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011200-0045-0000-0000-00000656A46D
Message-Id: <20170112002910.3650-3-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-11_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
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
X-List-Received-Date: Thu, 12 Jan 2017 00:30:54 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
new file mode 100644
index 000000000000..f84ac83211ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
@@ -0,0 +1,78 @@
+ASpeed LPC Control
+==================
+This binding defines the LPC control for ASpeed SoCs. Partitions of
+the LPC bus can be access by other processors on the system, address
+ranges on the bus can map accesses from another processor to regions
+of the ASpeed SoC memory space.
+
+Reserved Memory:
+================
+The driver provides functionality to map the LPC bus to a region of
+ASpeed ram. A phandle to a reserved memory node must be provided so
+that the driver can safely use this region.
+
+Flash:
+======
+The driver provides functionality to unmap the LPC bus from ASpeed
+RAM, historically the default mapping has been to the SPI flash
+controller on the ASpeed SoC, a phandle to this node should be
+supplied.
+
+Device Node:
+============
+
+As LPC bus configuration registers are at the start of the LPC bus
+memory space, it makes most sense for the device to be within the LPC
+host node. See Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+for more information. This does not have to be the case, provided the
+reg property can give the full address of the LPC bus.
+
+Required properties:
+--------------------
+
+- compatible:		"aspeed,ast2400-lpc-ctrl" for ASpeed ast2400 SoCs
+					"aspeed,ast2500-lpc-ctrl" for ASpeed ast2500 SoCs
+
+- reg:				Location and size of the configuration registers
+					for the LPC bus. Note that if the device node is
+					within the LPC host node then base is relative to
+					that.
+
+- memory-region:	phandle of the reserved memory region
+- flash:			phandle of the SPI flash controller
+
+Example:
+--------
+
+reserved-memory {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	...
+
+	flash_memory: region@54000000 {
+		compatible = "aspeed,ast2400-lpc-ctrl";
+		no-map;
+		reg = <0x54000000 0x04000000>; /* 64M */
+	};
+};
+
+host_pnor: spi@1e630000 {
+	reg = < 0x1e630000 0x18
+			0x30000000 0x02000000 >;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "aspeed,ast2400-smc";
+
+	...
+
+};
+
+lpc-ctrl@0 {
+	compatible = "aspeed,ast2400-lpc-ctrl";
+	memory-region = <&flash_memory>;
+	flash = <&host_pnor>;
+	reg = <0x0 0x80>;
+};
+
-- 
2.11.0
