Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xp40005GJzDrW9
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 01:20:31 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v87FJqFS037129
 for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2017 11:20:29 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cu7b4d49c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 11:20:26 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 7 Sep 2017 09:20:24 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 7 Sep 2017 09:20:21 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v87FKKgG1901044; Thu, 7 Sep 2017 08:20:20 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 092D513603A;
 Thu,  7 Sep 2017 09:20:20 -0600 (MDT)
Received: from [9.77.83.60] (unknown [9.77.83.60])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 67E36136044;
 Thu,  7 Sep 2017 09:20:18 -0600 (MDT)
From: tomjose <tomjose@linux.vnet.ibm.com>
Subject: RFC for Telemetry data collection
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: rosedahl@us.ibm.com, thalerj@us.ibm.com, jkeusema@us.ibm.com
Date: Thu, 7 Sep 2017 20:50:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17090715-0004-0000-0000-000012E2CD3F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007683; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913604; UDB=6.00458552; IPR=6.00693862; 
 BA=6.00005576; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017053; XFM=3.00000015;
 UTC=2017-09-07 15:20:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090715-0005-0000-0000-00008105B271
Message-Id: <59B163B0.6060804@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709070225
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
X-List-Received-Date: Thu, 07 Sep 2017 15:20:32 -0000

Hello,

I am working on the issue 
(https://github.com/openbmc/openbmc/issues/1957) to design a telemetry 
application for the OpenBMC. I would be explaining a rough idea of how 
we plan to go about. Please share your thoughts and feedback on this 
proposal. This issue would depend on the design evolving out of 
following issues, since this app would utilize the capabilities 
provided. (https://github.com/openbmc/openbmc/issues/1856, 
https://github.com/openbmc/openbmc/issues/2102).

Summary of the requirements that we came across relevant to this discussion.


1) BMC telemetry data (example VRM rail voltages) where the data is 
collected at different rates depending on the data and aggregated by the 
BMC app  (minimum, maximum
     and average). Based on the collection timing request(frequency) the 
metrics are logged, so that the user can fetch it for analytics.

2)  Users should be able to set thresholds for the temperature limits, 
and receive alerts. This would allow user to plan the cooling needs.

3)  BMC would act as route for the OCC metrics to be send to the user. 
The OCC would send down telemetric data to the BMC and BMC should figure 
out a way to
      alert the user to consume this data.


We would keep the focus of the discussion on the requirement no 1.
This proposal presupposes that all the resources( example VRM rail 
voltages, ambient temperature) that the telemetry app is interested in, 
should be populated as dbus objects, which can
be queried to read the instantaneous values. phosphor-hwmon application 
exposes many of the interested resources.

The idea is to have a yaml based approach, where the policy of the 
telemetry app will be expressed. The application would be able to 
consume the yaml and initiate the telemetry
data collection. The yaml would express the following:

a) Dbus Info (object, interface, property) associated with the resource.
b) Units associated with the value (celsius) and the associated scaling 
factor).
c) Granularity - the time between two measures.
d) Aggregation methods - min,max,avg..etc.
e) Logging policy - frequency for creating an event and alerting the user.

The application would operate based on the policy and log the telemetry 
data. The details of logging would evolve as we progress on the related 
issue.

Regards,
Tom
