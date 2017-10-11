Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oAl+B7lA"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBmFX2cNSzDr5S
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 18:43:59 +1100 (AEDT)
Received: by mail-pg0-x244.google.com with SMTP id j3so1377387pga.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3jEVCl+zjfIX+ICxJdUTl4kWeXmKvf+OeBusYMIzunI=;
 b=oAl+B7lAkobOUJaesFcId/ARJ1NGu8RhextFMv2XIQbRDeP6Z4z4YXniwgwTbcv8s/
 VHNES2/Vt7xxkG8GhSj11dLccEQLl4j3DZoWn5lQ0b6ron6w7GY+61NbhA40LXNBOfUq
 9ENzk1nIDEZjC/XpCu2Z4PMvtb4qAfffk+sloqokooCGjlsL2jcraPReIC7AYS9LaDDa
 1ccw3e8O/T9qOcU3ppRDe0+l23lwXwl9E1gk5a8Ae1NiwEmW0r4VSbkFpc/E6/eeRBP0
 oKeguuFof0RlE/8HyrZYY13AzZ3s/ksbN/DVVwidbGu0ahSy3Mv71mzGYwRNRlIY0N03
 S4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3jEVCl+zjfIX+ICxJdUTl4kWeXmKvf+OeBusYMIzunI=;
 b=uAIUKtMbMRPF5cp4EC0ulNDZ/6XJAtyZf+rmM35pSfrPzHtBK2kycskMiwBu6iy7VA
 q7/TUl+Ps9DwiLvtdiT6F8OJuvufPgn4xMKeSyXRAaS6JWPYylqtDyVhIZp90CPGTxiJ
 lsCAk19kBqIxku4epFbSBO2F+tdol2GW8mhvzg2hwyM+xqDj9rbxH6o8tPkMSMchtdUW
 ObrLUkYXcgi7RQNoa0kI+6fWHRwKYn/EcISFdpPZK19nULCosRvTQMg5jduokZPVSSEU
 bTulBBLz7mVhSzqoNZtAMhHcUE0Vwj4Zu7eIH6sVN9TTWSBqxyILRVyJk2l/XWTHHmSJ
 W0IQ==
X-Gm-Message-State: AMCzsaU13iwpksV611EvrStcZZYhqQIDgvyyAJFSlNx/D7HIS5PdxEPi
 /YAYJyQdLTc6VFRjvO8EiLv8jtnx
X-Google-Smtp-Source: AOwi7QB5kdBgCMw/hR+20gq4McwLL8jaxC9uYlV3NZPTKwHfhm3LznMgKum1L5DmhyEpPxU4nxzK8Q==
X-Received: by 10.99.3.21 with SMTP id 21mr14357612pgd.77.1507707836928;
 Wed, 11 Oct 2017 00:43:56 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id h9sm23782751pfh.98.2017.10.11.00.43.55
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 11 Oct 2017 00:43:56 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] aspeed: firestone: Set SIO to bypass UART in
 hostboot
Date: Wed, 11 Oct 2017 15:41:20 +0800
Message-Id: <1507707680-19898-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 07:44:01 -0000

OpenBMC fails to boot host on Firestone.
The cause is that Firestone's hostboot hangs after disables
SUART/VUART.

The workaround is to make hostboot run into default SUART init
without disabling VUART, by setting 0x170 SIO register to 0.

With this workaround, Firestone boots OK.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index a9e91d9..c84c871 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -104,6 +104,10 @@ static void __init do_firestone_setup(void)
 
 	/* Override serial destination to use the dedicated serial port */
 	writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
+
+	/* Workaround to make hostboot run into default SUART init */
+	/* Otherwise it fails to boot */
+	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x170));
 }
 
 static void __init do_garrison_setup(void)
-- 
1.9.1
