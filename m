Return-Path: <xow@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyqvX3vzQzDqL4
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 11:46:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I8pOcHI6"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id 127so55394671pfg.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 16:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1NKnde0AwZNdvxJUp3lxOI8n8RlJQ3cq9tTxNjaYGQ=;
 b=I8pOcHI6WUfRzNQsUE6dmqrsb/mv6XIRLP5iOyQuRFP1gkZNlcJOHUT+ik07+E4ste
 GhCplKe2wDEuJxsUx2GnIUCSocqVRhj4bCjYP1gBZkwevRf8jy5pfvzMqsfT3SH644nQ
 uDqXdmNMS7PYjdoCH9tDg7yFdMS+WiEWCDF1WShZ9J/xKU8TbFBusMaAMRyur1XyS4ji
 exxjJJ6BvoaQpWTITjA288ObIae8ZGwlk/g0xUfY5AmSwXkloLc/RG55A38GTupZrOip
 y2LoMGSlQEkzVZAyUPACs8FvAYeDvf3fQ98wwl8JjkskeAKtglwOSjYzwU63MIKEg9I2
 JIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1NKnde0AwZNdvxJUp3lxOI8n8RlJQ3cq9tTxNjaYGQ=;
 b=cus645I1wxESwbhpTd0SQWzQPzKXdu0EiH42Wdljju0ZZFy0piX/ouCDdQ+m6d99Zo
 BwoFaLN9qf8IhipP81kmaENZwSlDclILhilbOU+lPBK7Fj3Gz4mUIopyinEmvhpmVcrX
 A2TAPYsmQ09jS02ccw/FcrdiaKvctUgUIpd92OaFVkzC8PNbMfeRY9+5PnnnTNLaiUTx
 SCe2A4oO7sLjjpD4REB9FKlN+iKTlvsJm8jkU0IYsOSsJ8noClKgvXH3ve+5lMBYBbfs
 3lFoshqeV7OfmIhm0losvf+E2IzImf4poQEHozFcUzd355NvvHgc0tExwE1MtOk+iCFy
 yF8w==
X-Gm-Message-State: AIkVDXJlMNSZe6ssfDOL3NPRjeMYZfZ0bKus4Te8fc/jxJngj17sDUbMIDGQzofbOswvFmVI
X-Received: by 10.98.153.155 with SMTP id t27mr7137705pfk.48.1484095574080;
 Tue, 10 Jan 2017 16:46:14 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id o126sm8463299pga.34.2017.01.10.16.46.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 16:46:13 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed: zaius: Enable UART1
Date: Tue, 10 Jan 2017 16:46:10 -0800
Message-Id: <20170111004610.9725-1-xow@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
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
X-List-Received-Date: Wed, 11 Jan 2017 00:46:17 -0000

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 0adf6e7e284c..7f9aab901df9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -98,6 +98,13 @@
 	};
 };
 
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.11.0.390.gc69c2f50cf-goog
