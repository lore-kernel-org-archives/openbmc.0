Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LIz5pksk"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lVKK0fntzDqSP;
 Fri, 19 Apr 2019 05:58:27 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id y3so1652364pgk.12;
 Thu, 18 Apr 2019 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=5vClmzB5ruRG5DfpQI3+/6Tcg0frA3QH3vJ0qCG0ZNU=;
 b=LIz5pkskdLDTvf/wpQtdZB/Rdb3xa6hScC/e0SIcu2CaAAmqoolajQgaIxB3XS92e8
 ivmN4MYM6C6JpabkO9zXBwHUAl0bMfvZaTO0KI2ylmuV+yE8C09qbN6uQBtccQ2iUbEW
 6gMp3VbJEjR0iCRLD3tsNHcPZ3UaDn6Dc4bZ2suoddCPXgNAvum5AC04rixylKsRX+Ct
 JimXJmeBemDobvjQo7ZeRetTLLKtLdqIRLc686g4ag58bNpSKMOWtBpc0oiYJDKzsTId
 IKU3mcxm1P9YugE5CL889/DQJrZcO0N3ZHS7XIiwwJY1Llhr5AZGAH6+zQCffXoEGSNI
 phLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=5vClmzB5ruRG5DfpQI3+/6Tcg0frA3QH3vJ0qCG0ZNU=;
 b=TFp3mpfDlaFJ4QeckTx3uKHXBOCVkVzxQEVNWITUs8mHi8E0nbZ2fQnZLOJBv3VsYb
 5MBR3Hp5DbtvNeTGtmRVnAfgACyt40OLZD7M9WyFcziaajeR2RB3I8Pj4RCM9GBtifXa
 iV46E+DQ2CcB8emmmwKe703koJKsi1yDTEkQt5TA6ujVwfFdti7q18wqumZnHoeoK3+u
 vcuobqR+zeEZVlBYRocLX7AZeaM//k8W9yMXwwyGSWF/i1FZ3Odl356CZ2y3w7a5oZOa
 KfQlC2t1m+FVfXHf6YL8GyEhHoncLe3Vcz4RTssBNy9XiYVrjdct7mdM5tw48RW+ypXG
 YkaQ==
X-Gm-Message-State: APjAAAX2XLgfSUyXI3pLXFL5QFmmiMHOwHAKEj5/I0FCofEwGB4tYHG3
 V/PsKK5rZtXbcG7flfmi+gE=
X-Google-Smtp-Source: APXvYqz9KqL2njowruKOC8kSeVieLJgnycGmub6FNz59l+ivj2LAy9fGa31n4qrBCOJcJJmyVt89KA==
X-Received: by 2002:a62:565c:: with SMTP id k89mr97032823pfb.175.1555617503748; 
 Thu, 18 Apr 2019 12:58:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p66sm5820800pfb.4.2019.04.18.12.58.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 12:58:22 -0700 (PDT)
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
Subject: [PATCH 0/6] thermal: Introduce devm_thermal_of_cooling_device_register
Date: Thu, 18 Apr 2019 12:58:14 -0700
Message-Id: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
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

The patch series introduces the new function and then converts various
hwmon drivers to use it.
