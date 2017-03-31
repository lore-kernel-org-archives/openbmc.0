Return-Path: <xow@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvz2Z5WjqzDqGx
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 10:57:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pGEM47QK"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id x125so84284033pgb.0
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Z/rVbT24UV49iOkZeembiRz5FJ9EB4U3FMqiZHSegQ=;
 b=pGEM47QKbQLKgVwMALAQUZy6ERlJJsHeltvt9thK4lAvQwZ97kBJlUMAjnMTrbaBeH
 amDYy5+FzFVMhZjcaehh8+kbo5V/SSaI23rcFLC8MvLRhwp1obWQkTIqksNXfXPvOLdV
 9UfRPyIoTCkUSvYYGScTtKop3Ho0qHzZUnl5LW5+lZ0vNE3LhD7qwOfhC0ZxnBBIpBFX
 La8OJ/ctyyGB3G1lR3BuNh84A6EaIZ0i/XYdcLOLYtPp9YOsTRkNsx46N2aBUCVf5kxY
 l6uRs/N2N0PXevw47293sEXbOx/hq0tPWRfM92MTg1yHagkNw5c8gM4DdyolbUBYAXk2
 9U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Z/rVbT24UV49iOkZeembiRz5FJ9EB4U3FMqiZHSegQ=;
 b=VUDO09I4twHYIrcn++lsqj6pubQ4/UoX0JWtn8qPkLoraqBInumupQ/OouXgdOHCrA
 hObNpQYuarneA7qDLp78IkNSfNMOQO0dv+IFQvVLo6tgHDP2XQNERSbIayfjmrUjUcGE
 cYTWcdKHmrhev20KG4ugPUBEwRxqv1W7oJUnwGBeRmNgSwKs5tHGIPTp+7wP2/EFpmXM
 2i+MH5U+CrYLEXIlSp1XlTLGuCpILD5NqF0+reKxQDIHvCXwahDlsUP6/VBWzmLF/i1m
 SF9X3ZTZbV8Wct9GNp/I1yMsFNq6iKW8yZqOdFw3INRQ2gJzoFM/SGvFYB+LAzOgm8pf
 HS8A==
X-Gm-Message-State: AFeK/H31/hU7i5Ir8b3GbPT8IUfMGjfmBqTGV8sFSflwROvdm96mFNEdA4t7ljNyIsjaeFTb
X-Received: by 10.99.38.196 with SMTP id m187mr5359401pgm.195.1491004659782;
 Fri, 31 Mar 2017 16:57:39 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d10sm12507045pfl.59.2017.03.31.16.57.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 31 Mar 2017 16:57:39 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed: zaius: Add iio-hwmon ADC bridge
Date: Fri, 31 Mar 2017 16:57:27 -0700
Message-Id: <20170331235727.78354-1-xow@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
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
X-List-Received-Date: Fri, 31 Mar 2017 23:57:44 -0000

Add instantiation for iio-hwmon bridge that exports the ADC (an iio
device) channels to hwmon as a device.

This requires CONFIG_SENSORS_IIO_HWMON to function. Note that the hwmon
input numbering is one-indexed, so each input will be numbered one
greater than their corresponding ADC channel.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index dfd0dd7c16e4..7ea66de051d4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -86,6 +86,14 @@
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
 	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+	};
 };
 
 &fmc {
-- 
2.12.2.564.g063fe858b8-goog
