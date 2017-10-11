Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yC5vH6K7pzDr5x
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 07:59:23 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9BKxHJ5107830
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 16:59:20 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dhpgsbjhv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 16:59:18 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 11 Oct 2017 14:59:05 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 11 Oct 2017 14:59:02 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9BKx1PY5570930; Wed, 11 Oct 2017 13:59:01 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1FA7C6043;
 Wed, 11 Oct 2017 14:59:01 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 8641EC603E;
 Wed, 11 Oct 2017 14:59:01 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 0/2] drivers: hwmon: occ: sysfs_notify and
 presence detect
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507701718.5452.179.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 11 Oct 2017 15:59:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507701718.5452.179.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17101120-0012-0000-0000-000015220952
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007879; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00929749; UDB=6.00467977; IPR=6.00710020; 
 BA=6.00005634; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017496; XFM=3.00000015;
 UTC=2017-10-11 20:59:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101120-0013-0000-0000-00004FD5C3AB
Message-Id: <0b6b0b85-4ac0-e748-c03b-5004e75026c8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710110285
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 20:59:24 -0000



On 10/11/2017 01:01 AM, Andrew Jeffery wrote:
> On Fri, 2017-10-06 at 15:42 -0500, Eddie James wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>> This patch set removes the error checking for the number of OCCs present.
> I'm interested in the back-story here. Why are we making this change in
> behaviour?

Sure, basically two reasons:

1) userspace app was having trouble handling this error code, since if 
you bind the master OCC device first, you'll immediately get an error 
that we haven't bound the same number of OCCs as the OCC reports are 
available.

2) This error checking for "number of OCC devices bound" isn't designed 
well anyway, and makes more sense in userspace. The original intent was 
to implement all of the OCC requirements in the driver, but we have an 
application running on top that can pick up the slack, as it were.

Thanks,
Eddie

>
> Cheers,
>
> Andrew
>
>> Instead, export a new sysfs attribute to indicate the number of OCCs present
>> from the master poll response. In addition, add sysfs_notify both to the new
>> occs_present attribute and the throttling attributes.
>>
>> Edward A. James (2):
>>    drivers: hwmon: occ: Add occs_present attribute
>>    drivers: hwmon: occ: Add sysfs_notify to throttling attributes
>>
>>   drivers/hwmon/occ/common.c | 49 ++++++++++++++++++++++++++++++++++------------
>>   drivers/hwmon/occ/common.h |  3 ---
>>   drivers/hwmon/occ/p8_i2c.c |  4 ----
>>   drivers/hwmon/occ/p9_sbe.c |  4 ----
>>   4 files changed, 37 insertions(+), 23 deletions(-)
