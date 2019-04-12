Return-Path: <3waOwXAcKB7Yrajpqnackkcha.YkiklajXiYheopo.kvhWXo.knc@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com;
 envelope-from=3waowxackb7yrajpqnackkcha.ykiklajxiyheopo.kvhwxo.knc@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MZ/eks22"; 
 dkim-atps=neutral
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com
 [IPv6:2607:f8b0:4864:20::d49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ggbL4fM4zDqT7
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 00:42:14 +1000 (AEST)
Received: by mail-io1-xd49.google.com with SMTP id s184so7841637iod.23
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hGzgN49n7uFe23dGriYnes1KlLm6j27b0lKBjr/kq3M=;
 b=MZ/eks2275L56WZJH7tL8kyTNH/kcDQ+PNEzpJmODGk1StfNXB9vkKIkxyjQZgFvSz
 rfPeRjyvWz2J19lSZTilWEEdKj4uVE6DYVy0KUfMqxyRUlDuDJpIrCcbKqxl0e5j0L3v
 Og/+XQsFZ98tnsNqE/upnEfZZuYr7E1Ll8mWYF9o8m84JyLB9BDsmT0Hbmfx7BW01fxB
 CduJ3euN8WYRySI+0H4c9ktXfmmsrzlur6LE6Bo+B2SVAc1BGXQMSx+3XJ19Ln+5jxzB
 H1UGOz3Dm6bAtiIUy2TN/UvSYSoFDrSJr77lPIpDDv2o+TfjZ+pqpgjt1Smui0xTFD9J
 sG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hGzgN49n7uFe23dGriYnes1KlLm6j27b0lKBjr/kq3M=;
 b=QxIIE7hJqmEHfN7Ty3FH6VC6xpOgCRO5svFwHTenB6YEJaA3oNKg2Bi3+31c0wfZ1V
 mVdk36bxgpUBYSyewvMxZ4W4rcYmYTvLw5UXDopib6Pd/bxlzg+TIUBnUO7QUeIS8xJZ
 nrhJV3W8JNNYtRC7qq6YqtXGOnoXB0bMDZOoNXe6MZgyUbx6gPOmx/7WpPr17uIcIU8Y
 VL1TbKkGmc52pVXMqgyhY7QPRXL9jv/cbi9lpa/SHbe7AW4D1GtFJlc7U2m32J92C2Fd
 6CRb1q/wHHI9Swih5saTqjjFa49L6E4JzQmZOOkkqlWjBgZnWeXS1sXBNE25PSDhzz67
 Yzkw==
X-Gm-Message-State: APjAAAWZFHS+7BDs1BAveC/EypiA8S1h5MMYg5vK2FHbptu0GYz9LkCE
 IksIQzpBhJxVER19X2IhQqO6TKfRrqDK
X-Google-Smtp-Source: APXvYqzjBQeOncmQazMv/PN6aBlE+ZmIB00+rL3URfF5zfg/8ECet/uapGa+z3r8vh9Iv9ftcOzOrBfAyw+X
X-Received: by 2002:a24:434f:: with SMTP id s76mr3638901itb.8.1555080129955;
 Fri, 12 Apr 2019 07:42:09 -0700 (PDT)
Date: Fri, 12 Apr 2019 07:42:06 -0700
Message-Id: <20190412144206.68324-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0] ARM: dts: aspeed: zaius: add Infineon and Intersil
 regulators
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: Maxim Sloyko <maxims@google.com>, openbmc@lists.ozlabs.org, 
 Robert Lippert <rlippert@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2019 14:42:24 -0000

From: Maxim Sloyko <maxims@google.com>

Add the nodes for the ir38064 and isl68137 devices on the Zaius board.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 65 ++++++++++++++++++++--
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 0c0ea41cbe27..53751adebf17 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -301,6 +301,32 @@
 				reg = <0x54>;
 			};
 		};
+
+	};
+
+	vrm@64 {
+		compatible = "intersil,isl68137";
+		reg = <0x64>;
+	};
+
+	vrm@40 {
+		compatible = "intersil,isl68137";
+		reg = <0x40>;
+	};
+
+	vrm@60 {
+		compatible = "intersil,isl68137";
+		reg = <0x60>;
+	};
+
+	vrm@43 {
+		compatible = "infineon,ir38064";
+		reg = <0x43>;
+	};
+
+	vrm@41 {
+		compatible = "intersil,isl68137";
+		reg = <0x41>;
 	};
 
 	/* Master selector PCA9541A @70h (other master: CPU0)
@@ -316,18 +342,47 @@
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
 	/* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
 	/* CPU0 VR ISL68137 0.8V PMBUS @60h */
-	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
+	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
 	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
+	/* Master selector PCA9541A @70h (other master: CPU0)
+	 *   LM5066I PMBUS @10h
+	 */
+	/* 12V SMPS Q54SH12050NNDH @61h */
 };
 
 &i2c8 {
 	status = "okay";
 
-	/* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
-	/* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
-	/* CPU1 VR ISL68137 0.8V PMBUS @61h */
+	vrm@64 {
+		compatible = "intersil,isl68137";
+		reg = <0x64>;
+	};
+
+	vrm@40 {
+		compatible = "intersil,isl68137";
+		reg = <0x40>;
+	};
+
+	vrm@41 {
+		compatible = "intersil,isl68137";
+		reg = <0x41>;
+	};
+
+	vrm@42 {
+		compatible = "infineon,ir38064";
+		reg = <0x42>;
+	};
+
+	vrm@60 {
+		compatible = "intersil,isl68137";
+		reg = <0x60>;
+	};
+
+	/* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @64h */
+	/* CPU1 VR ISL68137 1.2V CH03 PMBUS @40h */
+	/* CPU1 VR ISL68137 1.2V CH47 PMBUS @41h */
 	/* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
-	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
+	/* CPU1 VR ISL68137 0.8V PMBUS @60h */
 };
 
 
-- 
2.21.0.392.gf8f6787159e-goog
