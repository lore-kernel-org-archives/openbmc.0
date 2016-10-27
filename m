Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t49lw15sKzDvJQ
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9R2PqQT096528
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 22:27:54 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26b7t9202y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 22:27:53 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Oct 2016 12:27:50 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 27 Oct 2016 12:27:42 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id EC20E2CE8059
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9R2ReNp14483680
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9R2Rdb6018921
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9R2Rd70018908; Thu, 27 Oct 2016 13:27:39 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8EB1CA019C;
 Thu, 27 Oct 2016 13:27:39 +1100 (AEDT)
From: alastair@au1.ibm.com
To: openbmc@lists.ozlabs.org
Cc: clg@koad.org, andrew@aj.id.au, "Alastair D'Silva" <alastair@d-silva.org>
Subject: [PATCH 0/3] Add QEMU support for the Epson rx8900 RTC
Date: Thu, 27 Oct 2016 13:27:10 +1100
X-Mailer: git-send-email 2.7.4
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102702-0012-0000-0000-000001DBBA16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102702-0013-0000-0000-00000649C95E
Message-Id: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610270039
X-Mailman-Approved-At: Thu, 27 Oct 2016 14:33:06 +1100
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
X-List-Received-Date: Thu, 27 Oct 2016 02:27:56 -0000

From: Alastair D'Silva <alastair@d-silva.org>

This series adds preliminary support for the Epson rx8900 RTC.

Setting and retrieving time is supported, and the chip temperature
is hardcoded.

Other features (in particular, those that require the interrupt line)
are not implmented.

Alastair D'Silva (3):
  Add Epson RX8900 RTC support
  Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
  Add a unit test for RX8900 RTC (time functionality only)

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |   4 +
 hw/arm/imx25_pdk.c              |   9 +-
 hw/timer/Makefile.objs          |   1 +
 hw/timer/rx8900.c               | 426 ++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.include          |   2 +
 tests/rx8900-test.c             |  82 ++++++++
 7 files changed, 521 insertions(+), 4 deletions(-)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 tests/rx8900-test.c

-- 
2.7.4
