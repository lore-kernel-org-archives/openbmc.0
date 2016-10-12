Return-Path: <xow@google.com>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTT91l79zDrLv
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:45:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=dPA9Zyys; 
 dkim-atps=neutral
Received: by mail-pa0-x22c.google.com with SMTP id qn10so32166690pac.2
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6fS/cFmHAM3KPOC6yCMT/ZiSs8yCHF/Vacago2Y9vs=;
 b=dPA9Zyysbe2sfu89LwWv3/xr6ZQIheI+Jijxr2X8zM2VA4T11zGytRRtoRGURG9VDv
 PMignEz21hok9hpxXAs4r921nyZNb8ydBKD9aGHSvB1FxL20AYfgq9O2x9ulgJmAhLZr
 1OHF+ztdT/QboxQ6LMGrXq0kgP6FJ+AtT3hrAAMBBsWML0VXRY+3/KEIo6jIp69SJXXS
 +1qR72PpnlUaX3lxXuWytaMVWzefTC4YKn7EEt2RGiy/hcqmMGPtaU2wJioWNJpuEGAp
 RVtWctrsRBsOcOvhVa5/WmGsm5u6LJAaKwg6Apyao/F3k2qO9ceoyAEqxISmVcTYioPS
 v0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6fS/cFmHAM3KPOC6yCMT/ZiSs8yCHF/Vacago2Y9vs=;
 b=dSg5k3qkSHVjdYJG2c5QwouA5Mykpbw3G7c6JCZw5aD+TVJ70hhsSoQ4Jof5/gr3r0
 9V5IozyLAQZzRJFV/Q7exadiOeAqBk5Kp4NmPPPYDheLCHIIjVwGNSfkbsdsn/KnSBxr
 +kIryDBnKGaFuX+HnFHsYkqQpFkfH2Lzgs9BerdhkDH8xHnuWR8J/kJ8BZKxWWV2x8SF
 J8dGkkwSUrSBqqF8GPU/SP49TaxjudtpSCLeO4C0e6ZPI3KzXPTiKATEQTHV4hwcNU1R
 zASmTx+69wW0T4JQ/Yaia35mEreO+5dI0NIraadwKx/Gw4HACvEnzPtYz28z1eH3XwMz
 Megg==
X-Gm-Message-State: AA6/9RmAhafaNi5EtNMBsDnXvb7ljTDmuDga/BYkgBiaPACcirp+h+FxDWNvPBlba76oDUpq
X-Received: by 10.66.84.132 with SMTP id z4mr4478818pay.108.1476312299071;
 Wed, 12 Oct 2016 15:44:59 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id z6sm14170700pay.31.2016.10.12.15.44.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:44:58 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 4/5] ARM: dts: aspeed: zaius: Use I2C buses and muxes
Date: Wed, 12 Oct 2016 15:44:47 -0700
Message-Id: <1476312288-100725-4-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476312288-100725-1-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 12 Oct 2016 22:45:01 -0000

Enable I2C buses on Zaius that have devices attached and add bindings
for muxed I2C buses.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index cc2e84b..8c3912a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -102,7 +102,14 @@
 };
 
 &i2c1 {
-	status = "disabled";
+	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 
 	/* MUX1 PCA9546A @71h
 	 *   PCIe 0
@@ -125,7 +132,14 @@
 };
 
 &i2c4 {
-	status = "disabled";
+	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 
 	/* MUX1 PCA9546A @71h
 	 *   PCIe 3
@@ -153,7 +167,7 @@
 };
 
 &i2c7 {
-	status = "disabled";
+	status = "okay";
 
 	/* MUX PCA9541A (other master: CPU0 PCIe 1)
 	 *   ADM1272 PMBUS @10h
@@ -167,7 +181,7 @@
 };
 
 &i2c8 {
-	status = "disabled";
+	status = "okay";
 
 	/* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
 	/* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
-- 
2.8.0.rc3.226.g39d4020
