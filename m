Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsnDL2MChzF1kf
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 09:29:34 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w21MQBlp103012
 for <openbmc@lists.ozlabs.org>; Thu, 1 Mar 2018 17:29:30 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2geqh96x4x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 17:29:29 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 1 Mar 2018 17:29:28 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 1 Mar 2018 17:29:26 -0500
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w21MTPM552363448; Thu, 1 Mar 2018 22:29:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39622124037;
 Thu,  1 Mar 2018 18:31:40 -0500 (EST)
Received: from [9.10.99.29] (unknown [9.10.99.29])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 10A1A124035;
 Thu,  1 Mar 2018 18:31:40 -0500 (EST)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: starting phosphor-hwmon with 4.13
To: venture@google.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 1 Mar 2018 16:29:42 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18030122-0024-0000-0000-0000032FCB98
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008609; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00996980; UDB=6.00506898; IPR=6.00776298; 
 MB=3.00019806; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-01 22:29:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030122-0025-0000-0000-000047315A9E
Message-Id: <18365e16-d269-ed98-25ae-5735594fe49b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-01_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803010272
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
X-List-Received-Date: Thu, 01 Mar 2018 22:29:38 -0000

Patrick, others,

With the 4.13 kernel, the OCCs moved out of the device tree.  As such, 
the udev rule that is currently used to start phosphor-hwmon that starts 
the service with the OF_FULLNAME udev attribute will no longer work.

In addition, the systemd capability of using SYSTEMD_WANTS in a udev 
rule to start a templated service is something that upstream rejected 
(maybe just needs further work?), and we are just carrying as a patch, 
so if we can get rid of it that would be a bonus.

So this is what I'm proposing:

Change the udev rule to start and stop hwmon without systemd's help:

SUBSYSTEM=="hwmon", ACTION=="add", RUN="/usr/bin/start_hwmon.sh start 
%p $env{OF_FULLNAME}"
SUBSYSTEM=="hwmon", ACTION=="remove", RUN="/usr/bin/start_hwmon.sh stop 
%p $env{OF_FULLNAME}"


where start_hwmon.sh does a systemctl start of 
xyz.openbmc_project.Hwmon@.service, passing it OF_FULLNAME if it's 
there, otherwise a shortened version of the devpath (takes out the hwmon 
instance, since that is variable so we can't use it to look up env files).

Then I would just need make a minor modification to phosphor-hwmon to 
handle the devpath, and move the OCC config files into a new location in 
/etc/default/obmc/hwmon, and nothing else should really need to change.

Please let me know if anyone has any better ideas, or other comments.
