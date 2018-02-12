Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UVX2a4cB"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgJ1N64q7zF0pp
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 07:58:45 +1100 (AEDT)
Received: by mail-pl0-x241.google.com with SMTP id s13so1961663plq.6
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 12:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L+ZdcJSZLflgStZj+UxlxAdYLihQ/S/9eTDv7h2er9g=;
 b=UVX2a4cBSfC5q8sg9p+f8JFIatwymS7dUuMWZJxfQXCyx/dGCYm3VVb6z4jrGzFB1d
 0GQNP/HhpknnmNYn6Uvqesp0ZS9J0xH6wmNe16zKZcyiRLE7SJNvNX2OQ9bj9fPcL0ka
 1vriBES1MD8MOgwu0PuXg7zezlz9S6IifF5JQ10vyf/+xOTXj07WWLL9nK+3ZiXuPdIv
 8F7Nvd7bzUqBzVwnyF3AbKFZEQKq2qP0a5t3WpWBRPHChVh+kYp/y0+dX2BuIB3QEXSu
 DB5mXcXWsuxrmy4+MBNnqt2PMrFPOs6qc+eZMZbbEfwjz8QOWjTfkw0y2HnQpE3X2Eex
 H/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L+ZdcJSZLflgStZj+UxlxAdYLihQ/S/9eTDv7h2er9g=;
 b=WKQEC4HUNXQGLISpEp4uAwvZv//IRHJsgrkRzpyZtdryGj0/MzYDVg9PjMD50dEGfw
 AiNotYdYC30r5AbcrGTrkLAB5HvQpDhLT86ivNsny5jHt5SPqhU8dlhgEouL06zpzEE6
 H63CfuMdT9NIcibHdKe5xWSGR3P/AFyfLMvdG4UwmcXVeaLLD9AWwNzhLYGoQp/w6/gM
 4WXohyP/DCSYoCVty43eZcTEwc0J3lfmU07mufwOyIpNV5Z0CRSXRuaQSOgHifMlqb4l
 neZBBOESPI0gDPwD2ATXS8+gIASlifnYU5NoT6eGmlZ0sJgXFCOzFHH7cvNvnxqtvrjj
 2wlA==
X-Gm-Message-State: APf1xPA/nZK0ndfLmAf8zvQeQarOnQ9J3Xfzgl8LitUXQk7/IXaMgE38
 QFecVouREawpw06NtjrKEs1xig==
X-Google-Smtp-Source: AH8x227tsRQzVz/V+4z2A/8EbibJ+Ajt00EOR6hLPFbIbEUwoWigb+6gT58+UhR68LcbC4U2bSDikg==
X-Received: by 2002:a17:902:5814:: with SMTP id
 m20-v6mr10080139pli.389.1518469123806; 
 Mon, 12 Feb 2018 12:58:43 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id q13sm24629005pgp.76.2018.02.12.12.58.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 12 Feb 2018 12:58:43 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 2/2] MAINTAINERS: Add low-level debug files to Nuvoton NPCM
 section
Date: Mon, 12 Feb 2018 12:58:33 -0800
Message-Id: <20180212205833.151019-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
In-Reply-To: <20180212205833.151019-1-brendanhiggins@google.com>
References: <20180212205833.151019-1-brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 12 Feb 2018 20:58:49 -0000

Adds low-level debug files for NPCM7XX architecture to the Nuvoton NPCM
architecture section.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fa95aba0f7f..4eaa66bc0562 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1608,6 +1608,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm/mach-npcm/
 F:	arch/arm/boot/dts/nuvoton-npcm*
+F:	arch/arm/include/debug/npcm7xx.S
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
 F:	drivers/*/*npcm*
 F:	Documentation/*/*npcm*
-- 
2.16.0.rc1.238.g530d649a79-goog
