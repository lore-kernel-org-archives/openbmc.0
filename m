Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdJC562KVzDqn6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 18:59:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bv8kPVyS"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id p14so3030774pgd.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=D/Nc90edhh+Ra5PQ+VCAfUHqhVzNwhso6CZWRJPfFGU=;
 b=Bv8kPVySHmjmW6EpWxksQVvfjlrRpj/P/z8iddHDj6kwWmxIPvIcQr9Di33qROof1U
 0icKPnnQXDcEcYSZlR3u8qNs95VnqQ4FKM2w4MCx7rzNsQJ98zz0UVfGMiHzA1LPjMIJ
 itvg9tbpr6EBjQ/PcSJrJ05eRHOSWbPs/JrvK4GPKEnZjDIXq8+s1158DwF1UFjot8+T
 hO7bXB1DNk7+D4z7067CMWcnLV1Dx3FH0X5OwPG/vu0NggS/j4S5pKvmrLz0F2m0yX/d
 fQPEC2bUt2zzosLhl0quB1p9ws5fqyAKxVY+V1P3z/QmETImu6hPnyQq8zmJL8OEEqnc
 30AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=D/Nc90edhh+Ra5PQ+VCAfUHqhVzNwhso6CZWRJPfFGU=;
 b=PzIWt6ftH/JbauokalhLIFaxqOX5IxXixukYy00PxesGcPTSUq223pMr8WpK5JG/i5
 6uL2lrWvZ4AS4WknfRNigNh8mf80JCiIoq/usEOB89HGxnDDRcdMwlTSXY0bUXmDKEK0
 qcnEyVr6HIxLPTUWUun0b8nxaWBNKUcOMB7vZ4wxXeROHYR77oO9H/gbiNpD/BtZqPtR
 MxNca5a+T1gP++lReqYWCNEQ3EbENYYnDqWSWLOUvIkv1+LeXACfY9N4XO/itMkI3HR4
 z4YpnEaT76khvuHUxEGk11Wcs8gJP0ODxsuUr6il9U8KuKToKNqrUS+3ukkQLEZmp2s4
 XyCA==
X-Gm-Message-State: AHYfb5iwlNHKMje4f17zDRKD7Jj2Zkp5LB3SMHxn0Emb5XJ5UQ88bzA2
 2B20W3fjHPtP3bMdAKk=
X-Received: by 10.99.115.30 with SMTP id o30mr5751471pgc.359.1503565183541;
 Thu, 24 Aug 2017 01:59:43 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id o18sm7631072pgd.51.2017.08.24.01.59.42
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 24 Aug 2017 01:59:42 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Assign vuart to serial5
Date: Thu, 24 Aug 2017 16:56:32 +0800
Message-Id: <1503564992-11194-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Thu, 24 Aug 2017 08:59:46 -0000

vuart may be initialized earlier than uart1 and occupies ttyS0, and
causes uart1 to be ttyS1, while uart1 is expected to be ttyS0.
Add alias of serial5 for vuart, so it is guaranteed to be ttyS5 and does
not conflict with other uarts.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 1525932..a83b6a8 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -38,6 +38,7 @@
 		serial2 = &uart3;
 		serial3 = &uart4;
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	clocks {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 72b6638..cdea4f4 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -38,6 +38,7 @@
 		serial2 = &uart3;
 		serial3 = &uart4;
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	ahb {
-- 
1.9.1
