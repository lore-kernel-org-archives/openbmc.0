Return-Path: <shawnmm@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=shawnmm@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qrst3LvhzDqd3
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:08:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3PLwxpW155301
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 18:08:11 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s3kbe55jp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 18:08:10 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shawnmm@linux.vnet.ibm.com>;
 Thu, 25 Apr 2019 23:08:10 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Apr 2019 23:08:08 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3PM873h15794280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 22:08:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3037928378
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 22:08:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 124FB2837D
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 22:08:07 +0000 (GMT)
Received: from [9.10.99.156] (unknown [9.10.99.156])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 22:08:06 +0000 (GMT)
To: openbmc@lists.ozlabs.org
From: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
Subject: Obtaining fan/temperature sensor status for Redfish
Date: Thu, 25 Apr 2019 17:08:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19042522-0060-0000-0000-00000334221A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010995; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01194357; UDB=6.00626183; IPR=6.00975185; 
 MB=3.00026600; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-25 22:08:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042522-0061-0000-0000-000049184A37
Message-Id: <bcdd6246-e116-a5a5-24b2-cd36181a00c5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-25_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=927 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904250135
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
X-List-Received-Date: Thu, 25 Apr 2019 22:08:19 -0000

Hi,

The Redfish Thermal URI (/redfish/v1/Chassis/{ChassisId}/Thermal) 
returns all the fan and temperature sensors within a chassis.

Each returned fan/temperature sensor contains a Status object with the 
following properties:
* Health: Health state of the resource (OK, Warning, Critical)
* State: State of the resource (Absent, Disabled, Enabled, etc.)

Currently bmcweb always returns a Health value of "OK" and a State value 
of"Enabled".

I would like to enhance bmcweb to return more accurate values in the 
Status object when possible.  Below I have summarized a proposed 
design.  Does this sound acceptable?

== Proposed Design ==

* Initially assume Redfish Status->Health value of "OK" and 
Status->State value of "Enabled" as it does today.
* Use ObjectMapper associations to find the DBus inventory object path 
that is related to the DBus sensor (if available).
* Get Functional property of 
xyz.openbmc_project.State.Decorator.OperationalStatus interface for 
inventory object path (if available).
* Set Redfish Status->Health to "Critical" if DBus Functional property 
is false.
* Get Present property of xyz.openbmc_project.Inventory.Item interface 
for inventory object path (if available).
* Set Redfish Status->State to "Absent" if DBus Present property is 
false.  Also remove the Redfish Status->Health property from the 
response if Present is false.

== Notes ==

 From the Redfish documentation I read, it was unclear whether the 
Redfish Status object was intended to describe the sensor itself (such 
as a fan controller chip) or the hardware being monitored by the sensor 
(such as a fan).

It was also unclear what the value of the Status->Health property should 
be for hardware that is not present.

I posted these questions to the Redfish forum:
* https://redfishforum.com/thread/187/intended-meaning-status-object-temps

Their responses were:
* Status is for the hardware being monitored, not the sensor itself.
* Status->Health should probably not be returned if hardware is not present.

Thanks,

Shawn McCarney
