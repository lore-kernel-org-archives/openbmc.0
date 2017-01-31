Return-Path: <raltherr@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZmf6ZYpzDq99
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:39:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZcihHtZ7"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id f144so109639253pfa.2
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 10:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=PMi0WaSop2VPxjfxRaQxL6mGRTHCytaXRsmod8cU9BA=;
 b=ZcihHtZ7s3lsEsXxs7qt7imf5ngJC82lxYZdyFEEsCEIExnwD9qzs5hwFrVByQmL1v
 bVyQ4ohzg9VRr4naaOTqXzHyE7z8q6o0sQD6sYJ5VPchphrjNMCKCASTQOAO/i1A3e+E
 9L3F6gnbytebYZlTTLoVGWOrOprgadosQ4qypABS2Z6JclCX4ThnU2BJzg5hd+3XCyO9
 U/FSpZ8TPq/UaWvRyS5CTH2IF/WA90cXvU5p9ppvVkSQR91qQo5CFzAfJd9DXRpvyQor
 bnaBycEfu0eQp7gqZf1kUEQ1GWfsJBDRKhrp8kg0h5VAY6SrCi0DjCSZRp4FBN6Dn2YI
 G3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=PMi0WaSop2VPxjfxRaQxL6mGRTHCytaXRsmod8cU9BA=;
 b=RjB7upa9TTlFc+bplcctBQ4kGfKjrS9thh975hrQiZQozlvCKtkgddDQQPPmMEHbZJ
 jsPQqVglesv3AkCs7USKi/JTUEncVqUpoxr9V/OwhvK0PBfWBSfc5ZIaXyGGSefUefSC
 LkN3FP0Y9Fjx6y3yze0FKBqc5+dxLzp5av0FFqbZDxs5l3mGhufQtirWS6r0q9sZMn2O
 vAWRdTzLt/Me8eFpmSQJbX5wbW5HLND3IrZgpaS/5Us75N79/0ToQU1y2saJL8PSc7JK
 i/AcBQHfG/uq9yvFRNQFFBGi1dfYi/MP3LMWyHvW0YQpET9rTRO11G9WoBchhhS+v/vV
 t6pA==
X-Gm-Message-State: AIkVDXJv/BdfqeB+17OBgb232wy7f897pQToOcksc8lBQQ6f2i7CqXwvHHYVdjz8geXYc8/F
X-Received: by 10.99.98.132 with SMTP id w126mr32135965pgb.59.1485887968934;
 Tue, 31 Jan 2017 10:39:28 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id r21sm42901673pfd.95.2017.01.31.10.39.28
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Jan 2017 10:39:28 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] dts: aspeed: merge initrd into kernel in flash layout
Date: Tue, 31 Jan 2017 10:39:27 -0800
Message-Id: <20170131183927.30887-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Tue, 31 Jan 2017 18:39:31 -0000

openbmc/openbmc commit 1ed6fe335cda50cf60b7afddbe530077a1b25d27 includes
the initrd in the kernel image.  Update the flash layout used by OpenBMC
dts accordingly.  This is required for OpenBMC's kernel update mechanism
to work as the kernel image now exceeds the size of the original kernel
partition.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
index 65095a40a203..4bcfd1bf8dc5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
@@ -12,13 +12,9 @@
 					label = "u-boot-env";
 				};
 				kernel@80000 {
-					reg = < 0x80000 0x280000 >;
+					reg = < 0x80000 0x440000 >;
 					label = "kernel";
 				};
-				initramfs@300000 {
-					reg = < 0x300000 0x1c0000 >;
-					label = "initramfs";
-				};
 				rofs@0c0000 {
 					reg = < 0x4c0000 0x1740000 >;
 					label = "rofs";
-- 
2.11.0.483.g087da7b7c-goog
