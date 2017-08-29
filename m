Return-Path: <xow@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhhQn3c45zDqMM
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 07:21:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hxI8HCWg"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id r62so13654858pfj.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3F94VPxALuJJiiDT1fEXGiS2dfya392cnISXh4pshr4=;
 b=hxI8HCWg9mn6vX3r0LdYcoJ2SWY8NVuKzOL1AyaVGeSsaGnemzzwcvWeL+F71wtkTj
 EuHk5PNrvhDOo8WCXklyym01FFF8bLCUDVG32HsQj+hJw0Be1usvZLsGYyGRyPON3qiD
 3EdXMW3SGz63xKEbPu9a883pKcBKKWWdrvit5TKo1DkzIZ62u10MHlR2gVHnYeuGSyzQ
 S5/FQx3iuL9m2WfPYrAM15q+KOC83fMRLeJg1+7zlYsOqqu13RHh8z1utYxDHQcxhGAq
 ayOjg1sWpWgIpt5AdshlvtGwVliYPWEdx20Os3HmC+yq8409t+BUxHMqPYBYXWAEXNW7
 HRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3F94VPxALuJJiiDT1fEXGiS2dfya392cnISXh4pshr4=;
 b=FGGWx8mlwwxW46dwzOq0jjz9bzt6AfxkhtdOktr5P8/QEp+yE5tV5BmH48/og4wHD3
 2MNotvbdplUd9mjnEM7nQ/IXmxs7OKbEZl96PBhE+baNOT/0YYMvhy7xVysoym8hmPoS
 frn4Gc26pW3DbXhK+sV+92H6ppGxLNXBOT8+21iLi112RNm4OiGLEGEJIT/M3ENCGNa4
 tx9x8nrwGydn01BnuRDSPZ+zVmJkG94fF+qCihyFEk38TJy69ucN/ATBgsyJ8tUuh9nT
 sCve5QuGhHbVJWHTw4DHVBGzxIpxAuYB3/Xo8v6gvpQRcnT5WXWmO7oDXWYNMpA+ZpQN
 CWPQ==
X-Gm-Message-State: AHYfb5iY4IPylnDPt3Efpw8gCl+uPiN9tSmvcUuz1Z/nUKNSBzpL6RzS
 hIuXh6wklng/Pflg
X-Google-Smtp-Source: ADKCNb7TCb2LyftN+hpGwti8/3QwyGhUgekfrQnzuuD5mnB8b4D488lAnLbO/tZLtlBE0ne5ePqXZA==
X-Received: by 10.101.77.6 with SMTP id i6mr1597402pgt.129.1504041695279;
 Tue, 29 Aug 2017 14:21:35 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id s77sm5558445pfa.163.2017.08.29.14.21.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Aug 2017 14:21:34 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Xo Wang <xow@google.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] hwmon: (pmbus/lm25066) Add support for TI LM5066I
Date: Tue, 29 Aug 2017 14:21:17 -0700
Message-Id: <20170829212117.143441-3-xow@google.com>
X-Mailer: git-send-email 2.14.1.342.g6490525c54-goog
In-Reply-To: <20170829212117.143441-1-xow@google.com>
References: <20170829212117.143441-1-xow@google.com>
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:38 -0000

The TI LM5066I hotswap controller is a more accurate version of the
LM5066 device already supported. It has different measurement conversion
coefficients than the LM5066, so it needs to be recognized as a
different device.

Signed-off-by: Xo Wang <xow@google.com>
---
 Documentation/hwmon/lm25066   |  9 +++++++--
 drivers/hwmon/pmbus/lm25066.c | 41 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/lm25066 b/Documentation/hwmon/lm25066
index 2cb20ebb234d..3fa6bf820c88 100644
--- a/Documentation/hwmon/lm25066
+++ b/Documentation/hwmon/lm25066
@@ -29,6 +29,11 @@ Supported chips:
     Addresses scanned: -
     Datasheet:
 	http://www.national.com/pf/LM/LM5066.html
+  * Texas Instruments LM5066I
+    Prefix: 'lm5066i'
+    Addresses scanned: -
+	Datasheet:
+    http://www.ti.com/product/LM5066I
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
@@ -37,8 +42,8 @@ Description
 -----------
 
 This driver supports hardware monitoring for National Semiconductor / TI LM25056,
-LM25063, LM25066, LM5064, and LM5066 Power Management, Monitoring, Control, and
-Protection ICs.
+LM25063, LM25066, LM5064, and LM5066/LM5066I Power Management, Monitoring,
+Control, and Protection ICs.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus for details on PMBus client drivers.
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 232b4af13e12..10d17fb8f283 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -28,7 +28,7 @@
 #include <linux/i2c.h>
 #include "pmbus.h"
 
-enum chips { lm25056, lm25063, lm25066, lm5064, lm5066 };
+enum chips { lm25056, lm25063, lm25066, lm5064, lm5066, lm5066i };
 
 #define LM25066_READ_VAUX		0xd0
 #define LM25066_MFR_READ_IIN		0xd1
@@ -65,7 +65,7 @@ struct __coeff {
 #define PSC_CURRENT_IN_L	(PSC_NUM_CLASSES)
 #define PSC_POWER_L		(PSC_NUM_CLASSES + 1)
 
-static struct __coeff lm25066_coeff[5][PSC_NUM_CLASSES + 2] = {
+static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
 	[lm25056] = {
 		[PSC_VOLTAGE_IN] = {
 			.m = 16296,
@@ -210,6 +210,41 @@ static struct __coeff lm25066_coeff[5][PSC_NUM_CLASSES + 2] = {
 			.m = 16,
 		},
 	},
+	[lm5066i] = {
+		[PSC_VOLTAGE_IN] = {
+			.m = 4617,
+			.b = -140,
+			.R = -2,
+		},
+		[PSC_VOLTAGE_OUT] = {
+			.m = 4602,
+			.b = 500,
+			.R = -2,
+		},
+		[PSC_CURRENT_IN] = {
+			.m = 15076,
+			.b = -504,
+			.R = -2,
+		},
+		[PSC_CURRENT_IN_L] = {
+			.m = 7645,
+			.b = 100,
+			.R = -2,
+		},
+		[PSC_POWER] = {
+			.m = 1701,
+			.b = -4000,
+			.R = -3,
+		},
+		[PSC_POWER_L] = {
+			.m = 861,
+			.b = -965,
+			.R = -3,
+		},
+		[PSC_TEMPERATURE] = {
+			.m = 16,
+		},
+	},
 };
 
 struct lm25066_data {
@@ -250,6 +285,7 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
 			ret = DIV_ROUND_CLOSEST(ret * 70, 453);
 			break;
 		case lm5066:
+		case lm5066i:
 			/* VIN: 2.18 mV VAUX: 725 uV LSB */
 			ret = DIV_ROUND_CLOSEST(ret * 725, 2180);
 			break;
@@ -511,6 +547,7 @@ static const struct i2c_device_id lm25066_id[] = {
 	{"lm25066", lm25066},
 	{"lm5064", lm5064},
 	{"lm5066", lm5066},
+	{"lm5066i", lm5066i},
 	{ }
 };
 
-- 
2.14.1.342.g6490525c54-goog
