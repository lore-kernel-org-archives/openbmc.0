Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jC6DcukB"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44152c3m4xzDq5Y
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 18:47:35 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p4so4536031plq.11
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 23:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/UyNZmbloYA68vdeuJImXr3MpaNEHcbTNGHAUXSCBt8=;
 b=jC6DcukBMKMBDSl+HsFkO1FcZR68NvQYwSsSefYEkk+YtkIeiwcq+42zK+EL+ydJca
 GW5izF6GxaooHz0FUJxZDujrFNn0Ho3cK7jyY8g7qij3FceHJTQpzPr5yCoRe/B8HNCb
 uwpSURmyqB8i/zFgToSNm/Vzel9L5bXLIgmLyCx9ZW4YdLZUwOWcMKp6OE08gAR9nemt
 RGdVDSwHgYSktm4H9EwMiJBjNPNdxnXNEBaBJWD2G9wCab5gETgjzomrbeRaW7EoN7S/
 UBIS90dnV2ZhCWeNEys3P5yn/Ln3saizJiEo9swt4aEY4JmcRjjW9lX8TW+iZPmtSE6V
 twNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/UyNZmbloYA68vdeuJImXr3MpaNEHcbTNGHAUXSCBt8=;
 b=h2cy1OQMywgpJ6kb3HIezyLMpWFNKDl6b15LpVRd00aNyte5evSb7f8kwlByzMMgS4
 oWrwWnKsHrwOEfXTtFqe6yz/FvRSJKvvIeQIzAsMK3U61oEOEgzCRT4Q8uF8ug/XvdCp
 ZUAopS8G9rMrTLv7P4rEguk2UoDwD6cmGy6Nf7tHzeUgktdXTUSKn1IcyNLMQuSpQ3+A
 aEzvyOCVOoxJ4oIXoYj3/aldjyoRY7HQxFNbgv9WiWpi3kq6VnGgun5OQHJatiopMP4r
 33ZuE4HMSbhUeuCC5jxgaBJsqpIXu97EknnemV+S7WafcJq879RdRJ5pgXVA/J9ScAUt
 EtkA==
X-Gm-Message-State: AHQUAuYAJ9LgIkzvfiyEOMPrKVaxEIj7yXvMSRHpukEjTc6HN0i7aA0Y
 bOrrKEKy+yMo8wD+0XxM4Cas7IXa
X-Google-Smtp-Source: AHgI3IbhFdmGjmdkGwf6FJCTaZCEZu0pd4VMBwXbFL4tsdO3JEeCh/pGha0WwMAOrSIJvBylQphK0w==
X-Received: by 2002:a17:902:820f:: with SMTP id
 x15mr8534960pln.224.1550216853957; 
 Thu, 14 Feb 2019 23:47:33 -0800 (PST)
Received: from localhost ([192.241.230.188])
 by smtp.gmail.com with ESMTPSA id t3sm9526035pfa.50.2019.02.14.23.47.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Feb 2019 23:47:33 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.19] ARM: dts: palmetto: Fix flash_memory region
Date: Fri, 15 Feb 2019 15:47:21 +0800
Message-Id: <1550216841-57006-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2019 07:47:37 -0000

The flash_memory region was incorrect and exceeds AST2400's RAM range.
Fix it by putting it before coldfire region, and aligned with 32MiB.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 9285b90..50c9178 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -32,9 +32,9 @@
 			no-map;
 		};
 
-		flash_memory: region@98000000 {
+		flash_memory: region@5c000000 {
 			no-map;
-			reg = <0x98000000 0x01000000>; /* 16MB */
+			reg = <0x5C000000 0x02000000>; /* 32MB */
 		};
 	};
 
-- 
2.7.4
