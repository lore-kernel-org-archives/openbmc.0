Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRCm60g6tzDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 09:04:53 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77N485H046416
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 19:04:52 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c6u469cda-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 19:04:51 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 19:04:50 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 19:04:48 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77N4lRU22348022; Mon, 7 Aug 2017 23:04:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 453C2124035;
 Mon,  7 Aug 2017 19:02:11 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 0A7FA124037;
 Mon,  7 Aug 2017 19:02:10 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.10 0/3] drivers/hwmon/pmbus: core extensions
Date: Mon,  7 Aug 2017 18:04:42 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17080723-0024-0000-0000-000002BC06B6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899055; UDB=6.00449968; IPR=6.00679260; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016580; XFM=3.00000015;
 UTC=2017-08-07 23:04:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080723-0025-0000-0000-000045055BCA
Message-Id: <1502147085-437-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070383
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
X-List-Received-Date: Mon, 07 Aug 2017 23:04:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds some functionality to the pmbus core.

The first two patches are fixes to enable the use of the STATUS_WORD register
which was completely unused in existing pmbus. This allows the use of more
default alarm/fault attributes for default pmbus sensors.

The third patch adds "status" attributes to each class of hwmon sensor created
by pmbus. For example, in1_status and temp1_status. These will display the
associated raw status register (STATUS_INPUT and STATUS_TEMPERATURE). These
will probably be essential for the UCD driver, and certainly very convenient
for the power supply driver.

An alternative I considered was breaking all the status registers out into
bits, but some bits seem to be device-dependent and therefore couldn't be named
correctly or at all in the pmbus core. This would also really make the hwmon
directory messy, unless you have a separate directory for that, either in the
device directory or under the hwmon directory (not sure if that's even
possible).

Edward A. James (3):
  drivers/hwmon/pmbus: Use STATUS_WORD by default and do correct access
  drivers/hmwon/pmbus: store STATUS_WORD in status registers
  drivers/hwmon/pmbus: Add sensor status to pmbus attributes

 drivers/hwmon/pmbus/pmbus_core.c | 153 +++++++++++++++++++++++++++++++++------
 1 file changed, 130 insertions(+), 23 deletions(-)

-- 
1.8.3.1
