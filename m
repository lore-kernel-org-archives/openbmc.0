Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFrWB29tqzDqCW
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 22:05:41 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v14Ax67P114484
 for <openbmc@lists.ozlabs.org>; Sat, 4 Feb 2017 06:05:36 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28dbwtk5gx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 04 Feb 2017 06:05:36 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Sat, 4 Feb 2017 04:05:35 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 4 Feb 2017 04:05:33 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 29B6819D8026;
 Sat,  4 Feb 2017 04:04:47 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v14B5XAr10486190; Sat, 4 Feb 2017 04:05:33 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAF28C604C;
 Sat,  4 Feb 2017 04:05:32 -0700 (MST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.85.74.187])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 65227C603C;
 Sat,  4 Feb 2017 04:05:31 -0700 (MST)
Subject: Re: Users of SBE FIFO kernel driver
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <0a7745db-75d8-43b5-acf6-6f789964bdc0@linux.vnet.ibm.com>
 <526fd16f-3edb-ba7e-9694-9e832c426499@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Sat, 4 Feb 2017 16:35:30 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <526fd16f-3edb-ba7e-9694-9e832c426499@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020411-0012-0000-0000-0000138DA084
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006554; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00817040; UDB=6.00399081; IPR=6.00594484; 
 BA=6.00005115; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014176; XFM=3.00000011;
 UTC=2017-02-04 11:05:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020411-0013-0000-0000-00004B1F9D8B
Message-Id: <e73eeb5f-2bae-2c37-1a73-8890cbfb29c9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-04_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702040122
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
X-List-Received-Date: Sat, 04 Feb 2017 11:05:42 -0000



On 04/02/17 12:52 AM, Christopher Bostic wrote:
>
>
> On 2/1/17 10:48 PM, Venkatesh Sainath wrote:
>> I believe there are 2 drivers here. SBE FIFO driver and SBEI protocol 
>> driver. The SBEI protocol driver is the only user for the submit 
>> operation of SBE FIFO driver (as it requires the protocol knowledge 
>> to communicate with SBE). The SBEI protocol driver will be used by 
>> OCC and any user-space application that may want to perform a direct 
>> HW access over FSI  ( for eg any scom operation).
>>
> If I understand then the lowest level device driver in the kernel is 
> the sbe_fifo driver running on OpenFSI.
> The only thing that should have direct access to this is the sbei 
> protocol driver - via sbe_fifo submit operations.
>
> Any other code wishing to access the SBE FIFO engine must go through 
> the sbei protocol driver.  This would include
> OCC hwmon driver, SCOM device driver, as well as any user space 
> applications like host debugger/chip ops (potentially boot sequence if 
> in fact sbe fifo access is required).
>
> sbei protocol driver must then provide a means for user space to 
> access it.
I agree.
>
> Where do we stand with the sbei protocol device driver?  Who owns this 
> and is it complete?
>
The plan was to port the sbei protocol driver developed on FSP based 
systems. Chris: I believe Dhruvaraj discussed with you about this driver 
when he was in Austin. I can share the latest version of this driver.
>>
>> On 02/02/17 8:59 AM, Joel Stanley wrote:
>>> Hi Chris,
>>>
>>> On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
>>> <cbostic@linux.vnet.ibm.com> wrote:
>>>> I've not seen this discussed in the group but if this has already been
>>>> determined than any pointers to the latest documentation would be
>>>> appreciated.
>>>>
>>>> Who are all the potential users of the OpenBMC SBE FIFO device 
>>>> driver?   I
>>>> understand it will need to export its general submit interface to 
>>>> other
>>>> kernel drivers.  Only one I know of for sure would be the OCC 
>>>> driver Eddie
>>>> James is working on.
>>> In addition to Eddie's driver, in userspace we will have the code that
>>> performs the power on sequence.
>>>
>>>> Any others?
>>>>
>>>> What about user space access of the SBE FIFO engine?  What apps would
>>>> require it?  Cronus I assume will need some means to directly 
>>>> access it.
>>> We want userspace API and an in-kernel API.
>>>
>>> The driver you design will need to take into account that there will
>>> be multiple users from each of these APIs. For instance, there will be
>>> Eddie's OCC hwmon driver and the userspace code that kicks off the
>>> boot sequence.
>>>
>>> Cheers,
>>>
>>> Joel
>>> _______________________________________________
>>> openbmc mailing list
>>> openbmc@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/openbmc
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
