Return-Path: <xow@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhhQm0Cf0zDqNY
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 07:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UuMECx1u"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id r133so14202351pgr.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFSLZoC1pcVzi2ewP0t4QWqgbFKizllkiseWHG5FgxM=;
 b=UuMECx1uKUPlhe1EIVFk50gMRr98n7zi8xhPHqHy9bLrm+SOJ+ADqDuqusupw6kxNH
 keCWGBQVh0XzyuoF1wiEuAe8VfWAydKD7YQgfSY/ngPgo2GB46wRSNG68wXCwxw6uHwz
 +mgRRGHjcYQSrs/sztvHOUw0jpfR7fz8ntnzoEe9DcqGJZarNpXWecIRaEoA5SEo1pxY
 OnnkWjX2LdMcEDJxgmc1Z4H0++Ip2/TMvTAQb1uZj+APL2+F/krf98vchUKnu0SY1BF2
 emoCNTYrJ4nNXPxGK0iQJ4mH5ZSw126Ng7vQmDyjF7Xr9xDcDTkfDtWAECVON1IajD2E
 H0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFSLZoC1pcVzi2ewP0t4QWqgbFKizllkiseWHG5FgxM=;
 b=B2MQFw2P7fQPJ0RfAA7dtjGTpD46Gln92Tg9rKGBKsr2HxQW2Nhni/cx8aPqT73ykW
 kUrbGY+cvIENUE+KYWrCVxk3+gp1iAKQPv8WrtwLrL19v0Meeixej2GL/GELln9gBD4J
 5G9UXkS88lG4D540axJWbJStJcmLl8w1aZV+uAyRxCGZ/ZSTpx/3Br0u/PeVLhkmRrgA
 DqJQzgZBnVLQqtXwtf+azRIyqcKyQe5N19GuP7MuEmMNqMl85AX+0/45KQDvIPe+DPQb
 iscoOn3kDJrPF1ZELjPW/wDKEpOMY0jxVjgbrWzBife05ZIIApB1k5ECW8UBtFzJczea
 3NDg==
X-Gm-Message-State: AHYfb5jEcLQTYUZkvi9zwSRiq1hPcLJtzgppEdygmotd2QlkN4W/WxOD
 x0fsSlYgDuqWbre/
X-Google-Smtp-Source: ADKCNb6wYgAOswfbUfwHlk5kv4qDbKK/pVEnByF9zF5NEj0/7JGTey7qMoh7IuIhIufV3aeEn6vkZw==
X-Received: by 10.84.232.136 with SMTP id i8mr2093573plk.184.1504041693877;
 Tue, 29 Aug 2017 14:21:33 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id s77sm5558445pfa.163.2017.08.29.14.21.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Aug 2017 14:21:32 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Xo Wang <xow@google.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] hwmon: (pmbus/lm25066) Offset coefficient depends on CL
Date: Tue, 29 Aug 2017 14:21:16 -0700
Message-Id: <20170829212117.143441-2-xow@google.com>
X-Mailer: git-send-email 2.14.1.342.g6490525c54-goog
In-Reply-To: <20170829212117.143441-1-xow@google.com>
References: <20170829212117.143441-1-xow@google.com>
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:36 -0000

When converting the DIRECT format CURRENT_IN and POWER commands, make
the offset coefficient ("b") predicate on the value of the current limit
setting.

Signed-off-by: Xo Wang <xow@google.com>
---
 drivers/hwmon/pmbus/lm25066.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index a3d912cd3b8d..232b4af13e12 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -488,16 +488,18 @@ static int lm25066_probe(struct i2c_client *client,
 	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
 	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
 	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
-	info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
 	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
-	info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	info->R[PSC_POWER] = coeff[PSC_POWER].R;
 	if (config & LM25066_DEV_SETUP_CL) {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
+		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
 		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
+		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
 	} else {
 		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
+		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
 		info->m[PSC_POWER] = coeff[PSC_POWER].m;
+		info->b[PSC_POWER] = coeff[PSC_POWER].b;
 	}
 
 	return pmbus_do_probe(client, id, info);
-- 
2.14.1.342.g6490525c54-goog
