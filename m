Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhj0dGxzDt2h
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=B6CyBglM; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id 139so3149869itm.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=B6CyBglM9lbu/2j5cDMFjcRCrM9Q/SkVP/xZ96xFPfsOlVKLKTd67zDwsmWmlPXJlf
 PY49sl7tpZQwqrkQ98EuyK39oEZrnAIuTixOSJxr2Z2IG1pgxI76rjEhzjRHbE7lWsG1
 V0XK0UAHZlUAoV218VCoWAJYuTJOWw+QBs+u9w27o3i0UKpP63buDQL5T5El+OEVZsLx
 yfXAJFJp0d9Mi2a1IR65rTamRYsI6e5B/Q0bVJESE4OQQHIwbxMR6vOgAGdyEyaNdpHv
 mopLDs4PzLA1nKNByiOY8JPYH2bvLHxKxXDmAfzyy2CqjSLb+7ysvdzTShiR93sjCHDb
 vLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=U7j7cSckla1KY0gWyCMcFiXtaAfGubN7ds2ZOzdJqwspIrbX2+zVk2GoRdOuE4t8+B
 AO/e6jDm6m9sDP+LtONpf9OcnLmm1OGe7ckqE0oLFtBSMSQV6Ynyuh7ntiBM2Y35zrP5
 EJLMVcSR+eFc7ERqMEDgXcqbbHJGL2L0sD+EpAz3YNC9fsH/hY4ueu/mXJUYezyt/itS
 z93M0tKw6cdeBRcgMhJd50uNMz+TLXDjsfSZQq1whFlzROl4UtcEuWQG2ZUiTzVu4Ef6
 xLDMWxHsl/ua/aWqZu+bPTrrK1BlWbNhidIYN1JRYWYSEnz856ddRSuUF+v7a5fL1eF2
 By2Q==
X-Gm-Message-State: AA6/9Rlp0AMvWkxMsY7xXxr6oE8oN9TPiK/KkB7cJkfkZMg+gMfemxhwEYShA+mTcl3x6w==
X-Received: by 10.157.1.136 with SMTP id e8mr5134482ote.16.1476918595357;
 Wed, 19 Oct 2016 16:09:55 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.54
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:55 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 06/18] fsi: enable debug
Date: Wed, 19 Oct 2016 18:09:34 -0500
Message-Id: <1476918586-13475-7-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:57 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Enable debug for the fsi core during development. Remove before
submission.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce9428d..db1a1ce 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -13,6 +13,8 @@
  * GNU General Public License for more details.
  */
 
+#define DEBUG
+
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
-- 
1.8.2.2
