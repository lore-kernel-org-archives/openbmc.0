Return-Path: <sschaeck@cisco.com>
X-Greylist: delayed 633 seconds by postgrey-1.36 at bilbo;
 Sat, 03 Jun 2017 05:52:48 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="LpSWPUiQ"; 
 dkim-atps=neutral
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfZcw1qHLzDqKX
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 05:52:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=685; q=dns/txt; s=iport;
 t=1496433168; x=1497642768;
 h=date:from:to:subject:message-id:mime-version;
 bh=cZxxIxSKLuQceJwK47iour6936oUod1qMgGxaB8N51w=;
 b=LpSWPUiQnpphyvKR2KqztfM+hG1XTjPTepF4A3dEWJVhbwI+Lk35cEFb
 qTG6JUNamz0G75i6XAGSf9lRRwwJnRFHXckeSTBnerfXynvqzWb1RprBN
 Jjim7mCRptU/jZ7+lKOrXYM/M41X75XLhpQ6vZyelRJ7z3sBfARNmEAsP g=;
X-IronPort-AV: E=Sophos;i="5.39,286,1493683200"; d="scan'208";a="432054089"
Received: from alln-core-3.cisco.com ([173.36.13.136])
 by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 02 Jun 2017 19:42:10 +0000
Received: from sjc-ads-246.cisco.com (sjc-ads-246.cisco.com [171.71.190.178])
 by alln-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id v52JgAlV022823
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 2 Jun 2017 19:42:10 GMT
Received: from sjc-ads-246.cisco.com (localhost.localdomain [127.0.0.1])
 by sjc-ads-246.cisco.com (8.13.8/8.13.8) with ESMTP id v52Jg8RA024083;
 Fri, 2 Jun 2017 12:42:08 -0700
Received: (from sschaeck@localhost)
 by sjc-ads-246.cisco.com (8.13.8/8.13.8/Submit) id v52Jg8qi024082;
 Fri, 2 Jun 2017 12:42:08 -0700
Date: Fri, 2 Jun 2017 12:42:08 -0700
From: Stefan Schaeckeler <sschaeck@cisco.com>
To: Joel Stanley <joel@jms.id.au>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, openbmc@lists.ozlabs.org
Subject: [PATCH] drivers: hwmon: aspeed fan driver: call of_node_put() on a
 node not claimed
Message-ID: <20170602194208.GA23541@sjc-ads-246.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.2.2i
X-Mailman-Approved-At: Sun, 04 Jun 2017 20:05:34 +1000
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
X-List-Received-Date: Fri, 02 Jun 2017 19:52:49 -0000

Delete call of_node_put() on a node not claimed with
of_node_get() or by any other means such as for_each_child_of_node().

Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 48403a2..d9161cd 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -802,7 +802,6 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
-	of_node_put(np);
 
 	priv->groups[0] = &pwm_dev_group;
 	priv->groups[1] = &fan_dev_group;
-- 
2.9.3
