Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PDPS1NQFzF39x;
 Tue,  2 Oct 2018 06:28:11 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2018 13:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,328,1534834800"; d="scan'208";a="79022368"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga006.jf.intel.com with ESMTP; 01 Oct 2018 13:27:51 -0700
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
Subject: [PATCH i2c-next v4 2/3] i2c: aspeed: Add 'timeout' DT property
 reading code
Date: Mon,  1 Oct 2018 13:27:47 -0700
Message-Id: <20181001202748.8030-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001202748.8030-1-jae.hyun.yoo@linux.intel.com>
References: <20181001202748.8030-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Mon, 01 Oct 2018 20:28:13 -0000

This commit adds reading code of the 'timeout' DT property to set
bus timeout value in adapter configuration. This value still
can be configured through an I2C_TIMEOUT ioctl on cdev too.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 8dc9161ced38..6d31f54a6653 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -885,6 +885,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	struct clk *parent_clk;
 	struct resource *res;
 	int irq, ret;
+	u32 timeout_ms;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
@@ -918,6 +919,11 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		bus->bus_frequency = 100000;
 	}
 
+	ret = of_property_read_u32(pdev->dev.of_node, "timeout",
+				   &timeout_ms);
+	if (ret)
+		timeout_ms = 0; /* then adap.timeout will be set by i2c-core */
+
 	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
 	if (!match)
 		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
@@ -930,7 +936,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	init_completion(&bus->cmd_complete);
 	bus->adap.owner = THIS_MODULE;
 	bus->adap.retries = 0;
-	bus->adap.timeout = 5 * HZ;
+	bus->adap.timeout = timeout_ms ? msecs_to_jiffies(timeout_ms) : 0;
 	bus->adap.algo = &aspeed_i2c_algo;
 	bus->adap.dev.parent = &pdev->dev;
 	bus->adap.dev.of_node = pdev->dev.of_node;
-- 
2.19.0
