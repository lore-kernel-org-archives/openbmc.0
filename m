Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wH9vR6tQPzDqFJ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 16:13:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rbn6h3J9"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id s62so7736391pgc.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U0JMwFzHbHf8g32G63Ts38NjRv5xz1XMSoTn6MMyPWY=;
 b=rbn6h3J9iFB32yG4HzeWrqzTUx2z1TP+zn1oaRGpi5b531fYlr0iDdobNuPl4pkm8u
 B4nEhrZyd0mNL0YYWSYHcl6ZfbhVmuvFUjRYRGeMOPFOghC2oQM8Q2OYElDxuvgRqUf0
 8DyUvmAzyzWyO7hixxgFq3tLtdoK7ZFRbxY3G0IfyB8cOFiB8Ush66MHi03NWue8yiJa
 zTUz9CzcsnMSlcXnkmEUBEGMS47FJ7ilnjBScMol98jBcOipFaJNtaegLzTA1rlEffYw
 +af0dReulUHg/nZxYDjXUoPNgC3C5zL2y0JOXh0B+SR75i8XhF5NcgqGwRuCX0Yh0Fyv
 Y33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=U0JMwFzHbHf8g32G63Ts38NjRv5xz1XMSoTn6MMyPWY=;
 b=oVEFcxKQ5psFc2ScuIuFJ4QJ1BnDnkLrvmL7PaHUZOCAsLOY4sd5wgBj288MUpderv
 cbBw33uBFTLQ8ycmC+S4leDcLhWhCATyBKgsFkWdrkuY2/jKQATeR5tRp+qAQWQh7cUL
 ne0n7oATtcZ/T3o+gDGqwzZ0bDehD+I8MgGciL+gIYPBHf4ElVylBFKYxrfgXPXL5O0Z
 wq5xgI/2PSA/3VlXjYuV81ttvDaar9qLU/ZWAZy6RxX2vQrOWvC92nYq1Gb2KuD93ZU7
 g2xaBLZJfqnLmCAqmERy2kRlKx7phDXFKi7MSw9mJ4T7Q9uVln7vlcH2VDLhbY7y9ctk
 a0zQ==
X-Gm-Message-State: AN3rC/6Y6bfVTNEDxlAMqT8Z7/yjgJafsNf6fvE7Ymeh/lqMjhwAe5HX
 m/l3Rr6btdfcgQ==
X-Received: by 10.84.217.20 with SMTP id o20mr10559118pli.103.1493705586232;
 Mon, 01 May 2017 23:13:06 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id m125sm26139690pfc.3.2017.05.01.23.13.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 01 May 2017 23:13:05 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 02 May 2017 15:43:00 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH linux dev-4.10 3/3] ARM: configs: aspeed_g5: Add Infineon
 IR35221
Date: Tue,  2 May 2017 15:42:39 +0930
Message-Id: <20170502061239.7677-4-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502061239.7677-1-joel@jms.id.au>
References: <20170502061239.7677-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 02 May 2017 06:13:08 -0000

This hwmon device is present on P9 systems.

OpenBMC-Staging-Count: 1
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 8735e3b2794c..58019757c714 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -139,6 +139,7 @@ CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NCT7904=y
 CONFIG_PMBUS=y
+CONFIG_SENSORS_IR35221=y
 CONFIG_SENSORS_LM25066=y
 CONFIG_SENSORS_UCD9000=y
 CONFIG_SENSORS_TMP421=y
-- 
2.11.0
