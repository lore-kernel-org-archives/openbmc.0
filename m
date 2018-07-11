Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Qs2C39pfzF35R
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 07:01:55 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6BL0JFt036923
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 17:01:52 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2k5nu5rnf6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 17:01:50 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 11 Jul 2018 15:01:45 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Jul 2018 15:01:41 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6BL1eoY37552224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Jul 2018 14:01:40 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2A9C6E053;
 Wed, 11 Jul 2018 15:01:40 -0600 (MDT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEB206E04C;
 Wed, 11 Jul 2018 15:01:39 -0600 (MDT)
Received: from talon7.ibm.com (unknown [9.41.102.69])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jul 2018 15:01:39 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 benh@kernel.crashing.org, linux@roeck-us.net, jdelvare@suse.com,
 mark.rutland@arm.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v4 0/9] hwmon and fsi: Add On-Chip Controller (OCC) driver
Date: Wed, 11 Jul 2018 16:01:29 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18071121-0020-0000-0000-00000E3CAB18
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009352; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01059946; UDB=6.00544035; IPR=6.00837866; 
 MB=3.00022107; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-11 21:01:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071121-0021-0000-0000-0000623F8D81
Message-Id: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=779 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807110221
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 21:01:56 -0000

This series adds a hwmon driver to support the OCC on POWER8 and POWER9
processors. The OCC is an embedded processor that provides realtime power and
thermal monitoring and management.

The series also adds a "bus" driver to handle atomic communication between the
service processor and the OCC on a POWER9 chip. This communication takes place
over FSI bus to the SBE (Self-Boot engine) FIFO, which in turn communicates
with the OCC. The driver for the SBEFIFO is already in linux-next as an FSI
client driver.

For POWER8 OCCs, communication between the service processor and the OCC is
achieved over I2C bus.

Changes since v3:
 * Add the FSI OCC driver.
 * Pull the sysfs attribute code into it's own file for cleanliness.
 * Various fixes for attribute creation and integer overflow.

Changes since v2:
 * Add sysfs_notify for the error and throttling attributes when change is
   detected.
 * Removed occs_present counting of devices bound.
 * Improved remove() of P9 driver to avoid bad behavior with relation to OCC
   driver when unbound.
 * Added default cases (return EINVAL) for all sensor show functions.
 * Added temperature fault sensor.
 * Added back dt binding documentation for P9 to address checkpatch warning.
 * Added occs_present attribute from the poll response.

Changes since v1:
 * Remove wait loop in P9 code, as that is now handled by FSI OCC driver.
 * Removed dt binding documentation for P9, FSI OCC driver will probe OCC hwmon
   driver automatically.
 * Moved OCC response code definitions to the OCC include file.
 * Fixed includes.
 * Changed some structure fields to __beXX as that is what they are.
 * Changed some errnos.
 * Removed some dev_err().
 * Refactored P8 code a bit to use #defined addresses and magic values, and
   changed "goto retry" to a loop.
 * Refactored error handling a bit.

Eddie James (9):
  fsi: Add On-Chip Controller (OCC) driver
  Documentation: hwmon: Add OCC documentation
  dt-bindings: i2c: Add P8 OCC hwmon device documentation
  hwmon: Add On-Chip Controller (OCC) hwmon driver
  hwmon (occ): Add command transport method for P8 and P9
  hwmon (occ): Parse OCC poll response
  hwmon (occ): Add sensor types and versions
  hwmon (occ): Add sensor attributes and register hwmon device
  hwmon (occ): Add sysfs attributes for additional OCC data

 .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   |   25 +
 Documentation/hwmon/occ                            |   73 ++
 drivers/fsi/Kconfig                                |   10 +
 drivers/fsi/Makefile                               |    1 +
 drivers/fsi/fsi-occ.c                              |  609 ++++++++++
 drivers/hwmon/Kconfig                              |    2 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/occ/Kconfig                          |   28 +
 drivers/hwmon/occ/Makefile                         |   11 +
 drivers/hwmon/occ/common.c                         | 1250 ++++++++++++++++++++
 drivers/hwmon/occ/common.h                         |  136 +++
 drivers/hwmon/occ/p8_i2c.c                         |  264 +++++
 drivers/hwmon/occ/p9_sbe.c                         |  115 ++
 drivers/hwmon/occ/sysfs.c                          |  188 +++
 include/linux/fsi-occ.h                            |   34 +
 15 files changed, 2747 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/fsi/fsi-occ.c
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/common.c
 create mode 100644 drivers/hwmon/occ/common.h
 create mode 100644 drivers/hwmon/occ/p8_i2c.c
 create mode 100644 drivers/hwmon/occ/p9_sbe.c
 create mode 100644 drivers/hwmon/occ/sysfs.c
 create mode 100644 include/linux/fsi-occ.h

-- 
1.8.3.1
