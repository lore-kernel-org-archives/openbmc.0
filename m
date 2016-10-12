Return-Path: <xow@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTT81VLRzDrLv
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:45:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=HVo6M07b; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id r16so1288568pfg.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uoqFhyJmrwkdWXPa4uIHnjYWKmPjAw0KisH7Gk0JkCA=;
 b=HVo6M07bcVsyxq6XC19gPxvWd7wfxuV3/7qpxoRzoyWCeiAJBH6UURPmvAA50tCfbf
 Wx8JM9Jeg3NQZz1dvOl16loMMEeaupGEbdNCw/hdxBpPR6erJXfmviNy2fTYZ9RJPP9U
 yMDsv0pDqf7k1DAEjIIN+Qf95r+K5APj4RgrQHswE62VzLtIHn70zldOKbN+z7hydUo+
 XfLBXpGakP89UjuQIWPii/703294//hsgCgZEeetlij4zy4Xr7X4YmtxTM+i3Q0dT5PL
 ph7aAktHyszUbR7Uv0uQXzJB7JFjgXY1MFwoPX1Wxfhrqq69c78kKpNKOOfaRXrXp9EP
 nxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoqFhyJmrwkdWXPa4uIHnjYWKmPjAw0KisH7Gk0JkCA=;
 b=dY6P75PQkqfyK3kd+STOG7FWqrLgZNFHIMtpfRwB0KEjt27jV7ZETAtbiXeTcR/fDu
 qpzvZnapFN/YbMLJIJYEyDWaXHxxOC4ptifuWfvO7ZxX/Vz/6SCRSOtMLTmNIp0fV/47
 VeA83ZTM3lTUrdB+I030ED+5d3uacBlms00jyJEkmsegu+DK9Q6nmwXX4Pxwks9kfIku
 U8fFhb78Jsy81zwvSvzRItwdBZ378X7bgBwshRBhhsSRLEG1nQNuOCi0FC0+WXEcOru1
 7UiopNHjtNgTVIBmpHNiN6BSqnKwJz9HpQKoSFVLbss7A5Oaq8XKH8WDmdAFeAabhnIu
 FK6A==
X-Gm-Message-State: AA6/9RkUM2EotLfvhq0wxRPkC/zZlCF+EQUqzzS8sMrWmSAzMBTbWjQNXV8nQuL+kgpklWhH
X-Received: by 10.98.206.1 with SMTP id y1mr5309969pfg.70.1476312298261;
 Wed, 12 Oct 2016 15:44:58 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id z6sm14170700pay.31.2016.10.12.15.44.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:44:57 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/5] ARM: dts: aspeed: zaius: Add static GPIO config
Date: Wed, 12 Oct 2016 15:44:46 -0700
Message-Id: <1476312288-100725-3-git-send-email-xow@google.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:45:00 -0000

Add GPIO hogs that turn on I2C muxes and I2C level shifter.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 541455f..cc2e84b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
 	model = "Zaius BMC";
@@ -205,6 +206,29 @@
 	 */
 };
 
+&gpio {
+	line_iso_u146_en {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "iso_u164_en";
+	};
+
+	line_bmc_i2c2_sw_rst_n {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc_i2c2_sw_rst_n";
+	};
+
+	line_bmc_i2c5_sw_rst_n {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc_i2c5_sw_rst_n";
+	};
+};
+
 &vuart {
 	status = "okay";
 };
-- 
2.8.0.rc3.226.g39d4020
