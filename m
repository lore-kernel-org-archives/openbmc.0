Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfmc10GxHzDqY2
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 23:22:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="A7ZYl/gs"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DpmLdRXn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF3FB207FD;
 Fri, 10 Mar 2017 07:22:22 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 10 Mar 2017 07:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=NoEEY3DxvUMWP0P4xAp9V5OP/kY
 =; b=A7ZYl/gsy8Lcesitynfp8kJw47vLLlz8mI+rkWw0m0f2MfqIRbXz3KbJjW5
 Aq2vd61oPQHRukAIJlTapGX69Vbvki/Z5LLeoXxp8WOZVaX4t44SIDYt1e+7oqAM
 Vw8FYb1Yr2BOWdLl5NzMXkzcP8MLPu8jq7mjRDsaKu/U9CvY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=No
 EEY3DxvUMWP0P4xAp9V5OP/kY=; b=DpmLdRXn4LrMzTI2e8BJy8MuC67/zdlC6P
 Erql2NhYRFpa80aXmiZaoEqMs3KB7wd4YvEUqbnkuAkAcm0q7OTnabLfC7mc8nfN
 Agc5EEFa3JT83ewz1kZSE7PA4pE1bW8eeqwlOPNPWJYcwywjtFa+lvBITGta+QYQ
 VtyW2sOCE=
X-ME-Sender: <xms:fprCWDTELMGZx8yecVrS4HGFCFl6yx9QlQDC4H9HrTtKOrfF5S5HyQ>
X-Sasl-enc: 6+ZmA5NrvhY7JD6ZwARgJ704A7fyqaDdyEdZWQjqe+rq 1489148541
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C0D77E16E;
 Fri, 10 Mar 2017 07:22:19 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, miltonm@us.ibm.com,
 wghoffa@us.ibm.com, patrick@stwcx.xyz, xow@google.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
Date: Fri, 10 Mar 2017 22:51:35 +1030
Message-Id: <20170310122135.29827-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Fri, 10 Mar 2017 12:22:26 -0000

Protect against suspect hardware causing the bus to read off more data
than defined in the SMBus specification.

Some investigation that suggests that the DEVICE_ID command (0xfd) to
a UCD9000 occasionally returns all 0xff, causing the bus driver to
overrun the 34-byte data buffer provided by the I2C core with a 255-byte
broken response. This patch should prevent trashing the stack and also
cause the UCD9000's probe to fail.

The I2C core doesn't help itself in this case as it does not provide any
means for the bus driver to sanity check the caller-provided
response-buffer length against the device-provided payload length. At
the point where we perform the I2C transfers for the SMBus protocol
we've lost the information about what type of transaction is being
performed (i.e. that we're performing an SMBus block transfer), so we
cannot in general make assumptions about the buffer size based on the
protocol (i2c, SMBus, PMBus).  Further, struct i2c_msg is defined in the
uapi headers so no further members (e.g. a length field) can be added
without breaking userspace.

Instead, let's expand the buffers such that they will fit any payload
length reported by the bus.

The patch has been tested on a Zaius system, consecutively unbinding and
binding the UCD9000 driver over 1000 times. Whilst errors were reported
during probe in some cases ("ucd9000: probe of 0-0064 failed with error
-74"), the BMC remained stable and did not reboot. Triggering the bug
without the patch typically at most requires in the order of 100
unbind/bind attempts, often significantly less.

Finally, the host was successfully powered up immediately after the 1000
unbind/bind attempts.

Suggested-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/i2c/i2c-core.c | 61 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index af11b658984d..072fd82920a2 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -2894,16 +2894,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 				   char read_write, u8 command, int size,
 				   union i2c_smbus_data *data)
 {
-	/* So we need to generate a series of msgs. In the case of writing, we
-	  need to use only one message; when reading, we need two. We initialize
-	  most things with sane defaults, to keep the code below somewhat
-	  simpler. */
-	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
-	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
+	/*
+	 * So we need to generate a series of msgs. In the case of writing, we
+	 * need to use only one message; when reading, we need two. We initialize
+	 * most things with sane defaults, to keep the code below somewhat
+	 * simpler.
+	 *
+	 * Also, allocate 256 byte buffers as protection against suspect
+	 * hardware like the UCD90xx, where on occasion the returned block
+	 * length is 0xff[1].
+	 *
+	 * [1] https://github.com/openbmc/openbmc/issues/998
+	 */
+	unsigned char *msgbuf0 = kmalloc(0x100, GFP_KERNEL);
+	unsigned char *msgbuf1 = kmalloc(0x100, GFP_KERNEL);
 	int num = read_write == I2C_SMBUS_READ ? 2 : 1;
-	int i;
 	u8 partial_pec = 0;
 	int status;
+	s32 ret;
+	int i;
+
 	struct i2c_msg msg[2] = {
 		{
 			.addr = addr,
@@ -2918,6 +2928,9 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		},
 	};
 
+	if (!(msgbuf0 && msgbuf1))
+		return -ENOMEM;
+
 	msgbuf0[0] = command;
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -2970,7 +2983,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 				dev_err(&adapter->dev,
 					"Invalid block write size %d\n",
 					data->block[0]);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto out;
 			}
 			for (i = 1; i < msg[0].len; i++)
 				msgbuf0[i] = data->block[i-1];
@@ -2983,7 +2997,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			dev_err(&adapter->dev,
 				"Invalid block write size %d\n",
 				data->block[0]);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 		msg[0].len = data->block[0] + 2;
 		for (i = 1; i < msg[0].len; i++)
@@ -3001,7 +3016,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 				dev_err(&adapter->dev,
 					"Invalid block write size %d\n",
 					data->block[0]);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto out;
 			}
 			for (i = 1; i <= data->block[0]; i++)
 				msgbuf0[i] = data->block[i];
@@ -3009,7 +3025,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		break;
 	default:
 		dev_err(&adapter->dev, "Unsupported transaction %d\n", size);
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto out;
 	}
 
 	i = ((flags & I2C_CLIENT_PEC) && size != I2C_SMBUS_QUICK
@@ -3028,14 +3045,18 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	}
 
 	status = i2c_transfer(adapter, msg, num);
-	if (status < 0)
-		return status;
+	if (status < 0) {
+		ret = status;
+		goto out;
+	}
 
 	/* Check PEC if last message is a read */
 	if (i && (msg[num-1].flags & I2C_M_RD)) {
 		status = i2c_smbus_check_pec(partial_pec, &msg[num-1]);
-		if (status < 0)
-			return status;
+		if (status < 0) {
+			ret = status;
+			goto out;
+		}
 	}
 
 	if (read_write == I2C_SMBUS_READ)
@@ -3056,11 +3077,17 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			break;
 		case I2C_SMBUS_BLOCK_DATA:
 		case I2C_SMBUS_BLOCK_PROC_CALL:
-			for (i = 0; i < msgbuf1[0] + 1; i++)
+			for (i = 0;
+			     i < min((size_t)(msgbuf1[0] + 1), sizeof(*data));
+			     i++)
 				data->block[i] = msgbuf1[i];
 			break;
 		}
-	return 0;
+out:
+	kfree(msgbuf0);
+	kfree(msgbuf1);
+
+	return ret;
 }
 
 /**
-- 
2.9.3
