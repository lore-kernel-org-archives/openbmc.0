Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNmYb66PrzDqFJ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 06:30:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=NYdsfbJL; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 0CA8527093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465245056;
 bh=I+otmwbeuL90cey9KeELEYMbUicREsYtUVw/XtFcZNQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NYdsfbJLECjEFgs5XttI4xiTKSB3raudrujbZLNXpxxxv7bS9jIcqN4Iy2AVzDejs
 6beurYStnPurazR8gb0dayFG8J8tdBesuVoBDwLtvPyYTjKIHGwKjaUZjkB6/pGpob
 lHQaQlDcddcNbx7cnR27FODMiGlRvCyO6np71PfU=
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH uboot] Uncomment 2nd watchdog configuration
Date: Mon,  6 Jun 2016 16:30:52 -0400
Message-Id: <1465245052-22577-1-git-send-email-bradleyb@fuzziesquirrel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2016 20:31:00 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Disabling this watchdog until we have a kernel driver.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 board/aspeed/ast-g5/platform.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/board/aspeed/ast-g5/platform.S b/board/aspeed/ast-g5/platform.S
index cff8e35..5e8f1ef 100644
--- a/board/aspeed/ast-g5/platform.S
+++ b/board/aspeed/ast-g5/platform.S
@@ -372,13 +372,11 @@ bypass_USB_init:
 /******************************************************************************
  Disable WDT2 for 2nd boot function
  ******************************************************************************/
-/*
 #ifndef CONFIG_FIRMWARE_2ND_BOOT
     ldr   r0, =0x1e78502c
     mov   r1, #0
     str   r1, [r0]
 #endif
-*/
 /******************************************************************************
  Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
  ******************************************************************************/
-- 
1.8.3.1
