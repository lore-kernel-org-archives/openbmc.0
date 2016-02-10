Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 25DD31A006D
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 12:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145506662604396.5995555038021;
 Tue, 9 Feb 2016 17:10:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] i2c: aspeed: Request irq with bus name
Date: Tue,  9 Feb 2016 19:10:24 -0600
Message-Id: <1455066624-1916-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455066624-1916-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455066624-1916-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2016 01:10:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Request each irq with the unique bus name not a constant string.

The aspeed i2c controller has an irq per bus and this has been
exposed as an irq domain.  However, each irq is requested the same
device name, leaving one to guess which irq in /proc/interrupts
corresponds to which device.  While the controller irq number
is unique and happens to match, it is not obvious that there is
no offset.

The driver registers the bus with the numbered bus api, so the
global bus number is known an we can predict it before registering.
The information that this is from an ast-i2c bus is in the irq
controller name or could be found from the matching i2c bus device
in sysfs.

Excerpt of /proc/interrupts before this patch:
220:       1094   ast-i2c   0 Edge      ast-i2c-bus
221:          0   ast-i2c   1 Edge      ast-i2c-bus
222:       9438   ast-i2c   2 Edge      ast-i2c-bus
223:      26480   ast-i2c   3 Edge      ast-i2c-bus

New excerpt from /proc/interrupts:
220:       1094   ast-i2c   0 Edge      i2c-0
221:          0   ast-i2c   1 Edge      i2c-1
222:       9438   ast-i2c   2 Edge      i2c-2
223:      26480   ast-i2c   3 Edge      i2c-3
224:          0   ast-i2c   4 Edge      i2c-4

New example proc/irq/ directory:
/proc/irq/222:
i2c-2     spurious

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index e4bf88a3..6aad22a 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -684,6 +684,7 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 	struct ast_i2c_bus *bus;
 	struct resource res;
 	int ret, bus_num;
+	char *irq_name;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
@@ -713,8 +714,9 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "i2c-%d", bus_num);
 	ret = devm_request_irq(&pdev->dev, bus->irq, ast_i2c_bus_irq,
-			0, "ast-i2c-bus", bus);
+			0, irq_name, bus);
 	if (ret) {
 		dev_err(&pdev->dev, "devm_request_irq failed\n");
 		return -ENXIO;
-- 
2.7.1
