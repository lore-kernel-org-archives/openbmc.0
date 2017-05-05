Return-Path: <maxims@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpj0zW5zDqFb
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q4hAcACs"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id o3so8834417pgn.2
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KdjZ0IWXrVXdctVkShjKHujMpWkigZ22z8DBo3zyBl8=;
 b=Q4hAcACs6HQb9MOmj/4dmy1EqSUdpdDweuPZCcLYoJQKvrqO/kDqTekloZXWSDpfl8
 TDJExq9fNBgRTvCdD1gvfG3cU1d1ZnWO8TvQdb1iYKjyd1VoFvYTf80EcCUC0TirJiGs
 CFJA0Ll29jl0ydMNcUXnKAJ7e72jtnAUnyUc6Dej8N1Ccatz2lr/SWtkmz9kVC8gV7M/
 YNIO13FZT7lsCL4of4Cov5nxDgVosxs/79W8PXT+329GOE45aVJg8sPOhO7YQOgaZjnm
 NNtnDcP08LZbvOM6YX/qG7YxI3KciZbZ0f1finrgwq+7CCRLjnZkSbn43mG9IrTs2ojz
 BW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KdjZ0IWXrVXdctVkShjKHujMpWkigZ22z8DBo3zyBl8=;
 b=mOScOjfC7LBVTKQSagbW1N+mA37lCugZ9bWpzXhBEVkF9o9tiX/KXxoT8pQ9DUsacy
 SBHK1XO8luBIIw4IzFJXdoOGyqepbvT2gpferOUPJwk+phdRYHeMgVW1a++9q3WZ1ZL9
 oeHvclpDpLctiKtNv0dl2R8Fll+3Sci6fOvfVnpNkUsXUY/NJ0/TBiZf/3qeZUmLT5/Q
 X0dhc6awk/hXfGj4fuI0duc5jBcf8vdjgS6Bz8KE0E2VDgvQ2slyQ6B29zNlavSSxH05
 1arRHspIyxl+dsy0adG54Ayjv7PDGRq5//JvZ5wEHtlEWjAld6vfQVLC9uiZHgiwIF1S
 LFZg==
X-Gm-Message-State: AN3rC/4KRF455vt2/0ZAVH0UjuBr78cjZ/lI0ygRvy2Z9n9hJ6e7eKav
 O2e0stQ+2BJ4+xgf
X-Received: by 10.99.218.69 with SMTP id l5mr6123406pgj.88.1494021707030;
 Fri, 05 May 2017 15:01:47 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:46 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH v2 12/15] aspeed: Enable I2C in EVB defconfig
Date: Fri,  5 May 2017 15:01:12 -0700
Message-Id: <20170505220115.143025-13-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:49 -0000

Enable I2C driver in ast2500 Eval Board defconfig.
Also enable i2c command.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2: None
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
2.13.0.rc1.294.g07d810a77f-goog
