Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBDYY0dFvzDrF3
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 05:55:44 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6HJrwQo138838
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 15:55:39 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2brnemcew1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 15:55:39 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 17 Jul 2017 15:55:38 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 17 Jul 2017 15:55:36 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6HJtZRv17694888; Mon, 17 Jul 2017 19:55:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B27A2803D;
 Mon, 17 Jul 2017 15:55:29 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 51AF12804A;
 Mon, 17 Jul 2017 15:55:29 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/hwmon/occ: Change power sensor type a0
 attributes
Date: Mon, 17 Jul 2017 14:55:34 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17071719-0048-0000-0000-000001C59118
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007379; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00888991; UDB=6.00444009; IPR=6.00669163; 
 BA=6.00005476; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016252; XFM=3.00000015;
 UTC=2017-07-17 19:55:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071719-0049-0000-0000-000041EB6D3F
Message-Id: <1500321334-11189-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-17_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707170321
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
X-List-Received-Date: Mon, 17 Jul 2017 19:55:45 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Needed to be more standard.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 74 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 4e3e411..8b0a008 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -565,6 +565,14 @@ static ssize_t occ_show_power_a0(struct device *dev,
 	case 14:
 		val = get_unaligned_be64(&power->vdn.accumulator);
 		break;
+	case 15:
+		return snprintf(buf, PAGE_SIZE - 1, "system\n");
+	case 16:
+		return snprintf(buf, PAGE_SIZE - 1, "proc\n");
+	case 17:
+		return snprintf(buf, PAGE_SIZE - 1, "vdd\n");
+	case 18:
+		return snprintf(buf, PAGE_SIZE - 1, "vdn\n");
 	}
 
 	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
@@ -804,7 +812,7 @@ int occ_setup_sensor_attrs(struct occ *occ)
 		show_power = occ_show_power_2;
 		break;
 	case 0xA0:
-		occ->num_attrs += (sensors->power.num_sensors * 15);
+		occ->num_attrs += (sensors->power.num_sensors * 19);
 		show_power = occ_show_power_a0;
 		break;
 	default:
@@ -888,91 +896,125 @@ int occ_setup_sensor_attrs(struct occ *occ)
 			s = i + 1;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_label", s);
+				 "power%d_id", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 0, i);
 			attr++;
 
+			/* system power attributes */
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_system_update_time", s);
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 15, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_time", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 1, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_system_value", s);
+				 "power%d_input", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 2, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_system_update_tag", s);
+				 "power%d_update_tag", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 3, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_system_accumulator", s);
+				 "power%d_accumulator", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 4, i);
 			attr++;
 
+			s++;
+
+			/* proc power attributes */
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_proc_update_time", s);
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 16, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_update_time", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 5, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_proc_value", s);
+				 "power%d_input", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 6, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_proc_update_tag", s);
+				 "power%d_update_tag", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 7, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_proc_accumulator", s);
+				 "power%d_accumulator", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 8, i);
 			attr++;
 
+			s++;
+
+			/* vdd power attributes */
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_vdd_value", s);
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 17, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 9, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_vdd_update_tag", s);
+				 "power%d_update_tag", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 10, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_vdd_accumulator", s);
+				 "power%d_accumulator", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 11, i);
 			attr++;
 
+			s++;
+
+			/* vdn power attributes */
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_vdn_value", s);
+				 "power%d_label", s);
+			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+						     show_power, NULL, 18, i);
+			attr++;
+
+			snprintf(attr->name, sizeof(attr->name),
+				 "power%d_input", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 12, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_vdn_update_tag", s);
+				 "power%d_update_tag", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 13, i);
 			attr++;
 
 			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_vdn_accumulator", s);
+				 "power%d_accumulator", s);
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_power, NULL, 14, i);
 			attr++;
-- 
1.8.3.1
