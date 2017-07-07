Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x44cV6xFdzDr8f
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 05:36:58 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67JXa4N110319
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 15:36:56 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjdsunxjd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 15:36:56 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 13:36:55 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 13:36:53 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67JarkB9371936; Fri, 7 Jul 2017 12:36:53 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19E34BE03B;
 Fri,  7 Jul 2017 13:36:53 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 60C54BE03A;
 Fri,  7 Jul 2017 13:36:52 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v3] drivers/hwmon/occ: Add sysfs_notify on
 error
To: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1499354901-23165-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xf15Kwm1S924H0PRsuiAm8XGzGQ-DCf30upMDLjY-nBAA@mail.gmail.com>
 <20170707183720.GD22100@asimov.austin.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2017 14:36:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170707183720.GD22100@asimov.austin.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070719-8235-0000-0000-00000BE1AF6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007337; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884282; UDB=6.00441226; IPR=6.00664470; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 19:36:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070719-8236-0000-0000-00003CA3FC27
Message-Id: <a4185d59-d251-68d6-8ed0-47aa6a26f1a1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070325
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
X-List-Received-Date: Fri, 07 Jul 2017 19:36:59 -0000



On 07/07/2017 01:37 PM, Patrick Williams wrote:
> On Fri, Jul 07, 2017 at 04:06:30PM +0930, Joel Stanley wrote:
>> On Fri, Jul 7, 2017 at 12:58 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>> +void occ_set_error(struct occ *occ, int error)
>>> +{
>>> +       occ->error_count++;
>>> +       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)
>> I think this policy can live in userspace. Instead of counting the
>> errors in the kernel and only reporting after some threshold, report
>> all of the errors.
>>
>> Userspace can then chose to do with this information what it wants,
>> according to the policy of the system.
>>
> This retry / threshold count is in the OCC specification itself and is
> not considered "policy of the system".  I believe the specification
> requires not considering errors under a threshold count as actual
> errors and if there is a successful communication the threshold count is
> suppose to be reset.  How do we coordinate that with userspace keeping a
> separate error policy?

In addition, there are a variety of different error types reported from 
the driver, such as "OCC in safe state for one minute" and "OCCs present 
mismatch". Those shouldn't be a part of the error counting, according to 
the OCC spec.

Thanks,
Eddie

>
>
