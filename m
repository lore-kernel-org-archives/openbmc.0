Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="TEOTUb93"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kqqX4j5TzDq6Q
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 04:03:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A911941908;
 Wed, 17 Apr 2019 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1555524228; x=
 1557338629; bh=BCcjVkQZyJ1iL3Octrz1ZKodOFLa8aZ965FyOmOrgzk=; b=T
 EOTUb93eNbdpcyoNTuAxNKZphs9PzHtozboFayuGnDLHIcWouUpl/ZmrlmBCY3eV
 k+1dEkTdDvrU4i1O4kzXtv99dG+ZHNtc8w7zyLQHRieJaXHdaNcQIlCB4qPHMwbS
 uVq0b8Rw7qLYiY6JVZZ8whHZs48jg47C23a5g2wUCU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBu066Gvh7oJ; Wed, 17 Apr 2019 21:03:48 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 268B2418FC;
 Wed, 17 Apr 2019 21:03:48 +0300 (MSK)
Received: from cinnamon.dev.yadro.com (172.17.14.197) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 17 Apr 2019 21:03:47 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
To: <linux-hwmon@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, Alexander Soldatov <a.soldatov@yadro.com>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Edward A . James"
 <eajames@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 1/1] hwmon (occ): Add temp sensor value check
Date: Wed, 17 Apr 2019 21:03:29 +0300
Message-ID: <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
References: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2019 18:03:53 -0000

From: Alexander Soldatov <a.soldatov@yadro.com>

The occ driver supports two formats for the temp sensor value.

The OCC firmware for P8 supports only the first format, for which
no range checking or error processing is performed in the driver.
Inspecting the OCC sources for P8 reveals that OCC may send
a special value 0xFFFF to indicate that a sensor read timeout
has occurred, see

https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395

That situation wasn't handled in the driver. This patch adds invalid
temp value check for the sensor data format 1 and handles it the same
way as it is done for the format 2, where EREMOTEIO is reported for
this case.

Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
Cc: Edward A. James <eajames@us.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/occ/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 4679acb..825631c 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -235,6 +235,12 @@ static ssize_t occ_show_temp_1(struct device *dev,
 		val = get_unaligned_be16(&temp->sensor_id);
 		break;
 	case 1:
+		/*
+		 * If a sensor reading has expired and couldn't be refreshed,
+		 * OCC returns 0xFFFF for that sensor.
+		 */
+		if (temp->value == 0xFFFF)
+			return -EREMOTEIO;
 		val = get_unaligned_be16(&temp->value) * 1000;
 		break;
 	default:
-- 
2.7.4
