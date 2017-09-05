Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eyGXz9yr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ptUV5+Vm"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmdd458d6zDrFs
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 17:29:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 77C1B20C18;
 Tue,  5 Sep 2017 03:29:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 05 Sep 2017 03:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=BNesVt
 2G9D+3l8VuC1v3kZh9NgjcyWWpcAGZyVGE1UQ=; b=eyGXz9yrvNN49CMvVa5099
 oeSNLQyNYe0M5aKWv6HaCqiOYjpVVIkeWmVNiyKKFtrVXk5VSHnYPNLTM17yVKAG
 bHsLwSWuzIrJFtg2gtA4p9gN1A+7bnBv4bdwMkIZPRvExrJ7DSNqpbb1GGVpuKRg
 nPzTxepbWxEGlxcZ3FUcFUSwIDdmv6yhSNAjz+0oube6Zfs231Dx5RNBnwCN3N3I
 l2zV3FUG//Px84Vt9gn2+ip03Oh2SLIxvzyF410DrbnRcknP5qMRUyypip/MAhgn
 Lu+7pge1b0pGuxLUor0un+UPNUeMmS+AAWEBF7RlARE2VKoz5GnQZhnZ8XS1jHHg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=BNesVt2G9D+3l8VuC1v3kZh9NgjcyWWpcAGZyVGE1
 UQ=; b=ptUV5+VmNqM3myT/X0pfYddnBnBjSDcLe5Z0or9PqgGmaHOsDq0exrbJ0
 92cfPinNxJY28L7qK+6bQWa1ZUo/FIW7EEnFrUZGC8JXJGjYVUpjvytWyhracvLq
 1pAaacdB3esU38SKYcd3b2JAIATYVOZMIJe5eStYbXhQ0YInwGzb7fXyCwIo4Hwc
 ioZTSd0PKUbcwjqCe78ajCKW8/cK5bHotnHtFCnpeBWYU/o6thhoY1R5v4E7eP9U
 R9q5kmEfIfPUvD3bcPBCIU1TFFjEMBjAdF1AaGTMcBmdtO0uUkbG37r7RaWVwXlU
 FbWU68V9n4CyfYg/I2QjGa/zBoSQA==
X-ME-Sender: <xms:RlKuWTb9pV7qSykp-D-07GDEjwCG6f3Pdnjnc8J2ZGImY-z9idpIKQ>
X-Sasl-enc: cwJTC2ttSaqPk76f49t/+8MIXkpDtCrJr7FcUtj529Pd 1504596549
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93A257FA75;
 Tue,  5 Sep 2017 03:29:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au
Subject: [PATCH 3/3] pmbus: max31785: Add handler for set_page() and
 PMBUS_CLEAR_FAULTS virt pages
Date: Tue,  5 Sep 2017 17:28:28 +1000
Message-Id: <20170905072828.8749-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170905072828.8749-1-andrew@aj.id.au>
References: <20170905072828.8749-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 05 Sep 2017 07:29:13 -0000

The max31785 uses the concept of 'virtual pages' to manage dual tach
fan inputs. These pages don't exist in hardware by definition, so don't
send spurious PAGE or CLEAR_FAULTS commands to the device for these
pages.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 6a0d289ad346..a1e5f24c9744 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -117,11 +117,23 @@ static int max31785_read_byte_data(struct i2c_client *client, int page,
 	return -ENODATA;
 }
 
+static int max31785_set_page(struct i2c_client *client, int page)
+{
+	return (page < MAX31785_NR_PAGES) ? -ENODATA : 0;
+}
+
 static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
 {
 	if (page < MAX31785_NR_PAGES)
 		return -ENODATA;
 
+	switch (value) {
+	case PMBUS_CLEAR_FAULTS:
+		return 0;
+	default:
+		break;
+	}
+
 	return -ENOTSUPP;
 }
 
@@ -604,6 +616,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 static const struct pmbus_driver_info max31785_info = {
 	.pages = MAX31785_NR_PAGES,
 
+	.set_page = max31785_set_page,
 	.write_word_data = max31785_write_word_data,
 	.read_byte_data = max31785_read_byte_data,
 	.read_word_data = max31785_read_word_data,
-- 
2.11.0
