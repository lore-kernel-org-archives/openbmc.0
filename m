Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKQkz3WBmzDq8g
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 17:58:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1A6sA66071688
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 01:58:16 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28h25p4x3e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 01:58:16 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Thu, 9 Feb 2017 23:58:15 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 9 Feb 2017 23:58:14 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 5D5B619D801C;
 Thu,  9 Feb 2017 23:57:27 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1A6wDxV6488376; Thu, 9 Feb 2017 23:58:13 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D23DE6A043;
 Thu,  9 Feb 2017 23:58:13 -0700 (MST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.199.66.188])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 9AFEC6A041;
 Thu,  9 Feb 2017 23:58:12 -0700 (MST)
Subject: Re: Users of SBE FIFO kernel driver
To: Patrick Williams <patrick@stwcx.xyz>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <0a7745db-75d8-43b5-acf6-6f789964bdc0@linux.vnet.ibm.com>
 <526fd16f-3edb-ba7e-9694-9e832c426499@linux.vnet.ibm.com>
 <e73eeb5f-2bae-2c37-1a73-8890cbfb29c9@linux.vnet.ibm.com>
 <20170209211659.flmbka7zmtopandl@asimov>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Fri, 10 Feb 2017 12:28:10 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170209211659.flmbka7zmtopandl@asimov>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021006-0016-0000-0000-0000062022A7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006589; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819782; UDB=6.00400753; IPR=6.00597236; 
 BA=6.00005130; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014242; XFM=3.00000011;
 UTC=2017-02-10 06:58:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021006-0017-0000-0000-00003745BE67
Message-Id: <9eac83a7-bf3b-961f-2777-39dd33862c90@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-10_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702100069
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
X-List-Received-Date: Fri, 10 Feb 2017 06:58:20 -0000



On 10/02/17 2:46 AM, Patrick Williams wrote:
> On Sat, Feb 04, 2017 at 04:35:30PM +0530, Venkatesh Sainath wrote:
>>> Where do we stand with the sbei protocol device driver?  Who owns this
>>> and is it complete?
>>>
>> The plan was to port the sbei protocol driver developed on FSP based
>> systems. Chris: I believe Dhruvaraj discussed with you about this driver
>> when he was in Austin. I can share the latest version of this driver.
> Is this "driver" really a driver in the Linux sense or is it a shared
> library that is used in FSP userspace?  Whatever code we end up using we
> eventually need it to be upstream-able into the real Linux kernel.
This is not really a driver in the Linux sense. It is a shared lib in 
FSP user space. As the OCC driver has to use this SBEI protocol, we  
have to implement this as a Linux driver in OpenBMC
> Is this something that Dhruv can take on or is this going to be left to
> Chris?  How do we handle divergence between the open-source code and the
> IBM proprietary version (the one direction is an IBM-internal problem,
> but I have concern that future development will only be happening on
> the proprietary one and we'll have to keep playing catch up).
>
The SBE interfaces are open-sourced and there may not be any proprietary 
implementation here. However, the code architecture between FSP and 
OpenBMC is different ( FSP - user space and OpenBMC - Linux driver ) and 
hence we will have to maintain two streams. The HWSV team can implement  
it as a Linux driver in OpenBMC and deliver it in stages. Any defect 
fixes in future can be done by the same team on both streams. I will ask 
Sachin Gupta to sync up with Chris. As of now, we need only Get/Put 
Memory, Get/Put Scom and Get/Put SRAM for enabling OCC and HW access. We 
can add the remaining interfaces subsequently. As a user of this SBEI 
protocol driver, we need OCC driver changes, Rest API to call OCC 
driver, SCOM drivers and user space app (Rest API / ??) to call the SCOM 
driver.
