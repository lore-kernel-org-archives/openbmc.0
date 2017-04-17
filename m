Return-Path: <maxims@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfS3M78zDqBS
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jllnuXg4"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 72so67537477pge.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KxIYhr4J+Qe4MACJdjIFUFFH7E8MVMxZHlhDrT1UJXE=;
 b=jllnuXg4cQ9W2kg//SsGJzpvJDV/CwuVB7zjC0/26TQKbRtOVueTD8mhXwUhBKzcRy
 0XmQH20sBeDcHEsmh1XtsnHY8YKB3g1ZQ4m86MdJdq41sOek0RDExhNSN2xqyPaTfJxA
 WhtgYM0g/WipXD0hiiKlrrbxtZHyqdiMY8UvGboUYCEcNnWSgBFn376yBSs9aMQKjP7T
 +p2BLT8+66kvtacKc+UmWSt/27j80KV2sPuHSfiqLfSsKsNaJBtAojFehrZSAlJPcetu
 MiNGnlSDawgCaoUSUz78snV6GFsKT2y1Nvda9PPqXtJU9tFyEe5goxHanMMQFG6B+bnb
 H3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KxIYhr4J+Qe4MACJdjIFUFFH7E8MVMxZHlhDrT1UJXE=;
 b=Bi+How4p5sp8pHI9QVwWeICvLEGplf2dOdORA4dO2uwtl48wjqnQJ3BYr9PZffUNgg
 mGgNSu22cQU8jcrXmP8oDSqcODx+5RjsXCU3ywPspwJf+913E5ertRb9LtxmOFrZ8AU4
 Djx3DDImvCp/0RRlp6HB/dc8lhWPtic73CkGJCcrRB3XlrM+/xw5T38kzDLhsZ1KMsq+
 zVG7UKcsBer6YuxN2WqriSrnt3UKPP34/NJoBhZUtoGPrIUVZECj1z+RxE5emyHxlsPy
 nTtNluN2AsRYKe4tKmZNCOXYEnQ2ZIf8wT2g7LnMXkE3tfL9IBpWVpnFS7AEtyaOGGgx
 hSsA==
X-Gm-Message-State: AN3rC/59AWBAOVBeh84qhDbjReIQwk5/qoJ8nyfjqcz/dUq3kN/khKoK
 YlS3kjkMnMHDRo1g
X-Received: by 10.98.208.193 with SMTP id p184mr13216114pfg.80.1492455662253; 
 Mon, 17 Apr 2017 12:01:02 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.01.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:01:01 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH v1 09/15] aspeed: Enable Pinctrl Driver in AST2500 EVB
Date: Mon, 17 Apr 2017 12:00:28 -0700
Message-Id: <20170417190034.71945-10-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:04 -0000

Enable Pinctrl Driver in AST2500 Eval Board's defconfig

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

Changes in v1: None

 configs/evb-ast2500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 74808a71ee..f8ef9b779c 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -17,3 +17,4 @@ CONFIG_SYSRESET=y
 CONFIG_TIMER=y
 CONFIG_WDT=y
 CONFIG_DM_RESET=y
+CONFIG_PINCTRL=y
-- 
2.12.2.762.g0e3151a226-goog
