Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hX3Ok4ta"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LYPC4TTgzDrJw
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 16:03:11 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id 91-v6so595010pld.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HEVZcxZFmA3lcIramUj+OKiGHsAP5DSkhyDJ9VS1oVU=;
 b=hX3Ok4tamLt2b/vg8ejTgBwdxuIwiTDnxGjoDMIVALUowI69U7rt4efNozG4PxPtc6
 sIFtIwU2RHgi+gw0gWPzrnnAuLnTp5DHgW5cFW2JQWTOZcqro4Cg68LQT+SkYisg3qRh
 kkzwfF90wqoJszYiEiS/kRZsYeXOq/LvOxkMuuErw8nm8zGwBOvMZSKqGV3tjHanyQol
 CUIY/8dIslZwf2U+ajKZCUvEFeYO3X5G62hPPoNMjo+7mT9R64YLxyRT/bcHkzW0vxdO
 tlRt3+X2WbRJ5NqxMgT8fyK1JJTZhf42ErofU1sK+SIXhWuLA9Y+jJ2J9HIOOXPDZZ1j
 tGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HEVZcxZFmA3lcIramUj+OKiGHsAP5DSkhyDJ9VS1oVU=;
 b=MyqgTgePhTY5qcP6mpXBvVgChr0etciICGaLlkDsWOPWBi9bR4UgyZ02YfsMDEDBpG
 enBLprF+spIVIQYODwf2vYqZV7ggioInn5eorNIo2U8AyDwJDyE+tq/CGE3tozowy6DA
 UlcB+7enl9Jrb2BFR4Z6yIOmYqOxAiyR4f1k6tS7bddTWrmnPl8fLe3ddpvWa3SYSZrq
 kjj00zTqSGrmp+VFZTyYJICu+5FsZvKWbpb5/LrDUuDkSsNjkNqsVyndFgqEixPBXRCv
 KVAi+76odyAESljGdMx9a7h5OLn81naWg3mUQ/nLHYORXyxn+vL+kY6svkzYruH0kQfl
 F5Tw==
X-Gm-Message-State: ALQs6tCDaCmTx+p7yHyiLZyafLKAK1KBLdxDjyVlc+kLl2ywJ+QgMoSD
 y+bvUJjmF7UV57jw+hMQbvEtisdz
X-Google-Smtp-Source: AIpwx4+SXBVCYGEs1jndnJvvTcWmnqMMMagzw9EPZSjahX+JIqjTNz+ItubBNNH9I+8V4uV4WaVFXA==
X-Received: by 2002:a17:902:36a:: with SMTP id
 97-v6mr3586607pld.186.1523426589382; 
 Tue, 10 Apr 2018 23:03:09 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id a6sm933229pfi.12.2018.04.10.23.03.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Apr 2018 23:03:07 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] ARM: dts: aspeed: romulus: Add id-button gpio
 key
Date: Wed, 11 Apr 2018 14:02:43 +0800
Message-Id: <1523426563-33439-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2018 06:03:12 -0000

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 4039381..00812a2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -68,6 +68,12 @@
 			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(J, 2)>;
 		};
+
+		id-button {
+			label = "id-button";
+			gpios = <&gpio ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Q, 7)>;
+		};
 	};
 };
 
-- 
2.7.4
