Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xD0Lt75F1zDrFh
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 02:52:38 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6KGnE5c012639
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 12:52:36 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2btwxbfrm8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 12:52:35 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 20 Jul 2017 12:52:34 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 20 Jul 2017 12:52:32 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6KGqW5J19202206; Thu, 20 Jul 2017 16:52:32 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB30EAE03C;
 Thu, 20 Jul 2017 12:52:41 -0400 (EDT)
Received: from [9.10.99.182] (unknown [9.10.99.182])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 61098AE03B;
 Thu, 20 Jul 2017 12:52:41 -0400 (EDT)
To: Joel Stanley <joel@jms.id.au>, bradleyb@fuzziesquirrel.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: DPS310 sampling
Date: Thu, 20 Jul 2017 11:52:35 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072016-0048-0000-0000-000001C754F2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007393; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00890365; UDB=6.00444832; IPR=6.00670532; 
 BA=6.00005482; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016299; XFM=3.00000015;
 UTC=2017-07-20 16:52:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072016-0049-0000-0000-000041F3CC9C
Message-Id: <efef70a7-4c02-e459-c21f-9862ae6f0156@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707200258
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
X-List-Received-Date: Thu, 20 Jul 2017 16:52:39 -0000

Hi Joel,

Now that phosphor-hwmon-readd tries to read the DPS310 temp, we keep 
hitting EAGAINs from the driver.  It turns out that the delay call 
within phosphor-hwmon doesn't always wait a full second because it pops 
out of the delay if there is some dbus work to handle.  It would take a 
nontrivial refactoring to fix that properly, and I think even if we did 
we'd just barely be avoiding a race between that being done and the temp 
being available every 1s.

What do you think of changing the rate to be faster than 1 measurement 
per second?  Is that a device tree binding?  In combination with that 
change and phosphor-hwmon doing retries, we should be able to get things 
to work.

Alternatively I could just add in up to a second of retries from within 
phosphor-hwmon, but that would slow down users that request data from it 
on dbus.
