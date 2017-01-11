Return-Path: <xow@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyqyp2dkNzDqLx
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 11:49:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qt/hbxM7"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id 189so43148379pfu.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 16:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJ9jWMfpWVrXOf2UjcoVSiL15rGLVOTBY6fzTfW7lsE=;
 b=Qt/hbxM7k4+aZmIJnfm/RKOuwr/1vhYG0QEMk0t9vlpZltZqJ+umPFYvne2a63vCml
 VjqbouAxKefQfQwWNX3KGnEf1s2FHkmKIZWhpAHkpEKhCH0fqvWakh21PGtrH7idqibC
 rR4oiEMEvbe2nlOn/J2wVAFUDcKLlzlNgdc0I1Ee9aM2rprhv5VB+xtqNSHl5eYsXZTg
 1RMKV8lDOb206othVeNg5r4ycZTfTWYADpVQaqodtOYGb1Zjmk2+Yva9q2rQw5B54+Rw
 N7ZNlegvUKQepwhm1lquzSjq1mM3bP/jYhifHzNC9YTzsrDjUzr2lkYVbnz3azzr13sm
 O8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJ9jWMfpWVrXOf2UjcoVSiL15rGLVOTBY6fzTfW7lsE=;
 b=gBZXUwSZFSsX6DYgkyGHNb+rqNCHQDHOWBg75LW8WD6yUkVPoVMlWGEPWy1JuG/Xux
 zL4YAllhb+JOPhF00Xf0PZy/0JI7nprFAUER4+V4zuWXaV4jvDUzPsPPt0VdRbpdwwst
 LBNZSCt0Mz0/ijYkV9fZ360EA3chLScawUk4dZJZRRbz6SfeAtV8Bz3A+6aFDG7a7ZnZ
 9P0fMPUo6wBKH5IrP81uPJszRuJIcoX2gwRr7q6kOw1clamdH//JlD4Y2fXc6RVJ6eTl
 ncHeIbVJpaBRptf6ruiqNXsh37IxBoMgLBI8PXWaseD7mKFdMUPbLCsGT+x5Swssu28P
 TBOw==
X-Gm-Message-State: AIkVDXKiuoFduY5wEfTtIkY+Cw6gOzBIYrks02QIW+NICf7JBi9/D5DWX9B9vYLwrfQxq0k1
X-Received: by 10.99.163.66 with SMTP id v2mr7340481pgn.15.1484095744206;
 Tue, 10 Jan 2017 16:49:04 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id e5sm8432530pfd.77.2017.01.10.16.49.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 16:49:03 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/2] ARM: dts: aspeed: zaius: Update EVT2 LED GPIOs
Date: Tue, 10 Jan 2017 16:48:58 -0800
Message-Id: <20170111004858.12031-2-xow@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170111004858.12031-1-xow@google.com>
References: <20170111004858.12031-1-xow@google.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 00:49:07 -0000

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 7f9aab901df9..d1efe6e6e57e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -45,22 +45,22 @@
 
 		sys_boot_status {
 			label = "System boot status";
-			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_LOW>;
 		};
 
 		attention {
 			label = "Attention";
-			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(D, 6) GPIO_ACTIVE_LOW>;
 		};
 
 		plt_fault {
 			label = "Platform fault";
-			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(D, 7) GPIO_ACTIVE_LOW>;
 		};
 
 		hdd_fault {
 			label = "Onboard drive fault";
-			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.11.0.390.gc69c2f50cf-goog
