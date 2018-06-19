Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4199Dm0KZ9zF0jD
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 00:23:32 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w5JEMmSh025148;
 Tue, 19 Jun 2018 17:22:49 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id C9E5F62E6F; Tue, 19 Jun 2018 17:22:48 +0300 (IDT)
From: avifishman70@gmail.com
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com,
 mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org,
 jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com,
 tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org,
 digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v6 2/3] dt-bindings: usb: new ehci-npcm7xx dt
Date: Tue, 19 Jun 2018 17:22:45 +0300
Message-Id: <20180619142246.104469-3-avifishman70@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180619142246.104469-1-avifishman70@gmail.com>
References: <20180619142246.104469-1-avifishman70@gmail.com>
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
X-List-Received-Date: Tue, 19 Jun 2018 14:23:37 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Device Tree documentation for Nuvoton npcm7xx EHCI.

Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---
 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
new file mode 100644
index 000000000000..5a0f1f14fbfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
@@ -0,0 +1,18 @@
+Nuvoton NPCM7XX SoC USB controllers:
+-----------------------------
+
+EHCI:
+-----
+
+Required properties:
+- compatible: "nuvoton,npcm750-ehci"
+- interrupts: Should contain the EHCI interrupt
+- reg:        Physical address and length of the register set for the device
+
+Example:
+
+	ehci1: usb@f0806000 {
+		compatible = "nuvoton,npcm750-ehci";
+		reg = <0xf0806000 0x1000>;
+		interrupts = <0 61 4>;
+	};
-- 
2.14.1
