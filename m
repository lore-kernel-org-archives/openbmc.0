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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w6b26y16zDrTn
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 18:39:10 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4T8ZjwT030306;
 Tue, 29 May 2018 11:35:46 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 8441)
 id A8AB25A966; Tue, 29 May 2018 11:35:45 +0300 (IDT)
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
 devicetree@vger.kernel.org, davem@davemloft.net,
 mchehab+samsung@kernel.org, akpm@linux-foundation.org,
 rdunlap@infradead.org, Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v1 2/3] USB: DT probing support to ehci-npcm7xx
Date: Tue, 29 May 2018 11:35:34 +0300
Message-Id: <1527582935-31175-3-git-send-email-avifishman70@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1527582935-31175-1-git-send-email-avifishman70@gmail.com>
References: <1527582935-31175-1-git-send-email-avifishman70@gmail.com>
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
X-List-Received-Date: Tue, 29 May 2018 08:39:11 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Device Tree documentation for Nuvoton npcm7xx EHCI driver.

Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
---
 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
new file mode 100644
index 000000000000..628692dff7e4
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
+  that services interrupts for this device
+- interrupts: Should contain the EHCI interrupt
+
+Example:
+
+	ehci@e1800000 {
+		compatible = "nuvoton,npcm750-ehci", "usb-ehci";
+		reg = <0xf0806000 0x1000>;
+		interrupts = <0 61 4>;
+	};
-- 
2.14.1
