Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFRb6368LzDqBj
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 06:22:40 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v13JJkWh118627
 for <openbmc@lists.ozlabs.org>; Fri, 3 Feb 2017 14:22:38 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28cvjbr4da-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 Feb 2017 14:22:38 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 3 Feb 2017 14:22:37 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 3 Feb 2017 14:22:35 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id E4E4AC90041;
 Fri,  3 Feb 2017 14:22:16 -0500 (EST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v13JMZZP12845512; Fri, 3 Feb 2017 19:22:35 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6276DAE03B;
 Fri,  3 Feb 2017 14:22:35 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 19BCBAE054;
 Fri,  3 Feb 2017 14:22:35 -0500 (EST)
Subject: Re: Users of SBE FIFO kernel driver
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <0a7745db-75d8-43b5-acf6-6f789964bdc0@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 3 Feb 2017 13:22:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <0a7745db-75d8-43b5-acf6-6f789964bdc0@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020319-0056-0000-0000-000002AB46A0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006550; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816777; UDB=6.00398898; IPR=6.00594212; 
 BA=6.00005114; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014171; XFM=3.00000011;
 UTC=2017-02-03 19:22:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020319-0057-0000-0000-000006E04DD5
Message-Id: <526fd16f-3edb-ba7e-9694-9e832c426499@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-03_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702030183
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
X-List-Received-Date: Fri, 03 Feb 2017 19:22:42 -0000



On 2/1/17 10:48 PM, Venkatesh Sainath wrote:
> I believe there are 2 drivers here. SBE FIFO driver and SBEI protocol 
> driver. The SBEI protocol driver is the only user for the submit 
> operation of SBE FIFO driver (as it requires the protocol knowledge to 
> communicate with SBE). The SBEI protocol driver will be used by OCC 
> and any user-space application that may want to perform a direct HW 
> access over FSI  ( for eg any scom operation).
>
If I understand then the lowest level device driver in the kernel is the 
sbe_fifo driver running on OpenFSI.
The only thing that should have direct access to this is the sbei 
protocol driver - via sbe_fifo submit operations.

Any other code wishing to access the SBE FIFO engine must go through the 
sbei protocol driver.  This would include
OCC hwmon driver, SCOM device driver, as well as any user space 
applications like host debugger/chip ops (potentially boot sequence if 
in fact sbe fifo access is required).

sbei protocol driver must then provide a means for user space to access it.

Where do we stand with the sbei protocol device driver?  Who owns this 
and is it complete?

>
> On 02/02/17 8:59 AM, Joel Stanley wrote:
>> Hi Chris,
>>
>> On Thu, Feb 2, 2017 at 5:58 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>>> I've not seen this discussed in the group but if this has already been
>>> determined than any pointers to the latest documentation would be
>>> appreciated.
>>>
>>> Who are all the potential users of the OpenBMC SBE FIFO device 
>>> driver?   I
>>> understand it will need to export its general submit interface to other
>>> kernel drivers.  Only one I know of for sure would be the OCC driver 
>>> Eddie
>>> James is working on.
>> In addition to Eddie's driver, in userspace we will have the code that
>> performs the power on sequence.
>>
>>> Any others?
>>>
>>> What about user space access of the SBE FIFO engine?  What apps would
>>> require it?  Cronus I assume will need some means to directly access 
>>> it.
>> We want userspace API and an in-kernel API.
>>
>> The driver you design will need to take into account that there will
>> be multiple users from each of these APIs. For instance, there will be
>> Eddie's OCC hwmon driver and the userspace code that kicks off the
>> boot sequence.
>>
>> Cheers,
>>
>> Joel
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
