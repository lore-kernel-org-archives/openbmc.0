Return-Path: <xow@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x63Gs1tkJzDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 10:43:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="O+YLKTXY"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id e7so58013818pfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 17:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAlfNLSSEOZc4A6KXn9n/VWj8uf/TujQu+YEyX35xxY=;
 b=O+YLKTXY/1oaDDTXiQfygQEOKDWept9z+TJ1Oo5w9pq8/wMOhNXWwtQ8KxSnM4ucw9
 txUOO//D/1l13C4FhFtF7Da+ZgfN0FgkSnn76S2rC/UB6W7m44XilLsA2LRbABAqtAzj
 zbXau/zd36YqZBDp5H/J7V56fdnII0s6VSo0Bc5HVvsAxfZZAGc3HJNennRCSQONwnAu
 rFqZWotVMKT6DGIup4ikZOJzWtt+76mRwMoYav/FLuElJoQMTU3fOa96EnswoKQ0TPCM
 MrB0wHP4eDdTtN8BmjnitvV1GDhNHHtt0eKurTqY4woXGpQkIfYXWfrxTKB7vECi2vij
 wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAlfNLSSEOZc4A6KXn9n/VWj8uf/TujQu+YEyX35xxY=;
 b=Q9eeNoN8HDOyhiOaSN+Ramuik2DVLKVZsI52pwgZUuSEEcKsqJBBHI9+HS7uqeGs6g
 f1iqnFYo7mOD2s/RQD6tNAd+VmkL927bkWCi2MKC3QcX0aAFMvyWbxMCBzTC8JfIdE6g
 NByzWUzHSMCAA4gPMTvAR42jI3TMbDC1t/bhIDvu7BrT0ISbZWzNpwBmYcAeupzUfL5H
 UOTv4xvmgVj7X7+ECe/2H1XHXtLHMLgf48qPlhkTRsd2OQXcnqRRrgtddiQ7Iw9PkzMl
 79fPv2pexZUWhV2mg1NuQB2utw4yciSGf7jXXuLQxWp7/K3rqbQIWIAqXSToLf1IYPrI
 obXQ==
X-Gm-Message-State: AIVw1139XkawRNKmDiDro1d0D6O3Af9h79So9raJVEiJQkEF+PMlj99Z
 k3Pjq8FBBsKih+3PtJj82Q==
X-Received: by 10.99.60.68 with SMTP id i4mr17358713pgn.250.1499733811218;
 Mon, 10 Jul 2017 17:43:31 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id k194sm21956146pgc.31.2017.07.10.17.43.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Jul 2017 17:43:30 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 4/4] Add Infineon and Intersil regulators to the device
 tree
Date: Mon, 10 Jul 2017 17:43:01 -0700
Message-Id: <20170711004301.10515-5-xow@google.com>
X-Mailer: git-send-email 2.13.2.725.g09c95d1e9-goog
In-Reply-To: <20170711004301.10515-1-xow@google.com>
References: <20170711004301.10515-1-xow@google.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 00:43:33 -0000

From: Maxim Sloyko <maxims@google.com>

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Robert Lippert <rlippert@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 61 +++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index c6200153a065..bffc0d0a2516 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -274,6 +274,32 @@
 				reg = <0x10>;
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
@@ -289,18 +315,43 @@
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
 	/* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
 	/* CPU0 VR ISL68137 0.8V PMBUS @60h */
-	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
+	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
 	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
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
2.13.2.725.g09c95d1e9-goog
