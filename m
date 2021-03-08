Return-Path: <SRS0=wJXT=IG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C05C433E9
	for <openbmc@archiver.kernel.org>; Mon,  8 Mar 2021 23:10:42 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E39465177
	for <openbmc@archiver.kernel.org>; Mon,  8 Mar 2021 23:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E39465177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYwc0xLMz3dSw
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 10:10:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apyemrhQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=apyemrhQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYZ26XhXz3cQ0
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MYfdv060904; Mon, 8 Mar 2021 17:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P1sjrZuoc+DHvVd3Og0hVYljjFgI26y0ukIq/pf50ek=;
 b=apyemrhQYCwgvhIFpLm3gegAoNaZjIqC9ESs/QBblKWlbd/hWi24LyBVebEOJ0ipuht1
 GCOPORFN7a4Q39Nj6lNnShZQ2h7ltjT0bHFtO3+GlQi+rHf+dop9fU6cql/uwYWaZvCa
 LQymyetSWDGkrBz31uQOwXAbLCnqWxBYmLco57gn6S1cDsikHnikj581X2BFcJTCvD3P
 rq3lb1lQA8EfwGM6jpT1SLngPizC2wILSjj9YBxVK6p8jxwmE1FRbTbeA9AQso0fLjGA
 XbYa/Uflh4b4/pTFogH9yV1yDJBp5dv0oFrU/nCj8XSyJHMIZ8G4zTGRxiPWbHj8W8J5 tg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375uwx9gsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:32 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mqr6d018106;
 Mon, 8 Mar 2021 22:54:31 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3741c96eug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:31 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsUji21430650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 150ADC605A;
 Mon,  8 Mar 2021 22:54:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB9C4C6061;
 Mon,  8 Mar 2021 22:54:29 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 33/35] pmbus: (core) Add a one-shot retry in
 pmbus_set_page()
Date: Mon,  8 Mar 2021 16:54:17 -0600
Message-Id: <20210308225419.46530-34-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

From extensive testing and tracing it was discovered that the MAX31785
occasionally fails to switch pages despite ACK'ing the PAGE PMBus data
write. I suspect this behaviour had been seen on other devices as well,
as pmbus_set_page() already read-back the freshly set value and errored
out if it wasn't what we requested.

In the case of the MAX31785 it was shown that a one-shot retry was
enough to get the PAGE write to stick if the inital command failed. To
improve robustness, only error out if the one-shot retry also fails to
stick.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 44c1a0a07509..dd4a09d18730 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -151,25 +151,34 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
 	    data->info->pages > 1 && page != data->currpage) {
+		int i;
+
 		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
 			data->currpage);
 
-		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		if (rv < 0) {
+		for (i = 0; i < 2; i++) {
 			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
 						       page);
-			dev_dbg(&client->dev,
-				"Failed to set page %u, performed one-shot retry %s: %d\n",
-				page, rv ? "and failed" : "with success", rv);
+			if (rv)
+				continue;
+
+			rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 			if (rv < 0)
-				return rv;
-		}
+				continue;
 
-		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		if (rv < 0)
-			return rv;
+			/* Success, exit loop */
+			if (rv == page)
+				break;
+
+			rv = i2c_smbus_read_byte_data(client, PMBUS_STATUS_CML);
+			if (rv < 0)
+				continue;
+
+			if (rv & PB_CML_FAULT_INVALID_DATA)
+				return -EIO;
+		}
 
-		if (rv != page)
+		if (i == 2)
 			return -EIO;
 	}
 	data->currpage = page;
-- 
2.27.0

