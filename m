Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vj8NY18nHzDqXc
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 20:20:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eBITmXNY"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sYwUsPv8"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D8F220997;
 Tue, 14 Mar 2017 05:20:42 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 14 Mar 2017 05:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=vX/qNT+KNURLQA0vgK27rQcCGYU=; b=eBITmX
 NYwp1cr7yx0ziGiGvAuOuS+VpD8Ky/fVbim0nNWcbDN2iK0BOORQeZikrj7+KM3o
 sry/wqHT91L/QnT2P3pvm4KwnJlsIk1+0jJzAbgm9Z1/Ck44KlE7gEygg2iHf5uL
 pV5STQy1nfK3r437e8ElRf5eHjUiE2eEO7oIM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=vX/qNT+KNURLQA
 0vgK27rQcCGYU=; b=sYwUsPv8eMJqb+9qqPqqlyD0D7xZ47eqrfUamlrQtRObAP
 8GB+DWSZz8mFtEa7nOPxfiBqkG9BNtLReFg4a+EEWDrRtRVu6zqi/eKQpXuqG61a
 P0z2FItOzEplWLsLd/8ujGbi8tpcxdgNbKxlQnspDCyFQI/kVC152vw1tb7L0=
X-ME-Sender: <xms:6rXHWKrk2Go3Herz4aOk_uGPsPMtass5MQxxhy7l_1XXhs6XO2MGuQ>
X-Sasl-enc: IJcHLkscpVBCYjQu7cgQgTNSrudnrumAMJ2ppEyGgerx 1489483241
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 676A424752;
 Tue, 14 Mar 2017 05:20:39 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, miltonm@us.ibm.com, wghoffa@us.ibm.com,
 patrick@stwcx.xyz, xow@google.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.{7,
 10} v2] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
Date: Tue, 14 Mar 2017 19:50:23 +1030
Message-Id: <20170314092023.13994-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 14 Mar 2017 09:20:47 -0000

Protect against suspect hardware causing the bus to read off more data
than defined in the SMBus specification.

Some investigation that suggests that the DEVICE_ID command (0xfd) to
a UCD9xxx power sequencer occasionally returns all 0xff, causing the bus
driver to overrun the 34-byte data buffer provided by the I2C core with
a 255-byte broken response. Usually the result was the following:

         Kernel panic - not syncing: stack-protector: Kernel stack is corrupted
         in: 802e5e38

         CPU: 0 PID: 1559 Comm: zaius_vcs.sh Not tainted
         4.7.10-f26558191540830589fe03932d05577957670b8d #2
         Hardware name: ASpeed SoC
         [<801072f8>] (unwind_backtrace) from [<80105558>] (show_stack+0x10/0x14)
         [<80105558>] (show_stack) from [<8016d06c>] (panic+0xb8/0x248)
         [<8016d06c>] (panic) from [<80110df4>] (__stack_chk_fail+0x10/0x14)
         [<80110df4>] (__stack_chk_fail) from [<802e5e38>]
         (i2c_smbus_xfer+0x508/0x54c)
         [<802e5e38>] (i2c_smbus_xfer) from [<ffffffff>] (0xffffffff)

This patch prevents the broken response from trashing the surrounding
memory and returns an error code up the call-chain.

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

Instead, let's move the buffers off the stack and expand them such that
they will fit any payload length reported by the bus.

The patch has been tested on a Zaius system, consecutively unbinding and
binding the UCD9000 driver over 1000 times. Whilst errors were reported
during probe in some cases ("ucd9000: probe of 0-0064 failed with error
-74"), the system remained stable and did not reboot. Triggering the bug
without the patch typically at most requires in the order of 100
unbind/bind attempts, often significantly less.

Finally, the host was successfully powered up immediately after the 1000
unbind/bind attempts.

Suggested-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/i2c/i2c-core.c | 74 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index af11b658984d..a46c4a39aee8 100644
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
+	 * need to use only one message; when reading, we need two. We
+	 * initialize most things with sane defaults, to keep the code below
+	 * somewhat simpler.
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
+	s32 ret = 0;
 	int status;
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
@@ -3028,17 +3045,23 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
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
 
-	if (read_write == I2C_SMBUS_READ)
+	if (read_write == I2C_SMBUS_READ) {
+		size_t recvd;
+
 		switch (size) {
 		case I2C_SMBUS_BYTE:
 			data->byte = msgbuf0[0];
@@ -3056,11 +3079,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			break;
 		case I2C_SMBUS_BLOCK_DATA:
 		case I2C_SMBUS_BLOCK_PROC_CALL:
-			for (i = 0; i < msgbuf1[0] + 1; i++)
+			recvd = msgbuf1[0] + 1;
+
+			if (recvd > sizeof(*data)) {
+				dev_warn(&adapter->dev,
+						"SMBus block operation received invalid payload length of %zu\n",
+						recvd);
+				return -EIO;
+			}
+
+			for (i = 0; i < recvd; i++)
 				data->block[i] = msgbuf1[i];
+
 			break;
 		}
-	return 0;
+	}
+out:
+	kfree(msgbuf0);
+	kfree(msgbuf1);
+
+	return ret;
 }
 
 /**
-- 
2.9.3
