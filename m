Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42R4c31d2qzF3M1;
 Fri,  5 Oct 2018 06:43:47 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2018 13:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,341,1534834800"; d="scan'208";a="92295010"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2018 13:43:27 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH i2c-next v6 2/5] i2c: Add support reading of 'timeout-ms' and
 '#retries' properties
Date: Thu,  4 Oct 2018 13:43:19 -0700
Message-Id: <20181004204322.20665-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181004204322.20665-1-jae.hyun.yoo@linux.intel.com>
References: <20181004204322.20665-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 04 Oct 2018 20:43:48 -0000

This commit adds support for 'timeout-ms' and '#retries' properties
to set 'timeout' and 'retries' values in 'struct i2c_adapter' in
case an adapter node has the properties. Still the values can be
set by I2C_TIMEOUT and I2C_RETRIES ioctls on cdev at runtime too.

These properties may not be supported by all drivers. However, if
a driver wants to support one of them, it should adapt the
bindings in the dt-bindings document.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9ee9a15e7134..433867e9af2f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1214,6 +1214,7 @@ EXPORT_SYMBOL_GPL(i2c_handle_smbus_host_notify);
 static int i2c_register_adapter(struct i2c_adapter *adap)
 {
 	int res = -EINVAL;
+	u32 timeout_ms = 0;
 
 	/* Can't register until after driver model init */
 	if (WARN_ON(!is_registered)) {
@@ -1239,8 +1240,13 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	INIT_LIST_HEAD(&adap->userspace_clients);
 
 	/* Set default timeout to 1 second if not already set */
-	if (adap->timeout == 0)
-		adap->timeout = HZ;
+	if (adap->timeout == 0) {
+		device_property_read_u32(&adap->dev, "timeout-ms", &timeout_ms);
+		adap->timeout = timeout_ms ? msecs_to_jiffies(timeout_ms) : HZ;
+	}
+
+	/* Set retries value if it has the property setting */
+	device_property_read_u32(&adap->dev, "#retries", &adap->retries);
 
 	/* register soft irqs for Host Notify */
 	res = i2c_setup_host_notify_irq_domain(adap);
-- 
2.19.0
