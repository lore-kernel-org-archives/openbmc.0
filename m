Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrcbG3cdBzDqhv
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 13:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CVNPQZie"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id e187so5173871pgc.3
 for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2017 20:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=qoTSdsVuqCgmtXkTM7a7yHx92hebndwmvvb2/+BIsro=;
 b=CVNPQZiemwJVcflYq2H7lZ3M1qoyBIc8HOXrSYGPHrB9AWGlUdK+zytl5NQ0Mp+IxB
 aTbcUSUTfzmB6cYDRxOwE7KUGNMGVDsJdAIZesG/PXihddeiOsA/sQWCnM+esDYiVtgT
 6FSCkhTCG+dxMyOMdw+3eJLpXbcV1KLPyQ1YbeF2wtHOWfh1cPipg8RPpuknOyY0DpVh
 IP2XMCmQtDXMAYq0ExpHZ0rpghQ8jS6NgY/2wGevrZVsvSPbd1GwPoitHQ6Rb93gZhJB
 I06sMKz3q/J8rLRgKcjei9KMuEjC+eIB1Dig0cHNGrF/hSgesnBemInjhoT9FKTDrNvM
 Dq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=qoTSdsVuqCgmtXkTM7a7yHx92hebndwmvvb2/+BIsro=;
 b=eqE8/NSmJucVq2nzjmmJKLcYssQl5t+5rDO/6mgrvz9jY/FepICyhHt3Ud5bcB7hxV
 va8cz/kz+/tYkacUQww6VIPlq1U83VCiGCUpmwSnIum7ILO4McHdFp2t4tz42PZkFA7z
 XljGO7Z6uIqYS2KPveoNmcrzvWuo7dWzxH2nQkbN5H2UhIqgeN9xsKzz3Yp+QAAmedRt
 IGn108o1aKtIZnZ3e0ut+QVr4YOMVUps6RLTYIa1Rw8pd2GiQ95eYQP/G/0vwqVPnKbm
 tujzm+MPOPz4HI4bz5kOuUPIkxXQ6xuIfTSkNiRfAXYkaEn4S+vDVzQbyh4emLgtXabo
 niiA==
X-Gm-Message-State: AKS2vOw7GlvwSV874bFN3AdLmwVlN02WdKk7/lZnJIVgHojRXMdoekSy
 1qVkA+IvaYrNmgKFGog=
X-Received: by 10.84.205.70 with SMTP id o6mr27536540plh.32.1497844568557;
 Sun, 18 Jun 2017 20:56:08 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 66sm20487685pgh.59.2017.06.18.20.56.06
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Jun 2017 20:56:07 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 19 Jun 2017 13:26:01 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 2/2] ARM: configs: aspeed_g5: Add DPS310
 driver
Date: Mon, 19 Jun 2017 13:25:49 +0930
Message-Id: <20170619035549.18773-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170619035549.18773-1-joel@jms.id.au>
References: <20170619035549.18773-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 19 Jun 2017 03:56:11 -0000

Enables the DPS310 driver for Witherspoon OpenBMC platforms.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 49bc0d044c7c..29206d1b70e9 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -177,6 +177,7 @@ CONFIG_IIO=y
 CONFIG_ASPEED_ADC=y
 CONFIG_MAX1363=y
 CONFIG_BMP280=y
+CONFIG_DPS310=y
 CONFIG_FSI=y
 CONFIG_FSI_MASTER_GPIO=y
 CONFIG_FSI_MASTER_HUB=y
-- 
2.11.0
