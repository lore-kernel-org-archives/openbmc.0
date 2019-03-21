Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QH7Z6CF8zDqVM
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 06:35:22 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2LJY40h108757
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 15:35:19 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rce69fnby-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 15:35:19 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Thu, 21 Mar 2019 19:30:14 -0000
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Mar 2019 19:30:11 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2LJUCPc26149116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Mar 2019 19:30:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 556BDBE059;
 Thu, 21 Mar 2019 19:30:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CDE9BE051;
 Thu, 21 Mar 2019 19:30:12 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Mar 2019 19:30:11 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.0 1/7] media: platform: Fix missing spin_lock_init()
Date: Thu, 21 Mar 2019 14:30:04 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19032119-8235-0000-0000-00000E70A4DF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010790; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01177678; UDB=6.00616089; IPR=6.00958375; 
 MB=3.00026097; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-21 19:30:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032119-8236-0000-0000-000044DB7C1F
Message-Id: <1553196610-29595-2-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903210138
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
X-List-Received-Date: Thu, 21 Mar 2019 19:35:23 -0000

From: Wei Yongjun <weiyongjun1@huawei.com>

The driver allocates the spinlock but not initialize it.
Use spin_lock_init() on it to initialize it correctly.

This is detected by Coccinelle semantic patch.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/platform/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index dfec813..692e08e 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1661,6 +1661,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 
 	video->frame_rate = 30;
 	video->dev = &pdev->dev;
+	spin_lock_init(&video->lock);
 	mutex_init(&video->video_lock);
 	init_waitqueue_head(&video->wait);
 	INIT_DELAYED_WORK(&video->res_work, aspeed_video_resolution_work);
-- 
1.8.3.1
