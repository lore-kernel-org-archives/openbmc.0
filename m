Return-Path: <maxims@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfV6m3VzDqB9
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WY6+w7dv"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id z127so12281712pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wW9d5NuRo89gEBdUBonWSnV4uGRhcP8uIEcEtkECyis=;
 b=WY6+w7dvGwCIlY2B5HcP7UYeuIePf3Q6XlCa1eZdSePV/ySYVBs3/3AHDTn99yFNR0
 6LxzZxduHDuVJ0N7SyYGSHQ3hbetYjT8F8iX63HA03AB8XDC6nSvC6Iqw+wccG8z4DbG
 GM4LB5+msLu/MWKjtp+CHIGLKpoVUleRvi0dTdDpJf67Ykz4/7fEVjhb5EoNCU2V64Zy
 y6YQxRuXF9Pz40rinXkYtLhsKpCC+GK1Npfg8U13OTwNUDPwrpP7wY3oD2CQTNBCPHPN
 jPmIZX5e6yl/py4DdX0tZy+uq5alMvqJ4//HTk2WedOua/EJ4fc0v4uou/ZOmjAbR3e+
 8UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wW9d5NuRo89gEBdUBonWSnV4uGRhcP8uIEcEtkECyis=;
 b=HOXTi29EBGHMdw1FRVu9tIWXf1ZcVA0jvUICk0JsJSANEM759DIHrR0Xum2f1kIEXs
 67QiVfdKqGKOjNJdL2divgorfVFlN+S1U/kta8yOSlAk8/gJurCh8OFB8PNjG7LCNeYd
 TItCGgkHywq8v0k+tC4gKH0pSJQ5akD3+M25UUDaTidO9vFDHbqGTSvvZ2I4yimd3kRg
 h8vhVWVwwDgxaJcqngwZk4ll39lRAVy1Cw4UXKlT0aAkuSnI66iYD70xbAo53CCm6b+I
 v7F5z1BjMcrxbkej8ScLo/3khw8EH7ClwFAxP3KD1kwPBd49zPjJLURSbS61OTMkoNQ9
 qkSQ==
X-Gm-Message-State: AN3rC/6UaWQ4CojQTOBx/KZD5jABu6y0xnJlYckDYRpx161VsG6SNmHc
 QYxcFA0zFXxPEqep
X-Received: by 10.84.168.69 with SMTP id e63mr17852647plb.124.1492455665252;
 Mon, 17 Apr 2017 12:01:05 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.01.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:01:04 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH v1 12/15] aspeed: Enable I2C in EVB defconfig
Date: Mon, 17 Apr 2017 12:00:31 -0700
Message-Id: <20170417190034.71945-13-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:07 -0000

Enable I2C driver in ast2500 Eval Board defconfig.
Also enable i2c command.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

Changes in v1: None

 configs/evb-ast2500_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index f8ef9b779c..08b5f85a34 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -18,3 +18,6 @@ CONFIG_TIMER=y
 CONFIG_WDT=y
 CONFIG_DM_RESET=y
 CONFIG_PINCTRL=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_ASPEED=y
+CONFIG_CMD_I2C=y
-- 
2.12.2.762.g0e3151a226-goog
