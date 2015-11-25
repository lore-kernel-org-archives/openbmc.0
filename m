Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9945A1A033E
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435428801626.432863077288;
 Tue, 24 Nov 2015 23:10:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 4/7] sensorhandler: remove unused variable
Date: Wed, 25 Nov 2015 02:10:21 -0500
Message-Id: <1448435424-9067-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:32 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 sensorhandler.C | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sensorhandler.C b/sensorhandler.C
index cd57dd4..dd83152 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -145,9 +145,6 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     sensor_data_t *reqptr = (sensor_data_t*)request;
     ipmi_ret_t rc = IPMI_CC_OK;
-    unsigned short rlen;
-
-    rlen = (unsigned short) *data_len;
 
     printf("IPMI SET_SENSOR [0x%02x]\n",reqptr->sennum);
 
-- 
2.6.3
