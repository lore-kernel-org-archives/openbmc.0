Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RqaFZ4dK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AvTdAa7v"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjC1FWfzDrKc
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6511820D5F;
 Tue,  7 Nov 2017 02:31:56 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=8A+HS9Ol6X/qJSYAW6YgVOWRtprxa
 kaVQH7apaGCc8Q=; b=RqaFZ4dKlaKHxjfRr2c/IYboBv0pq45yg2IuPrPkJ392K
 ZComw3dM3epuPphsI6c61N0lWzKmr5b6XNSMIf5ScMMNDK49nmxhJUJjaqzSY9T0
 pOIDf7kxg+0A3yLjWltyXeGNxn6LFJr+qlkXim3dXL8QRkBnbxwP9DaWZRLfjPUp
 qCNgRVKC3V0QHllebk0EaNvmt3cI0GOYcDVkRTv72pFGfCi/gExx2ei6fQ6iDrkT
 AUu1X1kHekg6UDIIBO3mR/82tmAQ/I+sYFbSdOJb9DaSUTqBZ5uC7OzA8dxXH0Tu
 p+pQpHfZ7+uqr5frfWUjYduiic02XgOHClDlq37OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8A+HS9
 Ol6X/qJSYAW6YgVOWRtprxakaVQH7apaGCc8Q=; b=AvTdAa7vrP62Qdgk2petLX
 8iVeuv9ihbZKwYtHncwCgr7+F9+GW+auE2+6t2cEEcbQew7dzIu8vDgCUWvFBgun
 HqLlq6omZTBhDjVo4XumZLIe39KyeSLVG5MtCTAyRSC06vTy8DOQxCq+Sesy6aGA
 zF6A+aWAZt/ap23j+rsRBazPkpHUUQGzgYU/P06Kmx/PSdY6kv4nzJchkXh11npP
 STaWss++wy0E6dI6ncnjnZ0nel7Xm/B56wY73R2xGN4He/m27XlYQkO2j+ObQs1x
 FbizIMt33NusqlN6s2GXFNlX+D6gNqLFLqvRVceB9uo/co+TLjmpy0Na0p56QJaQ
 ==
X-ME-Sender: <xms:bGEBWvpnhM-BvMM61_dJL_Tn96-jkaneGLuOACh1Nwp22gOH_MekvA>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 755CC24108;
 Tue,  7 Nov 2017 02:31:54 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 14/23] dt-bindings: leds: add pca955x
Date: Tue,  7 Nov 2017 18:00:37 +1030
Message-Id: <20171107073046.13319-15-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 07:32:00 -0000

From: Cédric Le Goater <clg@kaod.org>

This adds the devicetree bindings for the PCA955x I2C LED blinkers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit 15201b5de9d62fd6ece51ba9005c441d588fcb94)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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
2.11.0
