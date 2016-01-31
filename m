Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7F51A0087
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 01:12:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454249429905464.5877169466262;
 Sun, 31 Jan 2016 06:10:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] add back in poll data init
Date: Sun, 31 Jan 2016 08:10:28 -0600
Message-Id: <1454249428-21611-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454249428-21611-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454249428-21611-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 31 Jan 2016 14:12:24 -0000

From: Norman James <njames@us.ibm.com>

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 drivers/hwmon/power8_occ_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
index e814ac4..c9c70d1 100644
--- a/drivers/hwmon/power8_occ_i2c.c
+++ b/drivers/hwmon/power8_occ_i2c.c
@@ -579,6 +579,8 @@ static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
 	int ret;
 	uint8_t poll_cmd_data;
 
+	poll_cmd_data = 0x10;
+
 	/*
 	 * TODO: fetch header, and then allocate the rest of the buffer based
 	 * on the header size. Assuming the OCC has a fixed sized header
-- 
2.6.4
