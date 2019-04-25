Return-Path: <3LynCXAcKB3YpYhnolYaiiafY.WigijYhVgWfcmnm.itfUVm.ila@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::949; helo=mail-ua1-x949.google.com;
 envelope-from=3lyncxackb3ypyhnolyaiiafy.wigijyhvgwfcmnm.itfuvm.ila@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nkkdQKVP"; 
 dkim-atps=neutral
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qrFN0ZRCzDqdw
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 07:40:01 +1000 (AEST)
Received: by mail-ua1-x949.google.com with SMTP id x48so304063uac.23
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ibgJ3i4cV/NbxILk6+saIIhEWTvJTmE9VQOQoZzOktA=;
 b=nkkdQKVPgZnWLiZeYdWGdRoXbwbl7CY9Y9Jo+SZZzjvd3gXyk8h9l/+7gmYkt+EvIG
 JLNaUp66mY3d/YYG4VhpCLnCivJg+/pik8vjMrN49uKudwaD7b06Mn5QSrqij/lnk5jC
 EOlR4kZquKyKHToQBCNON016AS8uINryTGoQvCTpKklUlzXTzsn0a+diUQpvqkcAQOwR
 kQGzIzo4GWuXTfooBu+Cos5aswEkNU4jO0BL4J2+UOGG2S1N6zuGA2nPuEVmbxUiz4nI
 SNeaNTXeaYZXMVyJSJLgADoAb2lIZ2RSjuUoBt/EX1m00AK5xNHbbQrtmh5bW4M8ERKT
 Q75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ibgJ3i4cV/NbxILk6+saIIhEWTvJTmE9VQOQoZzOktA=;
 b=aeD9dafoZ37Mwbip5Ql/Df/JJt50q032UT16mXI6YqQB9ZfDugTr2ALDM151kooqAJ
 cvL5ilAP4G32KKudC0if1gNzc3x2lX0G0Vbh8qIeYO/wq+BLTMDO+AycpkEawpnLGcVr
 U1WR8aFcAdUsrmBBw4uKox9nydcAsOdEFC4J2giDBOD1VnNg56AmM5z/sQT1nPDuJQk2
 xDuSV7m9VnVekr5Mv+F/NjwHN8ptjcD2ZYF/Hn/DQFfZyP0ORLR5WjkxpA1/2TflBoCS
 cLJLxuLqEUWfw2vuaReLMCYlR+fnk5E10hcN95xrIvBRVzXXnFfEh3LI+j8g/NeTA5sU
 ktlw==
X-Gm-Message-State: APjAAAWssXr7HCFtO4cWdLOH6uCu3SY2QpsFGo4ChrlbvzNwjCnaZAnL
 DqYW3csvU23O5fUJEwAqBWohUgs8U+0G
X-Google-Smtp-Source: APXvYqyEUA6sc4IMImsHHgHT1+41GzTFFoaVBWbc7VHlywB1s9UIY7NlbnKjdd6sEjNY430JqeTws9InoyUt
X-Received: by 2002:ab0:7008:: with SMTP id k8mr21527346ual.40.1556228399246; 
 Thu, 25 Apr 2019 14:39:59 -0700 (PDT)
Date: Thu, 25 Apr 2019 14:39:55 -0700
Message-Id: <20190425213955.112511-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0 2/2] ARM: dts: aspeed: quanta-q71: Enable p2a node
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 25 Apr 2019 21:40:08 -0000

Enable the aspeed-p2a-ctrl node and configure with memory-region to
enable mmap access.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 385c0f4b69ee..080d7c844c54 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -112,6 +112,11 @@
 			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
 };
 
+&p2a {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
+
 &ibt {
 	status = "okay";
 };
-- 
2.21.0.593.g511ec345e18-goog
