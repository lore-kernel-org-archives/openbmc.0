Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LwqmAacr"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVV3g42HyzDr5M
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 00:00:15 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id s9so4389045pgq.13
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oUbdHobGQ+lUUH2vgawsx75Zv7l7k2rQzAWDS2n9diI=;
 b=LwqmAacrw7Gdk9VSDzXd0fYOhuiYgqeydP93BkdtP7aiJx55v+GDh0S/WNH2gxHR+G
 9Siw+24moHE5mtcF2ARIdIeGZxp+4N3U5ExpAcdIZt7cx1x9Kyyg/K5TnMp1bENlt/u8
 13VrnaPD80UfBLDknOkAs1xvYBwPLf/+8n2fJTKTR5tYCCiAYvkWTOtS16xdLmwk/oT8
 M4Y02MGctR/t7AGkBpymuBFcQ+v6r9iy7wA8+l3llgzivLSf4e9onipEEFMEFpVfFTlt
 cSP5XEdgVwKdWgjpHXjvXPsaA0j+yqT70E/YEfmzXr9mVY4LV4ynqJiZWL0wvfocj4Dm
 14UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=oUbdHobGQ+lUUH2vgawsx75Zv7l7k2rQzAWDS2n9diI=;
 b=eBnjmln4Yzh62015lfhrDhMwXcmkn84oiVG7nZxLmp1IIjGRGcBnvFxVn83OgyQfLh
 3Uo/sAplP6Fj7cT9LlDM0vGgWOOYAMLKJ3l5UGFALJ38z3Nc1hVvnulxcDcuQsk9/f+Z
 p8r2B/OsB8D/oQV38U6qw0jDcKE4/vkxAHxZXiIfB9xwcoYWPLCocvgI8g1/aO8/+2lb
 D2dGLzrb+w6zRsMUsQZgeCJLxV4xoFlYdW01JVsqociduM0veKlDmBcUKqXQHsofAyNU
 JjL/6eOC1j3QlUlwKK+ePT3IGOjloFw7bIhphbIlAxsOOZvXzfW5JeC/0QLlKn9l6Gr4
 bDsQ==
X-Gm-Message-State: AKwxytfpJDTvxLoosYIkcQ+08c0SQ08Ed4hSyz5rcwfGMRZiniFmjZST
 vWiz7TH4CND5Gi/FG8T+ISvohZzg
X-Google-Smtp-Source: AH8x22727cgh1BJVnawj9BrbghtOAErHo6Chml21ZmW14oAzVdh0X1fPMfyy9FpOJROy6/QB6GT0eA==
X-Received: by 10.98.161.16 with SMTP id b16mr27100146pff.34.1517230813352;
 Mon, 29 Jan 2018 05:00:13 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id h69sm31500393pfe.20.2018.01.29.05.00.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jan 2018 05:00:12 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 29 Jan 2018 23:30:07 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au
Subject: [PATCH linux dev-4.13 1/2] ARM: dts: aspeed: Add IPMI BT node
Date: Mon, 29 Jan 2018 23:29:58 +1030
Message-Id: <20180129125959.10499-2-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180129125959.10499-1-joel@jms.id.au>
References: <20180129125959.10499-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 13:00:17 -0000

The IPMI BT device part of the LPC interface and is used for
communication with the host processor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 9f2fe74a8e02..09a40bbab72c 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -246,6 +246,13 @@
 						reg = <0x20 0x24 0x48 0x8>;
 					};
 
+					ibt: ibt@140 {
+						compatible = "aspeed,ast2500-ibt-bmc";
+						reg = <0x140 0x18>;
+						interrupts = <8>;
+						status = "disabled";
+					};
+
 					mbox: mbox@180 {
 						compatible = "aspeed,ast2400-mbox";
 						reg = <0x180 0x5c>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 3dc37ec8801e..9101e8252a02 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -299,6 +299,13 @@
 						reg = <0x20 0x24 0x48 0x8>;
 					};
 
+					ibt: ibt@140 {
+						compatible = "aspeed,ast2400-ibt-bmc";
+						reg = <0x140 0x18>;
+						interrupts = <8>;
+						status = "disabled";
+					};
+
 					mbox: mbox@180 {
 						compatible = "aspeed,ast2500-mbox";
 						reg = <0x180 0x5c>;
-- 
2.15.1
