Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Bm6B3h0tzF0Vt;
 Fri, 22 Jun 2018 14:38:26 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5M4bxtc007762;
 Thu, 21 Jun 2018 23:38:00 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 1/2] dt-bindings: fsi: Add optional chip-id to CFAMs
Date: Fri, 22 Jun 2018 14:37:55 +1000
Message-Id: <20180622043756.21158-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Fri, 22 Jun 2018 04:38:27 -0000

This represents a physical chip in the system and allows
a stable numbering scheme to be passed to udev for userspace
to recognize which chip is which.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 Documentation/devicetree/bindings/fsi/fsi.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
index ab516c673a4b..afb4eccab131 100644
--- a/Documentation/devicetree/bindings/fsi/fsi.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi.txt
@@ -83,6 +83,10 @@ addresses and sizes in the slave address space:
     #address-cells = <1>;
     #size-cells = <1>;
 
+Optionally, a slave can provide a global unique chip ID which is used to
+identify the physical location of the chip in a system specific way
+
+    chip-id = <0>;
 
 FSI engines (devices)
 ---------------------
@@ -125,6 +129,7 @@ device tree if no extra platform information is required.
             reg = <0 0>;
             #address-cells = <1>;
             #size-cells = <1>;
+	    chip-id = <0>;
 
             /* FSI engine at 0xc00, using a single page. In this example,
              * it's an I2C master controller, so subnodes describe the
-- 
2.17.1
