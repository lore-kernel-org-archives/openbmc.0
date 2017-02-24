Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vV1112VJtzDqGl
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 17:10:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A50WIGrA"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id p185so583046pfb.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 22:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=pqTBYgBa3OHv8FspNCPcL2D8mdXuZuLxITAR9z/YkmU=;
 b=A50WIGrACjLuOtlT/yFbbR7I/8RPiopuaBkYJ/4IPHaOZ4cWI+5zQgc/AwIrSlMItJ
 irUUlAYBHjI8NBmBadTOEG9S9U2OGSYqtAt05b3WQuwrlj5borYlPybOtKfY4nEZtTyM
 Zk4RVr/Ti11edptgoeMNAKR+mdHeLKfpVpwMY4S5KqO8hJshs2GLBZ5whlJAIse6DP0M
 zUbSGDs30N9F9Kp3t2WLXPi+YwTdX8xkbq7fxf0e9pCrNg8H0vf+Yvb3vqg4zSuLTEvP
 alyjxqhOVjfp7cqj5o4od6Uqjk/uhk2BRY49/347mlhYvjMpw3+SolyyrzShadULyfm8
 VVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=pqTBYgBa3OHv8FspNCPcL2D8mdXuZuLxITAR9z/YkmU=;
 b=m9I4/IcZYqqVtlbsRZHr8CA8BdllpMJFJ9OWZGsCPDlTvVJk1kwiOg6xG2HYLRen7p
 4hsRCYeiHIrwCrUXwJzlwnGDJtziSP2p61pqfXoxlxBiVrElTyniNAb/pnGYGeVMeUsv
 Up+RWhCubMAP96dMHhYj8C80EOaHpKXUGXIZkKjG1NN2ASmlsRKv/NdfutsAY0sHoKA4
 vYn4Z/v5dToY0bSvKbIQLMGtAEm3OUbsm32FQfeqfhBZRVLI5szYs6V0qlg3p/sPScnM
 UwVtj5EYOwniNLRRN5HBngypsfKv8PYI16oLTKEk/U7PlMmK57ZIggfi+N1ftS8qdQ3u
 2c8g==
X-Gm-Message-State: AMke39kT3HF+pkVpxYhEixpFGuBGG/grn6nF3NpmiRsGrSSlFAZl49z1GyVNWvuVPlvJCQ==
X-Received: by 10.98.12.77 with SMTP id u74mr1430173pfi.116.1487916610964;
 Thu, 23 Feb 2017 22:10:10 -0800 (PST)
Received: from aurora.jms.id.au (103-232-208-193.nat.sa.cust.uniti.network.
 [103.232.208.193])
 by smtp.gmail.com with ESMTPSA id h14sm12960799pgn.41.2017.02.23.22.10.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 23 Feb 2017 22:10:10 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 24 Feb 2017 16:40:02 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: "Edward A . James" <eajames@linux.vnet.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, Xo Wang <xow@google.com>
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: Enable FSI for P9 systems
Date: Fri, 24 Feb 2017 16:40:00 +1030
Message-Id: <20170224061000.7066-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 24 Feb 2017 06:10:14 -0000

The kernel driver is now stable enough to boot the host CPUs in P9
machines.

Note that this grabs control of the FSI mux, so to peform external FSI
operations eg. to use a Cronus box, the driver must be unbound:

 echo 1 > /sys/bus/platform/drivers/fsi-master-gpio/unbind

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index bef3afa24623..39c0b8f5fb83 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -34,7 +34,7 @@
 	fsi-master {
 		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
 
-		status = "disabled";
+		status = "okay";
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 0769507f1126..4d26d4702a34 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -50,7 +50,7 @@
 	fsi-master {
 		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
 
-		status = "disabled";
+		status = "okay";
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index c2af9ffa89bf..548ef1e939fe 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -78,7 +78,7 @@
 	fsi-master {
 		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
 
-		status = "disabled";
+		status = "okay";
 
 		clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
-- 
2.11.0
