Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHbNQ4KNfzF0hP
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 06:21:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BJLMFA016485
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 14:21:56 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2feaq39hyg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 14:21:55 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 12:21:54 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 12:21:52 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BJLqxF11993478; Thu, 11 Jan 2018 12:21:52 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37B636E03F;
 Thu, 11 Jan 2018 12:21:52 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id E50546E040;
 Thu, 11 Jan 2018 12:21:51 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 0/4] hwmon (pmbus): cffps: reset to linux-next
 state
Date: Thu, 11 Jan 2018 13:21:46 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18011119-8235-0000-0000-00000CDB6D23
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973578; UDB=6.00493317; IPR=6.00753522; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 19:21:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011119-8236-0000-0000-00003F34701E
Message-Id: <1515698510-16619-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110264
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
X-List-Received-Date: Thu, 11 Jan 2018 19:21:59 -0000
X-List-Received-Date: Thu, 11 Jan 2018 19:21:59 -0000

This series brings the IBM common form factor power supply driver to the
commits accepted into linux-next. It also includes a change to the pmbus
core driver, also in linux-next, which simply exports the debugfs directory.

Eddie James (4):
  hwmon: (pmbus) Export pmbus device debugfs directory entry
  hwmon: (pmbus) cffps: Add debugfs entries
  hwmon: (pmbus) cffps: Add PMBUS_SKIP_STATUS_CHECK
  hwmon (pmbus): cffps: Add led class device for power supply fault led

 drivers/hwmon/pmbus/ibm-cffps.c  | 288 ++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |   2 +
 drivers/hwmon/pmbus/pmbus_core.c |   8 ++
 3 files changed, 297 insertions(+), 1 deletion(-)

-- 
1.8.3.1
