Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfg2dwJzDqL0
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qCwAcRwO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="p3fBsEju"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B74B12093F;
 Fri,  2 Jun 2017 02:23:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OKVsMM
 VhdktHudoP+3Vkd1t9Z5HQFqjfm0tUDi9iu1k=; b=qCwAcRwOFRyxn2s92a8fJI
 4gm5zf07KrBDcS1Y9WtOpROwoe5bE84UoS/UB2du14FdgPDsPDfVLuKgi7Cadi61
 BB6+0JGxns8N8tbX+mT+YCGPtHv106F/H8LKlFNbLjso4gn7lvblk3leworJiyfi
 vNbKgP48FvPXapvucnXyWeTCOUVkBaA/WD2pF6vABnBoE3Iw2rBj2PgcJftx/dGI
 elHKEI9nj5d6x6EuRKeZ0TyXnRRqUmwsmWD/mz8LBOSQeaJr+QCfejx4znoWHu60
 UEXXduYPrUga8KOu6jjcsF50gmew+vmsmAz2V7y3/WUopLMqkZdG6ZgpLs0svnCw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=OKVsMMVhdktHudoP+3Vkd1t9Z5HQFqjfm0tUDi9iu
 1k=; b=p3fBsEjuqxZmb/GukXK6V2lRqmWVwO9TKm67BSZSVrlrpEpIKRVUpnP65
 02Mlz7lercRhziNRn+EcesSkhwVWvFsIOAy0/lM4BwLIE3U0S5pwQuBf2a96iVDJ
 bGGvyjBF6AnQYv5WTRpOD7e92jxQ3tdNExafg8dmDQnS1CzjelZTCj1JW5sTRZ4X
 p5DCAu2LOkOMgoHEp1sQWPCwzXgS3B9AEmphBK0Rj5HKcv9J9bxCMB/FHl3cPEy1
 Cu2jMuxuHCXpOy6X9Hd0g/kkOmBx7ZEKHHf+D0Zg/isyf3NKC90GMf9w6n7tosw0
 JlFG8Ye2datp5HXvtOtYck9JF8J7g==
X-ME-Sender: <xms:SAQxWazwZSL4D0PrdIRqAODY8vVWqH0zlNif9GjxM4jfo7czqbFhyw>
X-Sasl-enc: mArZYO/qCJ2sQseqJxB/gFVecbeVDbkDgFf0zuYNafue 1496384584
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4743424009;
 Fri,  2 Jun 2017 02:23:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, cbostic@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com
Subject: [RFC PATCH linux dev-4.10 3/7] hwmon: max31785: Document
 implementation oddities
Date: Fri,  2 Jun 2017 15:52:03 +0930
Message-Id: <20170602062208.15999-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170602062208.15999-1-andrew@aj.id.au>
References: <20170602062208.15999-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 06:23:08 -0000

Some possible bugs are discussed, and the implementation semantics of
fall-through cases in switch statements are documented.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fb7b3f010bd8..ad86082ffc7d 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -167,7 +167,12 @@ static struct max31785_data *max31785_update_device(struct device *dev)
 			}
 
 			if (!is_automatic_control_mode(data, i)) {
-				/* Poke watchdog for manual fan control */
+				/*
+				 * Poke watchdog for manual fan control
+				 *
+				 * XXX: This isn't documented in the MAX31785
+				 * datasheet, or anywhere else.
+				 */
 				rv = max31785_write_fan_data(client,
 					i, MAX31785_REG_FAN_COMMAND_1,
 					data->fan_command[i], 0);
@@ -290,6 +295,7 @@ static ssize_t set_fan_pulses(struct device *dev,
 	if (pulses > 4)
 		return -EINVAL;
 
+	/* XXX: This sequence disables the fan and sets in PWM mode */
 	data->fan_config[attr->index] &= MAX31785_FAN_CFG_PULSE_MASK;
 	data->fan_config[attr->index] |=
 				((pulses - MAX31785_FAN_CFG_PULSE_OFFSET)
@@ -297,8 +303,23 @@ static ssize_t set_fan_pulses(struct device *dev,
 
 	mutex_lock(&data->device_lock);
 
-	/* Write new pulse value */
+	/*
+	 * XXX: This seems suspect. Pulses must be in [1, 4], however
+	 * fan_command expects the following ranges:
+	 *
+	 * PWM:
+	 * [0x0000, 0x2710]: [0, 100]% PWM duty cycle
+	 * [0x2711, 0x7fff]: 100% PWM duty cycle
+	 *
+	 * RPM:
+	 * [0x0000, 0x7fff]: [0, 32767]RPM
+	 * [0x8000, 0xffff]: Automatic fan control
+	 *
+	 * In all cases [1-4] is quite low
+	 */
 	data->fan_command[attr->index] = pulses;
+
+	/* Write new pulse value */
 	err = max31785_write_fan_data(client, attr->index,
 				MAX31785_REG_FAN_CONFIG_1_2,
 				data->fan_config[attr->index], 1);
@@ -408,8 +429,8 @@ static ssize_t set_pwm_enable(struct device *dev,
 			data->fan_config[attr->index]
 			& ~MAX31785_FAN_CFG_PWM_ENABLE;
 		break;
-	case 1:
-	case 2:
+	case 1: /* fallthrough */
+	case 2: /* fallthrough */
 	case 3:
 		data->fan_config[attr->index] =
 			data->fan_config[attr->index]
-- 
2.11.0
