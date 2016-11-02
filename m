Return-Path: <jaghu@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8KCw6S9hzDvQM
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 07:18:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=LcQQsNKn; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id d2so17477518pfd.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iYJALeNGWP4C8Yc1OI+kvDzXzqahEMHjDfCdqSU5u+8=;
 b=LcQQsNKnYTXOty2c1OmXDBXgkfqhehDuKnm7tDdAijDXOFxSq6F4txVARHESuSsfQ2
 dtsOXaURhXR+phZ+bu42Q14nhDIDY7oczqcqruFVbq+A+bRAntXWxAWxQ01Rv8qDrJgz
 rEGMsdXFQzB/rwDOO3IalcsF5Pmw3xnNskIaWiWsgBC4ywFTAb17kxQz95J/uaK8L9Nm
 KmtB5AjJ0rK/78/rMtRdiv9RTb+AIIpjoXLeMKYDMXu2UbJepvVKF3wHcFfm4a9c45PE
 fT9x4odZ0kfqk3AxtQkl28IsqiGYCRp1dm8eru5Rq2YjOd+MG4Ug4UWII+SDa1xHEGSU
 YQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iYJALeNGWP4C8Yc1OI+kvDzXzqahEMHjDfCdqSU5u+8=;
 b=SOSJ9WZppm9IR1uJ2RLUfWrhwW94N5wWH1HFDrhcna2UYQMGLM+ekE+r/eCWIe5UjG
 AnV1RnlNlDeVFlwgs3rGCpAtSf8pdXlLGevVxbGBGYZi5SuiIpUQtp4HFE7bSQf2rJ4b
 wSxmyA8YFKbzokL3TonCK6UqMXdNtkZx6RwEqUGcbiNNgk5pV/1IlCMFeBrpUQQbn7JR
 d6zL5E/iatvrAb0t3Kw7d/c5Fd3hBFEXAAaeH+T9Rj+7fwGyK52l+pUY1GntbsKLksfp
 L37X9S1r0zoqkf36lmNXBj21l8ADg/d/wT2QoP9IGgujGaZSn0oaTth+bhyns/33qaCN
 bu+w==
X-Gm-Message-State: ABUngvfRV2MrKjAeurJToeMeH5olY6o2dJbQWQs2u62b2pLwFTULx6/3GCiLKNBnuK5t9j4y
X-Received: by 10.99.96.136 with SMTP id u130mr8396565pgb.47.1478117882391;
 Wed, 02 Nov 2016 13:18:02 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v66sm6774318pfa.33.2016.11.02.13.18.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 13:18:01 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v4 3/3] devicetree: Add devicetree changes to support
 seven segment display on zaius
Date: Wed,  2 Nov 2016 13:17:45 -0700
Message-Id: <1478117865-32103-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478117865-32103-1-git-send-email-jaghu@google.com>
References: <1478117865-32103-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 20:18:05 -0000

Add clock, data and clear signal lines to control seven segment display on
zaius platform

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Moved the doc file to the same commit as the driver that it describes
-  as suggested by Xo
- Removed abbreviation of names as suggested by Xo
- Corrected mismatch of property names between doc and actual usage
-  as suggested by Xo
- Corrected the gpio designator in the second gpios property as suggested by
-  Xo

v3:
- No changes made

v4:
- Included changelog entry as suggetsed by Joel

 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index eef045b..c32d9f2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -83,6 +83,14 @@
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = "1000";
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+	};
 };

 &uart5 {
--
2.8.0.rc3.226.g39d4020
