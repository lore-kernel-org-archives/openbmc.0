Return-Path: <maxims@google.com>
Received: from mail-pa0-x233.google.com (mail-pa0-x233.google.com
 [IPv6:2607:f8b0:400e:c03::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slSN551L6zDvGy
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 07:27:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Q6UFp0WG; 
 dkim-atps=neutral
Received: by mail-pa0-x233.google.com with SMTP id qn7so31308613pac.3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0vJAe3f4rVOIcDyJzrgiRyGKKm6BCU4uhlfxtoax3vA=;
 b=Q6UFp0WGcwz1YFSWYK5g5LGAmPa3PoHGBUls+ZZZDGzH14FVPQ/M67WfuwizBq/dU4
 XAChcAoLAdAnUPQQm+D+Ha00wuC/nLH/MPDcCbZV1YIKyckh7Vdz9UkYELftEgIOtJcI
 f14Fb6lPoKnic5gZKBzJavtFyfGjW61GbZC38aoSD4DHKxv1Sv+2rmdSEl7PQlIMxssk
 7z0FIWizOxdnZ6AMGMXOmxz2wZjflTrOILAoBxSOjRy2j8ZKPloEABO1nV5sO0NdD7WP
 9gv43V0kAJcKY79sWo8E4zyqyF48xdSVyXdHPW5Cffkj/HOjPPmIcaZhwrDVWxrL9/Gi
 lKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0vJAe3f4rVOIcDyJzrgiRyGKKm6BCU4uhlfxtoax3vA=;
 b=UWxLpnRefOxQea2U7Arwhxl7yRHIb/ILvdCubHG8zFtHTlAw0NGJvK6QwFhiZQbiWv
 1cBgidYT58EC9JXou/3oNRI0BKJIGyX37KBfxw9V/h3e5zpYy2ZaJK4Lu0usIu0ntRFP
 /36GD5L7/JI5ES9XbVNZnVd7XnYmzeA3ZlsmLvBzltYV1htIOqIpCzEzzEPHvrxxiO8k
 37wERawxl8AvP9993L+KxiWHbd714TWO2GUnNrkhd2VLhvqh3tnznzl9xjLijS1mIGGr
 WWtDT14aIZtoINCcAf6kvIalVKOMA9FHhI0mKDJHAhR1cdzAVTJxXV495dc6OwbwLge2
 3Rnw==
X-Gm-Message-State: AA6/9RlQjEYzWxj16XaaNTCDagx8MKSDy3fYPwr6ouAOq7iJ1JCzk7MRgZigXb/gWDSZhWaQ
X-Received: by 10.66.147.5 with SMTP id tg5mr5862095pab.116.1475184465626;
 Thu, 29 Sep 2016 14:27:45 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p128sm22436351pfg.38.2016.09.29.14.27.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 29 Sep 2016 14:27:44 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/3] aspeed: Fix regs-scu.h and ast_scu.h incompatibility.
Date: Thu, 29 Sep 2016 14:27:05 -0700
Message-Id: <1475184427-144121-1-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1474998214-12720-2-git-send-email-maxims@google.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 21:27:50 -0000

From: Maxim Sloyko <maxims@google.com>

Fix regs-scu.h and ast_scu.h incompatibility. They were using the same
include guard.
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b89df82..b714fa9 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -10,8 +10,8 @@
  *    1. 2012/12/29 Ryan Chen Create
  *
 ********************************************************************************/
-#ifndef __AST_SCU_H
-#define __AST_SCU_H                     1
+#ifndef __AST_REGS_SCU_H
+#define __AST_REGS_SCU_H                     1
 
 #include <asm/arch/aspeed.h>
 
-- 
2.8.0.rc3.226.g39d4020
