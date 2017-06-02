Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfn6DbyzDqKp
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:23:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bz2wcAr7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZGuTRVgc"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C05420842;
 Fri,  2 Jun 2017 02:23:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=WPEhAv
 4tEpX3WHJssRO8+QRTNeE23V1E73adzmfhEhQ=; b=Bz2wcAr7gpBFaU0DB4akbM
 YappVw+/gQMzexgwjCQWYKJdn7wHB9XcOAfJep1WOXa5TtL19UH9YRGyUvD1xg/a
 wqvGxhfVG0LiB3hNXF5TMN5TqlvnZTn3ziQdw7KoPcqTr1STChw51QPy0nTW3NWn
 sHVxq7uADKJzXnvDI2OZTFmO8XkCRnEAM6P9HeLgBbcVnvn3pGruDx9mqeO19JiO
 MMXCnloMOar6BKY1j3pcVG7CuxkZPb8M3NNKhPXC4utxxyEp31ZMNMsyjhy3XMUH
 5FzXF/gVD+IlO7s3Q5VtD6OBRfoUc1zXHSLGt8OTJ9x9c+nQuA5Zto0/wFIoFceg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=WPEhAv4tEpX3WHJssRO8+QRTNeE23V1E73adzmfhE
 hQ=; b=ZGuTRVgcrAm5gGjHzDppqCLZNm6OlhpVYNE0fT1Ktz0GXZo8W+kiBAPXD
 RlECrUlZv0E95mT97LaTVXMhkJdxH6orPWgAMtADglBJu4DyJoGHvM/KpQyrRfom
 bAqmf3vN3kd1f5myA1/H5MnRAMJRnUg2Yl8zSU14uX+xybtFY9KbXXbTt7e6tQwb
 c4/DHLYhS6ntgnTk1MjmgV3DfJvzK2tHyddMAerkppxA+MZI6TOCbkkvrKNExPPX
 Xto6GzuC+PfBVCHOa0oTJ2J+hRRXquIEETkehDr66LLPV+JPvwbyXDVpPUqSTF52
 o8arzIyeBhmXW+vaeASPfZtRGSvlQ==
X-ME-Sender: <xms:TwQxWbbVggt8hRM5Kn3ChzZOfFYy8Eu4e2SUb9DFy8GYUZKXsFwNgQ>
X-Sasl-enc: 4udM6SGJFmX2ubk+aZeQzMr5uoCu8klJ3/jsOeZJu5Yh 1496384590
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C8D8240F6;
 Fri,  2 Jun 2017 02:23:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, cbostic@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com
Subject: [RFC PATCH linux dev-4.10 5/7] i2c: Add bogus I2C_SMBUS_DWORD_DATA
 bus protocol/transaction type
Date: Fri,  2 Jun 2017 15:52:05 +0930
Message-Id: <20170602062208.15999-6-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 06:23:15 -0000

Added so we can issue 4-byte read commands without invoking a block
transfer (which requires the length to be sent by the slave in the first
byte). The 0x3040 revision of the MAX31785 firmware can return a 'fast'
rotor read, and does so in this 4-byte format.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/i2c/i2c-core.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/i2c.h      |  2 ++
 include/uapi/linux/i2c.h |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 583e95042a21..4c8fe52df8ad 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -3210,6 +3210,18 @@ s32 i2c_smbus_read_word_data(const struct i2c_client *client, u8 command)
 }
 EXPORT_SYMBOL(i2c_smbus_read_word_data);
 
+s64 i2c_smbus_read_dword_data(const struct i2c_client *client, u8 command)
+{
+	union i2c_smbus_data data;
+	int status;
+
+	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
+				I2C_SMBUS_READ, command,
+				I2C_SMBUS_DWORD_DATA, &data);
+	return (status < 0) ? status : data.dword;
+}
+EXPORT_SYMBOL(i2c_smbus_read_word_data);
+
 /**
  * i2c_smbus_write_word_data - SMBus "write word" protocol
  * @client: Handle to slave device
@@ -3443,6 +3455,17 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 				msgbuf0[i] = data->block[i];
 		}
 		break;
+	case I2C_SMBUS_DWORD_DATA:
+		if (read_write == I2C_SMBUS_READ)
+			msg[1].len = 4;
+		else {
+			msg[0].len = 5;
+			msgbuf0[1] = data->dword & 0xff;
+			msgbuf0[2] = (data->dword >> 8) & 0xff;
+			msgbuf0[3] = (data->dword >> 16) & 0xff;
+			msgbuf0[4] = (data->dword >> 24) & 0xff;
+		}
+		break;
 	default:
 		dev_err(&adapter->dev, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
@@ -3486,6 +3509,13 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		case I2C_SMBUS_PROC_CALL:
 			data->word = msgbuf1[0] | (msgbuf1[1] << 8);
 			break;
+		case I2C_SMBUS_DWORD_DATA:
+			data->dword =
+				(msgbuf1[0] << (0 * 8)) |
+				(msgbuf1[1] << (1 * 8)) |
+				(msgbuf1[2] << (2 * 8)) |
+				(msgbuf1[3] << (3 * 8));
+			break;
 		case I2C_SMBUS_I2C_BLOCK_DATA:
 			for (i = 0; i < data->block[0]; i++)
 				data->block[i+1] = msgbuf1[i];
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 4b45ec46161f..ff15b25bdeda 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -95,6 +95,8 @@ extern s32 i2c_smbus_read_word_data(const struct i2c_client *client,
 				    u8 command);
 extern s32 i2c_smbus_write_word_data(const struct i2c_client *client,
 				     u8 command, u16 value);
+extern s64 i2c_smbus_read_dword_data(const struct i2c_client *client,
+				     u8 command);
 
 static inline s32
 i2c_smbus_read_word_swapped(const struct i2c_client *client, u8 command)
diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 009e27bb9abe..63ab01e3faa2 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -131,6 +131,7 @@ struct i2c_msg {
 union i2c_smbus_data {
 	__u8 byte;
 	__u16 word;
+	__u32 dword;
 	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
 			       /* and one more for user-space compatibility */
 };
@@ -150,5 +151,6 @@ union i2c_smbus_data {
 #define I2C_SMBUS_I2C_BLOCK_BROKEN  6
 #define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
 #define I2C_SMBUS_I2C_BLOCK_DATA    8
+#define I2C_SMBUS_DWORD_DATA	    9
 
 #endif /* _UAPI_LINUX_I2C_H */
-- 
2.11.0
