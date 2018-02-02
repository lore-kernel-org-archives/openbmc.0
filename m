Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zYCXC5n06zF0d2
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 10:15:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w12NFqo9051204
 for <openbmc@lists.ozlabs.org>; Fri, 2 Feb 2018 18:15:52 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fw0te165f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Feb 2018 18:15:50 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 2 Feb 2018 18:14:51 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 2 Feb 2018 18:14:49 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w12NEm4353543120; Fri, 2 Feb 2018 23:14:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C164112047;
 Fri,  2 Feb 2018 18:12:53 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id A9FC1112034;
 Fri,  2 Feb 2018 18:12:52 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10] drivers: fsi: sbefifo: don't delete canceled
 xfrs in write
Date: Fri,  2 Feb 2018 17:14:47 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18020223-0024-0000-0000-0000031DE90C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008463; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00984166; UDB=6.00499196; IPR=6.00763444; 
 BA=6.00005809; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019342; XFM=3.00000015;
 UTC=2018-02-02 23:14:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020223-0025-0000-0000-000046DAA675
Message-Id: <1517613287-23508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802020280
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 23:15:56 -0000

The write function was deleting canceled transfers before they had a
change to run and complete. This results in not acking the EOT and not
reading the rest of the data left in the FIFO for the canceled transfer.
This is the cause of the EBADMSG errors found in the OCC driver, as the
next op reads the data left over.

Fix it by just checking the first entry of the list instead of
iterating and canceling.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---

Joel, I based this on top of the "Fixup SBEFIFO and OCC locking" series. Let me
know if I need to put this first and rebase that series... thanks.

 drivers/fsi/fsi-sbefifo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 4d024ed..7a6c4e1 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -713,8 +713,10 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	n = sbefifo_buf_nbwriteable(&client->wbuf);
 
 	spin_lock_irqsave(&sbefifo->list_lock, flags);
-	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
 
+	/* next xfr to be executed */
+	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
+				       xfrs);
 	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
 		ret = -EAGAIN;
-- 
1.8.3.1
