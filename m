Return-Path: <clg@kaod.org>
X-Greylist: delayed 499 seconds by postgrey-1.36 at bilbo;
 Fri, 09 Jun 2017 23:21:11 AEST
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net
 [178.32.125.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkjbq4gBdzDqLF
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 23:21:11 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1DE5DE332C
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:12:55 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id DCD836000AB;
 Fri,  9 Jun 2017 15:12:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/5] dt-bindings leds: add pca955x
Date: Fri,  9 Jun 2017 15:12:28 +0200
Message-Id: <1497013949-8786-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497013949-8786-1-git-send-email-clg@kaod.org>
References: <1497013949-8786-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11445335504230714114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrieehgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 09 Jun 2017 13:21:12 -0000

This adds the devicetree bindings for the PCA955x I2C LED blinkers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 .../devicetree/bindings/leds/leds-pca955x.txt      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
new file mode 100644
index 000000000000..7984efb767b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
@@ -0,0 +1,88 @@
+* NXP - pca955x LED driver
+
+The PCA955x family of chips are I2C LED blinkers whose pins not used
+to control LEDs can be used as general purpose I/Os. The GPIO pins can
+be input or output, and output pins can also be pulse-width controlled.
+
+Required properties:
+- compatible : should be one of :
+	"nxp,pca9550"
+	"nxp,pca9551"
+	"nxp,pca9552"
+	"nxp,pca9553"
+- #address-cells: must be 1
+- #size-cells: must be 0
+- reg: I2C slave address. depends on the model.
+
+Optional properties:
+- gpio-controller: allows pins to be used as GPIOs.
+- #gpio-cells: must be 2.
+- gpio-line-names: define the names of the GPIO lines
+
+LED sub-node properties:
+- reg : number of LED line.
+		from 0 to  1 for the pca9550
+		from 0 to  7 for the pca9551
+		from 0 to 15 for the pca9552
+		from 0 to  3 for the pca9553
+- type: (optional) either
+	PCA9532_TYPE_NONE
+	PCA9532_TYPE_LED
+	PCA9532_TYPE_GPIO
+	see dt-bindings/leds/leds-pca955x.h (default to LED)
+- label : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+- linux,default-trigger : (optional)
+	see Documentation/devicetree/bindings/leds/common.txt
+
+Examples:
+
+pca9552: pca9552@60 {
+	compatible = "nxp,pca9552";
+	#address-cells = <1>;
+        #size-cells = <0>;
+	reg = <0x60>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+	gpio-line-names = "GPIO12", "GPIO13", "GPIO14", "GPIO15";
+
+	gpio@12 {
+		reg = <12>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+	gpio@13 {
+		reg = <13>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+	gpio@14 {
+		reg = <14>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+	gpio@15 {
+		reg = <15>;
+		type = <PCA955X_TYPE_GPIO>;
+	};
+
+	led@0 {
+		label = "red:power";
+		linux,default-trigger = "default-on";
+		reg = <0>;
+		type = <PCA955X_TYPE_LED>;
+	};
+	led@1 {
+		label = "green:power";
+		reg = <1>;
+		type = <PCA955X_TYPE_LED>;
+	};
+	led@2 {
+		label = "pca9552:yellow";
+		reg = <2>;
+		type = <PCA955X_TYPE_LED>;
+	};
+	led@3 {
+		label = "pca9552:white";
+		reg = <3>;
+		type = <PCA955X_TYPE_LED>;
+	};
+};
-- 
2.7.4
