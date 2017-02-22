Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT42h1bw4zDqD0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 04:23:23 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MGx7VZ140335
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:23:21 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28rt1m3uxq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:23:21 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 10:23:20 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 10:23:17 -0700
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 608D319D805E;
 Wed, 22 Feb 2017 10:22:28 -0700 (MST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MHNFS124707240; Wed, 22 Feb 2017 17:23:15 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4946B2068;
 Wed, 22 Feb 2017 12:23:14 -0500 (EST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.85.88.144])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id C3945B2074;
 Wed, 22 Feb 2017 12:23:12 -0500 (EST)
Subject: Re: sbefifo userspace api
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Alistair Popple <alistair@popple.id.au>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <E3C01BA4-46A6-4CEF-8995-A04CBCFCFDD3@fuzziesquirrel.com>
 <a0ddaf0a-7294-60b8-9997-b9b3623aacd2@linux.vnet.ibm.com>
 <1615505.S0uDRroj2n@new-mexico>
 <752644AD-A11F-4CBA-A3FE-D0709E05C720@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 22:53:12 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <752644AD-A11F-4CBA-A3FE-D0709E05C720@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022217-0004-0000-0000-000011A8C446
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006663; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825582; UDB=6.00404250; IPR=6.00603036; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014395; XFM=3.00000011;
 UTC=2017-02-22 17:23:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022217-0005-0000-0000-00007D49A3BE
Message-Id: <d9802efe-8ff5-acb9-ad19-ce18b3a0100a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220158
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
X-List-Received-Date: Wed, 22 Feb 2017 17:23:25 -0000



