Return-Path: <xow@google.com>
Received: from mail-pa0-x22f.google.com (mail-pa0-x22f.google.com
 [IPv6:2607:f8b0:400e:c03::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTT73RPnzDrLv
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=is/+Q98M; 
 dkim-atps=neutral
Received: by mail-pa0-x22f.google.com with SMTP id vu5so32257199pab.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIGN1nqBmjUWPn+4crUTmMHJqpS5Jr+3OtJFjNZmj5o=;
 b=is/+Q98MOQIkOO5OxmTOyClYhS2Z8WgT6AYZlo73cm44VXIZurMjJY5Epvqs9RSA+I
 qduG9b4PLhpoVtIhkEjjgpoG/c9HEYv/KtTnMJpBtVk4IMXzGQs7clXomRvrEedivQbF
 wshDFeYdABt1RWs5VNyI1inkvr2u+e/JE4KTBSHf0OEfOkwVL4ff9saPQpXDyduKCgGz
 ojoOWy9H//7h6U6CsybnG8aOXwn3ov3N5yna5He+e+lW03IPKTztnFwQUJfCjJjTAjwD
 hahlESVoISdfUHs8XUnBKedYmsNhwUyZ8EUhc4fLtyfW0AGXJa2EHKwmi7mfZzOpAZS7
 aijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIGN1nqBmjUWPn+4crUTmMHJqpS5Jr+3OtJFjNZmj5o=;
 b=MMrPIZtsfVk0FnQp0YpBnvO4YYLk9kqBZUZEfNiKRc90ynNjz8o8E2f2cN1CSvnpJm
 lr/cxWkUnxNsenh71DAoG+3jM6tEH5Fa0sAOk9+P6MQdU+okqbuLRmJVAXbdvVbIPxS2
 smH/gJe0U7zRQWoBZlnhxB7jDSPKeUgpc8j1l7bmFDhBdYPZjN3OQvqUqrhTJBbiIHdG
 Fr3WhZQePw/ocGb/XguCE9+Vqw9G9U/c6Eom8XOu6xGV5O6s5Hxna2B/PptFSCDzhMRg
 kAtsU3AgUidHG4u6PuGOV8bzhGnI4uLxp1TBSWHSJncXkR4AH26j9socytI9ZLRRBLRu
 rfqQ==
X-Gm-Message-State: AA6/9RlGzMiBrwGZzUbRQMjgxWFiJXJPDtrUWYeOmepcJX0teXezqYAnWB+/KF3026GoOA2M
X-Received: by 10.66.165.72 with SMTP id yw8mr4441034pab.128.1476312297376;
 Wed, 12 Oct 2016 15:44:57 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id z6sm14170700pay.31.2016.10.12.15.44.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:44:56 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/5] ARM: dts: aspeed: zaius: Fix pinctrl on MACs
Date: Wed, 12 Oct 2016 15:44:45 -0700
Message-Id: <1476312288-100725-2-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476312288-100725-1-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:44:59 -0000

Update the Zaius dts to reflect that MAC1 is intended for NCSI and MAC2
is connected to a BCM54612E gigabit PHY.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 4c4754b..541455f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -68,7 +68,7 @@
 	status = "okay";
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-0 = <&pinctrl_rmii1_default>;
 	use-ncsi;
 };
 
@@ -76,7 +76,7 @@
 	status = "okay";
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default>;
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
 
 &i2c0 {
-- 
2.8.0.rc3.226.g39d4020
