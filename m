Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFR8X0cnhzDvnN
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:02:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xm+vc/Cs"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n85so835740pfi.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 20:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=vPZvxjeOB9QPYcYK7i2xJBoIlfXIYZ4Wwx9BVow6eSM=;
 b=Xm+vc/CsvJX/aGkkC0fTMQoRVDobW+LCZ4y0gctq9VcQBXmZhx9T9xSHHRcf+Fto+Z
 OfLC5A9eSo1DHy/Bb2JmLRF2+TBX436oTB4w3VwwD7WwXzJzr0FFyFxvG39Yov5/McXA
 mPCsu+3P3oac8QGilah6mL3vo9Wzpw43AUfY9FCCT3xivcpa0t1kiyzXeV7E7Z+uMbjM
 4aQVrKAeu17jC3f4Jt7FAHLG9FFW4aWyatP9HMa98C7+1A4ntAUr/EmMdAJgAONYkON+
 dMF0xV36T2X8g8idceAbnB2KTViizaqNOV5yxvsxT4jZQcimQlJg86HJ1rEW7sP4Spde
 bQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=vPZvxjeOB9QPYcYK7i2xJBoIlfXIYZ4Wwx9BVow6eSM=;
 b=AKIurbqEw0qUDJOpsA5Z8o5MHd8MxKjLpgdyIZe1aQ1EpNb5uhxU69OfN/2LraRm7q
 sJKt6z+nY7mQ6b98XnvoJ2jtoAV4LhiIySM8RLiROa4TZLWBgLqTWBUarLE7l5KiFBgY
 8heZxdFcmstWwXGXelpECZ1oYSkKck1zwdtaOYYSWYY/ZGxA6h8DMeNyv58a4Udp+RyW
 xPbhuxLs39LZ/FvYiYP1GO3O/GRQKdw2bpooglE1my8yEUtr6F5jTQMI57L/LBYhSOkS
 Oe0rICjqsN5sZhO6ylycGX67rBrU79pnVv2wk92DlLvfOQelW+QhfEreipPFRYtN8HBj
 G5dw==
X-Gm-Message-State: ABUngvfDurHAiiINWzhf9eoHh3ACkED6KQxLfqt02GuAt4I9GpY6mGhZN9H40SMJ8t2N3Q==
X-Received: by 10.99.122.92 with SMTP id j28mr1222274pgn.64.1478836969803;
 Thu, 10 Nov 2016 20:02:49 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:a5bb:5ae1:e3b4:2a7])
 by smtp.gmail.com with ESMTPSA id w125sm10662643pfb.8.2016.11.10.20.02.46
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 10 Nov 2016 20:02:49 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 11 Nov 2016 14:32:41 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] arm: dts: Add pnor label for wspoon and romulus
Date: Fri, 11 Nov 2016 14:32:38 +1030
Message-Id: <20161111040238.5972-1-joel@jms.id.au>
X-Mailer: git-send-email 2.10.2
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
X-List-Received-Date: Fri, 11 Nov 2016 04:02:52 -0000

This is required by userspace (pflash) to identify the PNOR.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 4c4c547fe412..c23627ec5e84 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -40,6 +40,7 @@
 
 	flash@0 {
 		status = "okay";
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 7badbda288d3..75c6b68950f9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -40,6 +40,7 @@
 
 	flash@0 {
 		status = "okay";
+		label = "pnor";
 	};
 };
 
-- 
2.10.2
