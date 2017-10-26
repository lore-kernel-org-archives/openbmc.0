Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QxuwhJVH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jiCTGQ1I"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMxhT6R6WzDqYv
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 17:20:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DE79E20805;
 Thu, 26 Oct 2017 02:20:39 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 26 Oct 2017 02:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lMP3b5C9VPOyMt6ww
 s+OyQl8fRW0K2EKKXM1wP+sO0c=; b=QxuwhJVH6qSl6GVqIkIqx7H8OQ8Qc5JkA
 uRrfjcJ9v1sjtjtNxtmlOZES0ahPWsIU30uVtsHKzPmmRiPv0uVENqe1FwkboBl4
 DjrXhMrU/BUWINdRaTc6l5OLZkCQx06ETyl3Ya07VLXoRK123Jr9c50o4GfwxEy4
 mqB2qknABXtNupQH2bKFuT81fEIpl063WOm9nZykH0CerFuLwolmJsxvrbXLFlAs
 MAcs+x8d/HM+HUqP8Q1X97ptblEy5OQXTBki4vanh8mxClW856inqXqiUfrw7Hgc
 WSvxMX0AhLKukWAMq9S2vtPDJ2iTWgG/ssIANB8HUlxCpM+SfD/kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lMP3b5C9VPOyMt6wws+OyQl8fRW0K2EKKXM1wP+sO0c=; b=jiCTGQ1I
 YvNtJRjqzxTnuzbdZJzF55TTDIP7SaISvczgnvWBYK/Rh3Q2gFpl0vyN44xmbFt+
 8KF7ZhgMZYZwa6PWc/B9NaXolIgaBNkiIQt5m4m4Dcnnr+1B0KTajUKKWUuxFz4V
 pgPFUE+IZR38UMpVBceOmmTnqlZzYRVu/gH8ztJmdW1+lA0eo2KNzUdzqStMTApM
 VL18oaapTZsC+wc+vj3DtUfbKcHxcamusAfDAFR3xnRAv2nZJY9Zd7/fFDMSfhru
 nYvfBxZq+lJTEH6thLciCZRFo5ZuF1a1qJE+K9w7LVN52htcsVsyjwY7n3SqXYX7
 xxVC7jU9pbjmdA==
X-ME-Sender: <xms:t37xWX6L2gMZEz694H1fP0vnKfhcjcfdkFrZ1WNVpOc41qZwe6olkA>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 126F3241D9;
 Thu, 26 Oct 2017 02:20:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au,
 Eddie James <eajames@linux.vnet.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 3/3] hwmon: pmbus: core: One-shot retries for
 failure to set page
Date: Thu, 26 Oct 2017 16:49:40 +1030
Message-Id: <20171026061940.25364-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171026061940.25364-1-andrew@aj.id.au>
References: <20171026061940.25364-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Oct 2017 06:20:42 -0000

Work around the shonky behaviour seen with the MAX31785 where we fail
to set the page register in some circumstances.

There's no real elegant way to do this. We can propagate the error up,
but that forces us to retry the operation way up the call tree in any
number of places. It also forces callers to split out pmbus_set_page()
from the pmbus_{read,write}_{byte,word}_data() functions in order to
differentiate between a failure to set the page and a failure to read a
register (that might not exist, in which case an error is anticiptated).

Cc: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 390a7b02b836..d4e959bda491 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -168,7 +168,18 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
 		return 0;
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
+		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
+			data->currpage);
+
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		if (rv) {
+			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+						       page);
+			dev_warn(&client->dev,
+				 "Failed to set page %u, performed one-shot retry %s: %d\n",
+				 page, rv ? "and failed" : "with success", rv);
+		}
+
 		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 		if (newpage != page)
 			return -EIO;
-- 
2.11.0
