Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lRzG089hzDqgZ
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 07:11:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w77LAFg9141603
 for <openbmc@lists.ozlabs.org>; Tue, 7 Aug 2018 17:11:50 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kqja49rnf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 17:11:50 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 7 Aug 2018 15:11:49 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Aug 2018 15:11:48 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w77LBloF14942622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Aug 2018 14:11:47 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89804136051;
 Tue,  7 Aug 2018 15:11:47 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 587D313604F;
 Tue,  7 Aug 2018 15:11:47 -0600 (MDT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Aug 2018 15:11:47 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [RFC 2/3] dt-bindings: media: Add Aspeed Video Engine binding
 documentation
Date: Tue,  7 Aug 2018 16:11:42 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1533676303-305-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1533676303-305-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18080721-8235-0000-0000-00000DE2FC75
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01070748; UDB=6.00551164; IPR=6.00850164; 
 MB=3.00022570; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-07 21:11:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18080721-8236-0000-0000-000042304EBC
Message-Id: <1533676303-305-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808070212
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 21:11:54 -0000

Document the bindings.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 .../devicetree/bindings/media/aspeed-video.txt     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt

diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
new file mode 100644
index 0000000..91a494e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
@@ -0,0 +1,25 @@
+* Device tree bindings for Aspeed Video Engine
+
+The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs can
+capture and compress video data from digital or analog sources.
+
+Required properties:
+ - compatible:		"aspeed,ast2400-video" or "aspeed,ast2500-video"
+ - reg:			contains the offset and length of the VE memory region
+ - clocks:		pointers to the the "vclk" and "eclk" of the syscon
+ - clock-names:		"vclk-gate", "eclk-gate"
+ - resets:		pointer to the VE reset of the syscon
+ - interrupts:		the interrupt associated with the VE on this platform
+ - reg-scu:		pointer to the syscon itself
+
+Example:
+
+video: video@1e700000 {
+        compatible = "aspeed,ast2500-video";
+        reg = <0x1e700000 0x20000>;
+        clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
+        clock-names = "vclk-gate", "eclk-gate";
+        resets = <&syscon ASPEED_RESET_VIDEO>;
+        interrupts = <7>;
+        reg-scu = <&syscon>;
+};
-- 
1.8.3.1