On 21/02/17 3:35 AM, Brad Bishop wrote:
>> On Feb 20, 2017, at 4:08 PM, Alistair Popple <alistair@popple.id.au> wrote:
>>
>> Hi,
>>
>> On Mon, 20 Feb 2017 10:35:12 PM Venkatesh Sainath wrote:
>>> On 20/02/17 10:22 PM, Brad Bishop wrote:
>>>> Thx Alistair!
>>>>
>>>>> On Feb 20, 2017, at 10:34 AM, Alistair Popple <alistair@popple.id.au> wrote:
>>>>>
>>>>> On Mon, 20 Feb 2017 07:20:25 AM Brad Bishop wrote:
>>>>>> Hi Venkatesh
>>>>>>
>>>>>> If we put all the chip ops in the kernel then I would agree with you.
>>>>>>
>>>>>> However, a number of others have expressed concern with putting the chip ops in the kernel.
>>>>>>
>>>>>> Joel/Alistair - can you elaborate on your concerns with this approach of putting the chip-ops in the kernel?
>>>>> The main concern I had was that putting the chip-ops in the kernel
>>>>> makes it more complicated to update/add chip-ops. Having them in the
>>>>> kernel would require a userspace API for each chip-op that would not
>>>>> be able to change, or at least could only change in a way that does
>>>>> not break backwards compatibility. Putting them in userpsace would
>>>>> allow you to build a library and manage any API changes between the
>>>>> users of that library.
>>>> Fair point.  What makes sbescom a special exception to this?  Are we OK with a real, fixed UAPI for sbescom, but the others are implemented in a library?  That feels inconsistent to me.
>> The thing that I think makes sbescom special is that getscom/putscom
>> is a very well understood low-level and general purpose operation that
>> is also needed for kernel drivers. We also have existing userspace and
>> kernel interfaces for doing get/putscom where as many of the other
>> operations are quite specialised (eg. get trace array).
>>
>> If we put all the chip-ops in the kernel we would need to define and
>> review all these interfaces.
>>
>>> As the interface is itself controlled by the specification, we should
>>> anyway make it backward compatible. I was also hoping that the sbei
>>> protocol driver sits in user-space as a library (if not for the occ
>>> hwmon...).
>>>>> I would also be interested in the answer to the inverse - why put them
>>>>> in the kernel?
>>>> Fair question.  I’m hoping Venkatesh responds with some things I may have overlooked.
>>>>
>>>> The only case I have for this is the consistency argument I made above.  I would rather see all or none in the kernel.  I’d be fine with none, but I can’t see a way to implement occ-hwmon that way.  So I fall back to all.
>> I can understand where you are coming from with the consistency
>> argument but imho I don't really think it is very compelling in this
>> case - it seems we broadly agree that chip-ops should live in userspace
>> except for the problem of the OCC hwmon driver.
> yup.
In general, I agree with this approach to contain only those interfaces 
required by hwmon within the kernel and leave the rest to the 
user-space. But, we need to interlock with the hwmon to understand 
exactly which interfaces are required.
IMO, we need (a) Get/Put Memory for tunneling data to OCC and back (b) 
Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages. If 
these three are the right ones, then we need to contain them within the 
kernel.
>> I don't think it is a problem having get/putscom as an exceptional
>> case for the reasons described above. My question about the
>> consistency argument is what does it get us?
>>
>> I think Venkatesh was suggesting it would reduce duplication of
>> protocol driver code, however perhaps this isn't the case. We could
>> create a kernel chip-ops driver that deals with sending a buffer and
>> getting a response but doesn't have to know anything about the chip-op
>> itself. It could also implement the kernel sbe get/putscom.
>>
>> What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1.1.2.5
>> of the sbe interface spec. Userspace would submit command-class,
>> command-code & data words and the chip-ops driver would forward that
>> to the SBE and send the response back to userspace without having to
>> know what any of that data means.
> I like it!
>
> Would this ‘chip-op’ driver be distinct from the sbefifo driver or
> are you proposing a possible sbefifo driver API with a tad bit more
> abstraction?
>
> If we did something like this, does a standalone sbescom driver still
> have any value?
I think the proposal is to have a combined sbefifo+sbechipop driver that 
provides a user space api to submit operations to sbefifo and user space 
api for those chipops contained within ( scom, memory and sram). The 
user space library will have the other sbe interfaces and will call the 
submit operations of the chip-op driver. Is this correct? We could get 
the user-space library provide a wrapper interface for even the chip-ops 
contained within the kernel so that the caller doesnt have to know 
whether to call the library or the driver apis.
>> In any case I think you will end up with a userspace implementation of
>> chip-ops anyway as it is much easier to test and develop new chip-ops
>> without having to also understand how to build and flash a new kernel.
>> Inevitably someone will want to add some kind of "debug" chip-op or
>> other private chip-op that they don't want published in kernel code,
>> and as soon as you have one userspace chip-op you may as well do all
>> of the ones you can from there.
>>
>>>> Of course we can implement just the get/put scom chip ops in kernel and the others in user space.  I just want to make sure everyone understands exactly what we’d be doing there and would be OK with that approach.
>>>>
>>>>> There's the OCC hwmon driver - what chip-ops does that
>>>>> need? Just get/putscom?
>>>> Correct, just get/putscom.  But sbe scom, not direct scom.
>>> occ hwmon driver should use get/put memory to communicate with OCC. One
>> What memory is the OCC using to store these buffer? Does it have
>> memory mapped onto the PowerBus into an MMIO space or something?
>>> other option ( I am not too happy about this ) is to embed the get/put
>>> memory protocol construction inside occ hwmon driver and make it call
>>> sbe fifo driver interface directly. The sbei protocol driver can then be
>>> in the user-space as a library and call the sbe fifo driver interface
>>> via ioctl. This creates duplication of the protocol driver code and we
>>> have to fix it in multiple places.
>>>>> If that's the case I thought we were already
>>>>> exposing scom chip-op operations via an OpenFSI master?
>>>> I have the same consistency question here.  Why is it preferable to have a UAPI for these chip-ops but not the others?
>>> openfsi driver is not exposing chipops. The sbe fifo driver must be
>>> calling the openfsi driver interfaces to write to the fifo. The openfsi
>>> driver must also be providing a UAPI for a non-sbe scom or cfam-write
>>> operations via cronus, pdbg or rest api.
>>>
>>> Net: openfsi driver need to have both intra-kernel and user-space APIs.
>>> sbe fifo driver also need to have both intra-kernel and user-space APIs
>>> if the sbei protocol driver goes to user-space.
>>>>> Regards,
>>>>>
>>>>> Alistair
>>>>>
>>>>>> thx - brad
>>>>>>
>>>>>>
>>>>>>
>>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@linux.vnet.ibm.com> wrote:
>>>>>>>
>>>>>>> Hi Brad,
>>>>>>>
>>>>>>> I am not sure why we need a user-space api for SBE FIFO driver. Even the pdbg and cronus apps have to go through the SBEI protocol driver in order to construct the packets according to the SBEI interface spec which is done by the SBEI protocol driver only. I think only an in-kernel api is sufficient for the SBE FIFO driver.
>>>>>>>
>>>>>>> However, for the SBEI protocol driver, we would need both in-kernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus and rest apis ).
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>> With regards
>>>>>>> Venkatesh
>>>>>>>
>>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>>>>>>>> Thanks Jeremy for the reply.  I’ve added participants from this thread:
>>>>>>>>
>>>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>>>>>>>
>>>>>>>> in an attempt to consolidate the whole sbefifo design discussion to a single thread.
>>>>>>>>
>>>>>>>>> Hi Brad,
>>>>>>>>>
>>>>>>>>>> Looking to start a discussion around possible user space and kernel
>>>>>>>>>> APIs for the POWER9 sbefifo driver.
>>>>>>>>>>
>>>>>>>>>> There exists today an “alternate" sbefifo driver :-) that provides a
>>>>>>>>>> single submit ioctl.  Applications submit a request and get a reply in
>>>>>>>>>> single system call.
>>>>>>>>>>
>>>>>>>>>> Is something like that the best approach for an upstream driver?  Or
>>>>>>>>>> should we try something more "pipe like" with read/write interfaces?
>>>>>>>>> It probably depends on the functionality there; ioctl() is useful in
>>>>>>>>> that (as you say) we can handle request and response in a single
>>>>>>>>> syscall, read() / write() may be more appropriate if ordering can be
>>>>>>>>> handled in userspace.
>>>>>>>>>
>>>>>>>>> Can you add a little description about the functionality we're exposing?
>>>>>>>>> That may suggest a particular API.
>>>>>>>> In terms of hardware its pretty simple.  sbefifo is just two 8-word queues for sending/receiving messages to/from the SBE.  Each queue entry has a single ‘end of transfer’ flag to let the other side know the message is done.
>>>>>>>>
>>>>>>>> In terms of data flowing through it, there is an SBEI protocol that covers encoding operations (like getscom, getmem, etc.. aka chip-ops) and the SBE response.
>>>>>>>>
>>>>>>>> For users there seems to be two classes:
>>>>>>>>
>>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>>>>>>>
>>>>>>>> If it weren’t for occ-hwmon, it doesn’t seem like there would be any need for the kernel to have any knowledge of the data flowing through the fifo (at the moment anyway).  An sbe-scom driver has been suggested but I wonder what the point of that driver would be, if userspace could simply encode a get/putscom chip-op and use the fifo directly.
>>>>>>>>
>>>>>>>>>> Would the in-kernel API be the same as the user space API?
>>>>>>>>> Probably not :)
>>>>>>>> I realize they wouldn’t be _exactly_ the same if thats why I got the smiley face :-) ...
>>>>>>>>
>>>>>>>> But I would have figured they’d at least be similar - meaning if we were go the ‘submit’ route for a UAPI..the kernel
>>>>>>>> would probably not have a split read/write API or vise versa.
>>>>>>>>
>>>>>>>> So to rephrase the question - would the chardev fops implementation simply be something like this:
>>>>>>>>
>>>>>>>> sbe-uapi-fops(chardev)
>>>>>>>>    data = copy to/from user space;
>>>>>>>>    sbedev = from_chardev(chardev);
>>>>>>>>    kernel-api(sbedev, data);
>>>>>>>>
>>>>>>>> Or are the other things to consider here?
>>>>>>>>
>>>>>>>> -thx
>>>>>>>>
>>>>>>>> brad
>>>>>>>>
>>>>>>>>> Cheers,
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Jeremy
