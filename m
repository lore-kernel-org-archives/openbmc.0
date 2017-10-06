Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0s6CYkzDqnQ
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624eaL038786
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:51 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddwufeta7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:50 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:50 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:47 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626l353998064; Thu, 5 Oct 2017 19:06:47 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F5B6C603E;
 Thu,  5 Oct 2017 20:06:47 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 3C9AFC603C;
 Thu,  5 Oct 2017 20:06:46 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 21/31] drivers: fsi: occ: Switch to more
 logical errnos
Date: Thu,  5 Oct 2017 21:05:43 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0028-0000-0000-00000875E539
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927058; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0029-0000-0000-000037D37CDA
Message-Id: <1507255553-13301-22-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060029
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/occ.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 7e2b770..c2fc14c 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -402,7 +402,7 @@ static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
 		total += rc;
 	} while (total < len);
 
-	return (total == len) ? 0 : -EMSGSIZE;
+	return (total == len) ? 0 : -ENOSPC;
 }
 
 static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
@@ -421,7 +421,7 @@ static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
 		total += rc;
 	} while (total < len);
 
-	return (total == len) ? 0 : -EMSGSIZE;
+	return (total == len) ? 0 : -ENODATA;
 }
 
 static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
@@ -466,7 +466,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
 	    (be32_to_cpu(buf[1]) == 0xC0DEA403))
 		memcpy(data, resp, len);
 	else
-		rc = -EFAULT;
+		rc = -EBADMSG;
 
 free:
 	kfree(resp);
@@ -514,7 +514,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 	/* check for good response */
 	if ((be32_to_cpu(buf[0]) != data_len) ||
 	    (be32_to_cpu(buf[1]) != 0xC0DEA404))
-		rc = -EFAULT;
+		rc = -EBADMSG;
 
 done:
 	sbefifo_drv_release(client);
@@ -551,7 +551,7 @@ static int occ_trigger_attn(struct device *sbefifo)
 	/* check for good response */
 	if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
 	    (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
-		rc = -EFAULT;
+		rc = -EBADMSG;
 
 done:
 	sbefifo_drv_release(client);
@@ -599,7 +599,7 @@ static void occ_worker(struct work_struct *work)
 
 	resp_data_length = get_unaligned_be16(&resp->data_length);
 	if (resp_data_length > OCC_RESP_DATA_BYTES) {
-		rc = -EDOM;
+		rc = -EMSGSIZE;
 		goto done;
 	}
 
-- 
1.8.3.1
