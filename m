Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DWr34zd2"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lVKK0CYjzDqRg;
 Fri, 19 Apr 2019 05:58:27 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id e6so1670486pgc.4;
 Thu, 18 Apr 2019 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6m+z7g3EFd1rannjYRxmeahgviDOKxTIyUAGSrZVUCA=;
 b=DWr34zd2tlqExXIm3WBesOBARj1noCVmsnJd9sB4CDKcOPTFqM+mKUpAYwtPhEeyUK
 eQUwJfUy6GuchtcHO/xBbVV+QtX03Cdg9bDdoNcpb0HnpEYol8CZhZ1D3wEGET1PfCFg
 xlYKBLXb9+v09AVZDTsYtz+AXXhBLyqmrgpNhnRSHP6FLuFtd5p0gW20z0Vy3V1BAxP9
 k00xbnz9WEh1o4/bfg4R9jy5rrF4jFdQ8AdTVd12tXqWcnmATpI4JpftmM4VQOW1wE3s
 ffyZUxqJ+bvzxQNW3bCO0AKsusxKbzJVtMelj0BxD7Lk8GzHQLnjkl2ERGCWeS5clFGF
 Ct/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=6m+z7g3EFd1rannjYRxmeahgviDOKxTIyUAGSrZVUCA=;
 b=fu7YkmiZAh4oxuSOIE9G25zm3beUgPzFYe0eSH95xGT8RDOVG+Ufa406ArBQIvsRyK
 yp26SBu6LFL4nxLnwPOSnaUk0LmyfpiS5s/6j7HzuWqDCUZXqsLHHEK5Xb3TIplf07Af
 k41wTgp/W1QsS+4hf6UbxoVHQV/Xe3vW5OaQmxAxThG/ceWJAKZJwmW3++2YdT5mlF1W
 jNVZlhACLUe8l4j4AHjI2ouI0PWjfaiz4TcuPyTWP7t4XATtzFqLb9tiEK0Ex3B2Zcy3
 x1YUXmbP+XfQyReTWRXkkD3qY78cO5yCP1FGZW3wIS6FKX2/3AVitb4aKdHHp+P9+jmc
 YV3w==
X-Gm-Message-State: APjAAAWiaWpJ8hD4fXkGTB9f/g0MEcLFnR/W/Y4WFlRwwFWPtDdbICWY
 AtKSJNfwNVqTqgrU8N7/9us=
X-Google-Smtp-Source: APXvYqwRbJbOKlDFm46pI/cvEGKc9r+XfEiAOCA821wqhwOJr0hWPsAe8hjISyMmbuCrtzlsKv2aGg==
X-Received: by 2002:a63:f444:: with SMTP id p4mr92599928pgk.32.1555617505235; 
 Thu, 18 Apr 2019 12:58:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c17sm3830791pfd.76.2019.04.18.12.58.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 12:58:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-pm@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Kamil Debski <kamil@wypas.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] thermal: Introduce devm_thermal_of_cooling_device_register
Date: Thu, 18 Apr 2019 12:58:15 -0700
Message-Id: <1555617500-10862-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
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
X-List-Received-Date: Thu, 18 Apr 2019 19:58:30 -0000

thermal_of_cooling_device_register() and thermal_cooling_device_register()
are typically called from driver probe functions, and
thermal_cooling_device_unregister() is called from remove functions. This
makes both a perfect candidate for device managed functions.

Introduce devm_thermal_of_cooling_device_register(). This function can
also be used to replace thermal_cooling_device_register() by passing a NULL
pointer as device node. The new function requires both struct device *
and struct device_node * as parameters since the struct device_node *
parameter is not always identical to dev->of_node.

Don't introduce a device managed remove function since it is not needed
at this point.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/thermal/thermal_core.c | 49 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/thermal.h        |  5 +++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 6590bb5cb688..e0b530603db6 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1046,6 +1046,55 @@ thermal_of_cooling_device_register(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
 
+static void thermal_cooling_device_release(struct device *dev, void *res)
+{
+	thermal_cooling_device_unregister(
+				*(struct thermal_cooling_device **)res);
+}
+
+/**
+ * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
+ *					       device
+ * @dev:	a valid struct device pointer of a sensor device.
+ * @np:		a pointer to a device tree node.
+ * @type:	the thermal cooling device type.
+ * @devdata:	device private data.
+ * @ops:	standard thermal cooling devices callbacks.
+ *
+ * This function will register a cooling device with device tree node reference.
+ * This interface function adds a new thermal cooling device (fan/processor/...)
+ * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
+ * to all the thermal zone devices registered at the same time.
+ *
+ * Return: a pointer to the created struct thermal_cooling_device or an
+ * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
+ */
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev,
+				struct device_node *np,
+				char *type, void *devdata,
+				const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device **ptr, *tcd;
+
+	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	tcd = __thermal_cooling_device_register(np, type, devdata, ops);
+	if (IS_ERR(tcd)) {
+		devres_free(ptr);
+		return tcd;
+	}
+
+	*ptr = tcd;
+	devres_add(dev, ptr);
+
+	return tcd;
+}
+EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
+
 static void __unbind(struct thermal_zone_device *tz, int mask,
 		     struct thermal_cooling_device *cdev)
 {
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 5f4705f46c2f..43cf4fdd71d4 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -447,6 +447,11 @@ struct thermal_cooling_device *thermal_cooling_device_register(char *, void *,
 struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device_node *np, char *, void *,
 				   const struct thermal_cooling_device_ops *);
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev,
+				struct device_node *np,
+				char *type, void *devdata,
+				const struct thermal_cooling_device_ops *ops);
 void thermal_cooling_device_unregister(struct thermal_cooling_device *);
 struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name);
 int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
-- 
2.7.4
