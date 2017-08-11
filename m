Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXtb3x2KzDqrx
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 04:03:35 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BHxO1e050752
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:33 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c9druu16g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:03:32 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 14:03:32 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 14:03:30 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BI3Uqv33358060; Fri, 11 Aug 2017 18:03:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BD2F112047;
 Fri, 11 Aug 2017 14:03:21 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 0F4FC112040;
 Fri, 11 Aug 2017 14:03:20 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/4] hwmon: (pmbus): Core extension for
 STATUS_WORD and debugfs
Date: Fri, 11 Aug 2017 13:03:24 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17081118-0024-0000-0000-000002BE5048
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900860; UDB=6.00451051; IPR=6.00681064; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 18:03:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081118-0025-0000-0000-0000451095F2
Message-Id: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110280
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
X-List-Received-Date: Fri, 11 Aug 2017 18:03:36 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds some functionality to the pmbus core.

The first two patches provide support for the STATUS_WORD register. This allows
more default alarm attributes to be used, as the upper byte of the status
register is available. The third patch then uses the STATUS_INPUT bit of the
status register to setup boolean attributes for input voltage and input power
attributes.

The fourth patch provides support for raw reads of pmbus status registers
through the debugfs interface. These can be very useful for hardware
diagnostics, especially on multi-page pmbus devices, as user-space access of
the i2c space could corrupt the pmbus page accounting.

Changes since v1:
 * Removed boolean to control whether or not to create debugfs attributes.
 * Switch to scnprintf.
 * Add module init and exit to control root pmbus debugfs directory.

Edward A. James (4):
  hwmon: (pmbus): Switch status registers to 16 bit
  hwmon: (pmbus): Access word data for STATUS_WORD
  hwmon: (pmbus): Add generic alarm bit for iin and pin
  hwmon: (pmbus): Add debugfs for status registers

 drivers/hwmon/pmbus/pmbus_core.c | 278 +++++++++++++++++++++++++++++++++++----
 1 file changed, 256 insertions(+), 22 deletions(-)

-- 
1.8.3.1
