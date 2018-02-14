Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhXfp0lFTzDqYl
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 08:31:58 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1ELTdJl143671
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 16:31:55 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g4ss8qtx8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 16:31:54 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 14 Feb 2018 16:31:53 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Feb 2018 16:31:50 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1ELVoVd38207570; Wed, 14 Feb 2018 21:31:50 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D2B6B204E;
 Wed, 14 Feb 2018 16:28:12 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 31237B205D;
 Wed, 14 Feb 2018 16:28:12 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/3] drivers: fsi: Fixup SBEFIFO and OCC
 locking
Date: Wed, 14 Feb 2018 15:31:45 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18021421-0024-0000-0000-000003238468
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008535; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00989770; UDB=6.00502607; IPR=6.00769124; 
 BA=6.00005830; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019556; XFM=3.00000015;
 UTC=2018-02-14 21:31:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021421-0025-0000-0000-000046FADA15
Message-Id: <1518643908-13449-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802140252
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Feb 2018 21:32:02 -0000

This series provides a couple of fixes designed to make the FSI client drivers
play nicely with Jeremy's incoming FSI spinlock changes. Firstly, the SBEFIFO
driver must switch to use a workqueue instead of a poll timer so that we can
avoid spinlocking the entire function. Therefore, the second patch switches to
a mutex instead of a spinlock there. Lastly, switch to irqsave and irqrestore
functions in the OCC driver to cleanup the locking there.

Changes since v1:
 * lock the mutex around the transfer deletions in sbefifo_remove. Otherwise,
   it may free memory that sbefifo_worker is accessing.

Eddie James (3):
  drivers: fsi: SBEFIFO: switch to workqueue instead of timer
  drivers: fsi: sbefifo: switch to mutex in work function
  drivers: fsi: occ: switch to irqsave and irqrestore

 drivers/fsi/fsi-sbefifo.c | 97 +++++++++++++++++++++++++++++++----------------
 drivers/fsi/occ.c         | 44 +++++++++++----------
 2 files changed, 89 insertions(+), 52 deletions(-)

-- 
1.8.3.1
