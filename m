Return-Path: <xow@google.com>
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com
 [IPv6:2607:f8b0:400e:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v9FFv51CgzDq60
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 10:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Y9n5k2OR"; 
 dkim-atps=neutral
Received: by mail-pg0-x22e.google.com with SMTP id 194so84695555pgd.2
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 15:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRizdaL3nNo1TXL9dNA1FkIheDz/O9Xsb/Plw+2XeP8=;
 b=Y9n5k2ORvPqNcMNGB2r51N2qs7OqNge1RqlOcu2ADvxjzCGOIEvYVW0euuctQqHZKl
 LVN7iRyfTtAbyYTUnhjsJHD8W8VqdhAfwJL9u5EnkkYc727Jxf5/sgdKq+LWov3qpbmS
 0xrxQdUZrp2nVnbeKygWy2Pfodo35KJ9qfnEBb02OkecDeygmVNJFF4WwdpZIdpB7eWt
 IBIV/JEM0tsANfDbnm22uRggF8rkzu+vj80VMoZVo2xXU+xphECjRpRZAtVmgYk5s3KJ
 llb22b1OmoGyR86hLCvpHD39f5kdha1q3ArMV6BUnpzFFx15CHnAlq1chRdpzPQHGtmR
 R0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRizdaL3nNo1TXL9dNA1FkIheDz/O9Xsb/Plw+2XeP8=;
 b=sf3AJaLO0sUQ9tqvuOteKQXreixLN2XPYa3ZEC72KgqozOwpuy85ZgBzTSlOgLvsMd
 9A7ysVGCqHtWXg2Y6alfWCX7cq7Bh+P4KLPOVcmVjvnNfgSEaYXRioka/8Uo03NRyKwj
 5uXqbWmhTZBZzemw7C3e0sjN6/4iUhGcvGDAZlmGaIqXOeF8qFC2ZeOJx8s3O4CY1DsQ
 PIyPF7vprWMMqEg5t+hRsavWBlwFSWyFi7vlbwOtLZ6mqsz9jmZhS7l7U4ayKR+lTr0U
 AvwNSpXa8bZSwkwlzh+T0Gy7xALa6pAEtUdSBNdlLu/WsISpLvifCnN4AK5e/Zyq3md2
 ZH6Q==
X-Gm-Message-State: AIkVDXJ+nl2/UuqQwY4HEuFcucjOICQWh1jx1Y9hXd4OCZsSAstZs5GgjuQ0JL8JFT3MtAKx
X-Received: by 10.99.177.79 with SMTP id g15mr12231520pgp.185.1485559393146;
 Fri, 27 Jan 2017 15:23:13 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id n79sm13813209pfj.31.2017.01.27.15.23.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 27 Jan 2017 15:23:12 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2] arm: aspeed: zaius: Disable LPC reset for UART1
Date: Fri, 27 Jan 2017 15:23:07 -0800
Message-Id: <20170127232307.110483-1-xow@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Fri, 27 Jan 2017 23:23:16 -0000

Currently, UART1 on Zaius BMC is unusable until brought out of reset by
powering the host on. In this reset state, ttyS0 can still be opened
and UART1 silently drops bytes, which is not obviously expected
behavior.

Clear the LPC block control bit that enables LPCRST# as a reset source
for UART1.

Signed-off-by: Xo Wang <xow@google.com
---
 arch/arm/mach-aspeed/aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 4bd3680d742d..fa99d8bde5e0 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -185,6 +185,13 @@ static void __init do_zaius_setup(void)
 
 	/* Set SPI1 CE0 decoding window to 0x30000000 */
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+
+	/* Disable LPC reset for UART1, otherwise held in reset by LPCRST#,
+	 * silently dropping bytes until released (usually by host power on)
+	 * */
+	reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+	/* Clear "Enable UART1 reset source from LPC" */
+	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 static void __init do_witherspoon_setup(void)
-- 
2.11.0.483.g087da7b7c-goog
