Return-Path: <oleksandrs@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xcFtL2RkwzDqh0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 02:11:37 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 oleksandrs@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 22 Aug 2017 19:10:58 +0300
Received: from r-vnc16.mtr.labs.mlnx (r-vnc16.mtr.labs.mlnx [10.208.0.16])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v7MGAv0g001938;
 Tue, 22 Aug 2017 19:10:58 +0300
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: gregkh@linuxfoundation.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, Oleksandr Shamray <oleksandrs@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>
Subject: [patch v6 3/3] Doccumentation: jtag: Add bindings for Aspeed SoC 24xx
 and 25xx families JTAG master driver
Date: Tue, 22 Aug 2017 19:10:56 +0300
Message-Id: <1503418256-5215-4-git-send-email-oleksandrs@mellanox.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Tue, 22 Aug 2017 16:11:39 -0000
X-List-Received-Date: Tue, 22 Aug 2017 16:11:39 -0000

It has been tested on Mellanox system with BMC equipped with
Aspeed 2520 SoC for programming CPLD devices.

Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
Signed-off-by: Jiri Pirko <jiri@mellanox.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v5->v6
Comments pointed by Tobias Klauser <tklauser@distanz.ch>
- Small nit: s/doccumentation/Documentation/

v4->v5

V3->v4
Comments pointed by Rob Herring <robh@kernel.org>
- delete unnecessary "status" and "reg-shift" descriptions in
  bndings file

v2->v3
Comments pointed by Rob Herring <robh@kernel.org>
- split Aspeed jtag driver and binding to sepatrate patches
- delete unnecessary "status" and "reg-shift" descriptions in
  bndings file
---
 .../devicetree/bindings/jtag/aspeed-jtag.txt       |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.txt

diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
new file mode 100644
index 0000000..f4ded49
--- /dev/null
+++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
@@ -0,0 +1,18 @@
+Aspeed JTAG driver for ast2400 and ast2500 SoC
+
+Required properties:
+- compatible:		Should be one of
+      - "aspeed,aspeed2400-jtag"
+      - "aspeed,aspeed2500-jtag"
+- reg			contains the offset and length of the JTAG memory
+			region
+- clocks		root clock of bus, should reference the APB clock
+- interrupts		should contain JTAG controller interrupt
+
+Example:
+jtag: jtag@1e6e4000 {
+	compatible = "aspeed,aspeed2500-jtag";
+	reg = <0x1e6e4000 0x1c>;
+	clocks = <&clk_apb>;
+	interrupts = <43>;
+};
-- 
1.7.1
