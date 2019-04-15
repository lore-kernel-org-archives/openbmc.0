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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jjn70QW5zDqGx
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 08:27:54 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3FMEWvt027733
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 18:27:52 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rvy1e93r1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 18:27:51 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 15 Apr 2019 23:27:51 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Apr 2019 23:27:48 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3FMRkuV22806600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Apr 2019 22:27:47 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E004FBE054;
 Mon, 15 Apr 2019 22:27:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAE3ABE051;
 Mon, 15 Apr 2019 22:27:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Apr 2019 22:27:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH dev-5.0 2/2] hwmon (occ): Prevent sysfs error attribute from
 returning error
Date: Mon, 15 Apr 2019 22:27:41 +0000
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555367261-4299-1-git-send-email-eajames@linux.ibm.com>
References: <1555367261-4299-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19041522-0016-0000-0000-000009A10CF6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010934; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01189620; UDB=6.00623314; IPR=6.00970407; 
 MB=3.00026458; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-15 22:27:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041522-0017-0000-0000-000042D3F062
Message-Id: <1555367261-4299-2-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=963 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904150151
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
X-List-Received-Date: Mon, 15 Apr 2019 22:27:55 -0000

The error sysfs attribute returns the stored error state of the OCC and
doesn't depend on the OCC poll response. Therefore, split the error
attribute into it's own function to avoid failing out of the function if
the poll response fails.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/sysfs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
index 743b26ec..9bf1526 100644
--- a/drivers/hwmon/occ/sysfs.c
+++ b/drivers/hwmon/occ/sysfs.c
@@ -71,9 +71,6 @@ static ssize_t occ_sysfs_show(struct device *dev,
 		else
 			val = 1;
 		break;
-	case 8:
-		val = occ->error;
-		break;
 	default:
 		return -EINVAL;
 	}
@@ -81,6 +78,16 @@ static ssize_t occ_sysfs_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 }
 
+static ssize_t occ_sysfs_error(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct occ *occ = dev_get_drvdata(dev);
+
+	occ_update_response(occ);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
+}
+
 static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_sysfs_show, NULL, 0);
 static SENSOR_DEVICE_ATTR(occ_active, 0444, occ_sysfs_show, NULL, 1);
 static SENSOR_DEVICE_ATTR(occ_dvfs_overtemp, 0444, occ_sysfs_show, NULL, 2);
@@ -89,7 +96,7 @@ static SENSOR_DEVICE_ATTR(occ_mem_throttle, 0444, occ_sysfs_show, NULL, 4);
 static SENSOR_DEVICE_ATTR(occ_quick_pwr_drop, 0444, occ_sysfs_show, NULL, 5);
 static SENSOR_DEVICE_ATTR(occ_state, 0444, occ_sysfs_show, NULL, 6);
 static SENSOR_DEVICE_ATTR(occs_present, 0444, occ_sysfs_show, NULL, 7);
-static SENSOR_DEVICE_ATTR(occ_error, 0444, occ_sysfs_show, NULL, 8);
+static DEVICE_ATTR(occ_error, 0444, occ_sysfs_error, NULL);
 
 static struct attribute *occ_attributes[] = {
 	&sensor_dev_attr_occ_master.dev_attr.attr,
@@ -100,7 +107,7 @@ static struct attribute *occ_attributes[] = {
 	&sensor_dev_attr_occ_quick_pwr_drop.dev_attr.attr,
 	&sensor_dev_attr_occ_state.dev_attr.attr,
 	&sensor_dev_attr_occs_present.dev_attr.attr,
-	&sensor_dev_attr_occ_error.dev_attr.attr,
+	&dev_attr_occ_error.attr,
 	NULL
 };
 
@@ -164,7 +171,7 @@ void occ_sysfs_poll_done(struct occ *occ)
 	}
 
 	if (occ->error && occ->error != occ->prev_error) {
-		name = sensor_dev_attr_occ_error.dev_attr.attr.name;
+		name = dev_attr_occ_error.attr.name;
 		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
 	}
 
-- 
2.7.4
