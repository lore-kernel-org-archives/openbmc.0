Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBCvH5XgczDrF1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 05:26:03 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6HJNcG6135114
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 15:26:01 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2brr4apurw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 15:26:01 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 17 Jul 2017 13:26:00 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 17 Jul 2017 13:25:56 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6HJPuhK4260284; Mon, 17 Jul 2017 12:25:56 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AE956A03F;
 Mon, 17 Jul 2017 13:25:56 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.207.188])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id EA6276A03D;
 Mon, 17 Jul 2017 13:25:51 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: wim@iguana.be, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v5 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Date: Mon, 17 Jul 2017 14:25:38 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170717192539.7950-1-cbostic@linux.vnet.ibm.com>
References: <20170717192539.7950-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17071719-0016-0000-0000-00000731D19D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007379; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00888981; UDB=6.00444004; IPR=6.00669153; 
 BA=6.00005476; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016251; XFM=3.00000015;
 UTC=2017-07-17 19:25:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071719-0017-0000-0000-00003AA06D5C
Message-Id: <20170717192539.7950-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-17_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707170311
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
X-List-Received-Date: Mon, 17 Jul 2017 19:26:04 -0000

Describe device tree optional properties:

  * aspeed,reset-type = "cpu|soc|system|none"
     One of three different, mutually exclusive, values

	"cpu" : ARM CPU reset on signal
	"soc" : 'System on chip' reset
	"system" : Full system reset

     The value can also be set to "none" which indicates that no
     reset of any kind is to be done via this watchdog.  This assumes
     another watchdog on the chip is to take care of resets.

  * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
  * aspeed,alt-boot - Boot from alternate block on signal

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v5 - Removed aspeed,interrupt property - no plans at this point to
     need this functionality in the driver.
v4 - Add aspeed-reset-type and assign one of four values,
     cpu, soc, system, none.
v3 - Invert soc and sys reset to 'no' to preserve backwards
     compatibility.  SOC and SYS reset will be set by default
     without any optional parameters set
v2 - Add 'aspeed,' prefix to all optional properties
   - Add arm-reset, soc-reset, interrupt, alt-boot properties
---
 .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5e74d7..2b34ce9 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -8,9 +8,41 @@ Required properties:
  - reg: physical base address of the controller and length of memory mapped
    region
 
+Optional properties:
+
+ - aspeed,reset-type = "cpu|soc|system|none"
+
+   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
+   to generate one of three different, mutually exclusive, types of resets.
+
+   Type "none" can be specified to indicate that no resets are to be done.
+   This is useful in situations where another watchdog engine on chip is
+   to perform the reset.
+
+   If 'aspeed,reset-type=' is not specfied the default is to enable system
+   reset.
+
+   Reset types:
+
+        - cpu: Reset CPU on watchdog timeout
+
+        - soc: Reset 'System on Chip' on watchdog timeout
+
+        - system: Reset system on watchdog timeout
+
+        - none: No reset is performed on timeout. Assumes another watchdog
+                engine is responsible for this.
+
+ - aspeed,external-signal: If property is present then signal is sent to
+			external reset counter (only WDT1 and WDT2). If not
+			specified no external signal is sent.
+ - aspeed,alt-boot:    If property is present then boot from alternate block.
+
 Example:
 
 	wdt1: watchdog@1e785000 {
 		compatible = "aspeed,ast2400-wdt";
 		reg = <0x1e785000 0x1c>;
+		aspeed,reset-type = "system";
+		aspeed,external-signal;
 	};
-- 
1.8.2.2
