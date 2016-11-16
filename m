Return-Path: <xow@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK0pD1sJSzDvp6
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 10:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gA+WBnhH"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id x23so81413213pgx.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 15:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tq2t1+nfece5hijct3bHKk5FeUgLJ7BoGxf+Bt2G64U=;
 b=gA+WBnhHwejvjI8AetLcYz0PaL9olcQAQtMOHmA+HJZ7qSIJDuoNjsdPBbB7wSg2+S
 pn8JbY+zFkk+Zb9nxVKOD4O7WW2FKHYyfC8aV2QW9zv2j6KUqHC6oQmZX3fRo7PFueZO
 x1oQzRWIMSfv9Pq+YtdvEWnsjzTRNLLa3CwQtLFp36wwD3YkD9KvF4izRuHkKfQ5Ikr+
 zthj7kqCOjLXYUjypH/N7Wdls3XChFi63g9itaXxNuYwCC8oWENq5Ais+pgSSUVxYMJX
 77LDCwGHGqUp59fvYuWgxzCIPzuFPEfdQgEzpNzlLqHc7dC7W1McoO+9TZbpMsr3PHEk
 7RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tq2t1+nfece5hijct3bHKk5FeUgLJ7BoGxf+Bt2G64U=;
 b=ZNh40qYQkseSqQ5Qk36kyV+PpJOZdvn7MgDy40iJ2u8cbwDZTXE9b7XCAg3wpYfBpI
 uQd9nnUBMMTxAMjNQ9MB1dOTjbep/+obUWJ7TIR2pSXF//q9Fo0mDnrbj5InrpVR/uTt
 aV9AYzl0Soqr4v/F7HqjyrzH1wUko79yLsSNh9aKo4YHAmUyuGkhZ21rbvHsnAygMlux
 zV9HTGCrZlbFBF53eND8LypxHD+YfjDgSTI36meuuEmXeqP2SzT9Q+P43vIfnW96eMOG
 euCXwsIn0GJg1hFgLAJX0xsbKSOihz0NbG52fvOvuXTkjMSFjpyy52UShtLwC/4BpRf2
 HLTA==
X-Gm-Message-State: ABUngvemkCZnIfMModXWN2iWps7G3Y8F9SHekJKX0VfixYN2Ah2tY1LNkVW/LJAE79bCOYw4
X-Received: by 10.99.161.2 with SMTP id b2mr395188pgf.2.1479338961488;
 Wed, 16 Nov 2016 15:29:21 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id v77sm149381pfa.85.2016.11.16.15.29.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Nov 2016 15:29:21 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/2] ARM: dts: aspeed: zaius: Add I2C master selector
 and hotswap controller
Date: Wed, 16 Nov 2016 15:29:15 -0800
Message-Id: <1479338955-5248-2-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479338955-5248-1-git-send-email-xow@google.com>
References: <1479338955-5248-1-git-send-email-xow@google.com>
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
X-List-Received-Date: Wed, 16 Nov 2016 23:29:24 -0000

Add device-tree bindings to instantiate the PCA9541A I2C master
selector. This driver allows mastering downstream devices after sending
an arbitration request to the PCA9541A. Downstream devices go into the
'i2c-arb' child node.

Instantiate the HWMON client driver for the TI LM5066I hotswap
controller present on Zaius EVT2 downstream of the master selector.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 3d997d9..136eb1d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -210,8 +210,23 @@
 &i2c7 {
 	status = "okay";
 
-	/* MUX PCA9541A (other master: CPU0 PCIe 1)
-	 *   ADM1272 PMBUS @10h
+	pca9541a@70 {
+		compatible = "nxp,pca9541";
+		reg = <0x70>;
+
+		i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hotswap@10 {
+				compatible = "ti,lm5066";
+				reg = <0x10>;
+			};
+		};
+	};
+
+	/* Master selector PCA9541A @70h (other master: CPU0)
+	 *   LM5066I PMBUS @10h
 	 */
 	/* 12V SMPS Q54SH12050NNDH @61h */
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
-- 
2.8.0.rc3.226.g39d4020
