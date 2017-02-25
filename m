Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVbjz3NZ4zDqGv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 16:14:15 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1P4sEBU086145
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 00:14:13 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ts63b24t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 00:14:12 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Fri, 24 Feb 2017 22:14:12 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 24 Feb 2017 22:14:08 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 0C8FF19D8026;
 Fri, 24 Feb 2017 22:13:20 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1P5E8FP11338068; Fri, 24 Feb 2017 22:14:08 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42F5E78037;
 Fri, 24 Feb 2017 22:14:08 -0700 (MST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.199.34.91])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 14F8D78041;
 Fri, 24 Feb 2017 22:14:05 -0700 (MST)
Subject: Re: sbefifo userspace api
To: Alistair Popple <alistair@popple.id.au>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <2259983.WKARIp1cGE@new-mexico>
 <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
 <10497628.zEIs9p2if1@new-mexico>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Sat, 25 Feb 2017 10:44:03 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <10497628.zEIs9p2if1@new-mexico>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022505-0020-0000-0000-00000B7A3850
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006678; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826754; UDB=6.00404958; IPR=6.00604208; 
 BA=6.00005171; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014433; XFM=3.00000011;
 UTC=2017-02-25 05:14:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022505-0021-0000-0000-00005A6A62D3
Message-Id: <8bc42a68-bd12-49c9-9da6-8ad59613d703@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702250044
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
X-List-Received-Date: Sat, 25 Feb 2017 05:14:15 -0000



On 24/02/17 11:44 AM, Alistair Popple wrote:
> On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
>> Based on what we’ve discussed here and a couple offline discussions,
>> I’m making some assertions below.  I’d like for this note to be a
>> “last call for discussion” (as much as that is possible) so we can
>> start hacking; please try and raise any concerns by sometime next week.
>>
>> - sbefifo DD will implement read and write system calls.  A write
>> will put data in the upstream fifo.  A read will pull data out of
>> the downstream fifo.
Brad,
  Thanks for summarising the discussion. Instead of independent 
read/write calls, I was looking for a single ioctl(submit) operation 
which would always do a write of the incoming data packet to the 
upstream fifo followed by a read of a byte stream from the downstream 
fifo. There can be multiple users who open file descriptors to the sbe 
fifo in write mode. However, each ioctl(fd,submit,data) operation will 
be protected such that no two submit operations will happen in parallel. 
This way (a) the users dont have to know the semantics of the sbe fifo 
status bits ( data valid / end-of-transmission) and (b) there wont be 
any collision of write and read operations between two users. I am 
hoping this does not violate any linux DD norms.

-Venkatesh
>> - sbefifo DD will _not_ do any framing of data flowing into/out of the
>> kernel (in other words, exactly what is found in the sbei interface spec).
Agreed.
>> - sbefifo will provide an in-kernel API which again, will not do any
>> framing of data.
Agreed.
>> - occ-hwmon DD will assemble requests and parse responses for whatever
>> chip-ops it requires and use the sbefifo in-kernel api to access the sbe.
Agreed.
>> - any userspace implementation of any part of the sbei spec will
>> use the sbefifo uapi.
Agreed.
>> Below are not assertions but relevant items yet to be resolved, and
>> should not prevent moving forward with implementation of the above.
>>
>> - Whether or not an ‘sbescom’ DD is valuable.  If it is, it will
>> assemble requests, parse responses for whatever chip-ops it requires
>> and use the sbefifo in-kernel api in the same manner as the occ-hwmon DD.
>> imho, this feels like convenience code since we have a real hw scom
>> CFAM engine with UAPI.  A wrapper that hides this distinction could
>> just as easily be done in userspace without another DD.
I dont see a need for sbescom DD. A wrapper to the user-space sbe 
protocol driver lib can handle sbe scom vs fsi scom. For all practical 
purposes, we should ask users to use the sbe path only.
> Thanks for taking the time to write this up! I don't have any concerns
> with the above summary. I agree the sbescom driver seems unneccesary
> as whether to use chip-ops or real HW scom is something that userspace
> (rather than the kernel) should decide anyway, so I'm not sure what
> value having that wrapper in the kernel would have.
>
> - Alistair
>
>> Thanks to everyone participating in the discussion.
>>
>> -brad
>>
>>> On Feb 22, 2017, at 12:59 PM, Alistair Popple <alistair@popple.id.au> wrote:
>>>
>>> On Wed, 22 Feb 2017 10:53:12 PM Venkatesh Sainath wrote:
>>>
>>>> In general, I agree with this approach to contain only those interfaces
>>>> required by hwmon within the kernel and leave the rest to the
>>>> user-space. But, we need to interlock with the hwmon to understand
>>>> exactly which interfaces are required.
>>>> IMO, we need (a) Get/Put Memory for tunneling data to OCC and back (b)
>>>> Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages. If
>>>> these three are the right ones, then we need to contain them within the
>>>> kernel.
>>> Where are the OCC interfaces documented? We need to get a better
>>> understanding of these.
>>>
>>> Regardless I think you need a way for userspace to do chip-ops (for
>>> debug/testing/development/etc). So I guess the question is then which
>>> ones need a kernel implementation, and if there is a kernel
>>> implementation should userspace use that or it's own implementation?
>>>
>>> I think it's easiest to just have the userspace library contain all
>>> the neccessary chip-ops and use those. Formatting of chip-ops seems
>>> like it should be a trival amount of straight-forward code so the
>>> minor duplication shouldn't be a concern (especially if we leave
>>> framing up to the kernel). It's simpler than maintaining a long list
>>> of ioctls which would still need a userspace library imho.
>>>
>>>>>> I don't think it is a problem having get/putscom as an exceptional
>>>>>> case for the reasons described above. My question about the
>>>>>> consistency argument is what does it get us?
>>>>>>
>>>>>> I think Venkatesh was suggesting it would reduce duplication of
>>>>>> protocol driver code, however perhaps this isn't the case. We could
>>>>>> create a kernel chip-ops driver that deals with sending a buffer and
>>>>>> getting a response but doesn't have to know anything about the chip-op
>>>>>> itself. It could also implement the kernel sbe get/putscom.
>>>>>>
>>>>>> What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1.1.2.5
>>>>>> of the sbe interface spec. Userspace would submit command-class,
>>>>>> command-code & data words and the chip-ops driver would forward that
>>>>>> to the SBE and send the response back to userspace without having to
>>>>>> know what any of that data means.
>>>>> I like it!
>>>>>
>>>>> Would this ‘chip-op’ driver be distinct from the sbefifo driver or
>>>>> are you proposing a possible sbefifo driver API with a tad bit more
>>>>> abstraction?
>>>>>
>>>>> If we did something like this, does a standalone sbescom driver still
>>>>> have any value?
>>>> I think the proposal is to have a combined sbefifo+sbechipop driver that
>>>> provides a user space api to submit operations to sbefifo and user space
>>>> api for those chipops contained within ( scom, memory and sram). The
>>>> user space library will have the other sbe interfaces and will call the
>>>> submit operations of the chip-op driver. Is this correct? We could get
>>>> the user-space library provide a wrapper interface for even the chip-ops
>>>> contained within the kernel so that the caller doesnt have to know
>>>> whether to call the library or the driver apis.
>>>>>> In any case I think you will end up with a userspace implementation of
>>>>>> chip-ops anyway as it is much easier to test and develop new chip-ops
>>>>>> without having to also understand how to build and flash a new kernel.
>>>>>> Inevitably someone will want to add some kind of "debug" chip-op or
>>>>>> other private chip-op that they don't want published in kernel code,
>>>>>> and as soon as you have one userspace chip-op you may as well do all
>>>>>> of the ones you can from there.
>>>>>>
>>>>>>>> Of course we can implement just the get/put scom chip ops in kernel and the others in user space.  I just want to make sure everyone understands exactly what we’d be doing there and would be OK with that approach.
>>>>>>>>
>>>>>>>>> There's the OCC hwmon driver - what chip-ops does that
>>>>>>>>> need? Just get/putscom?
>>>>>>>> Correct, just get/putscom.  But sbe scom, not direct scom.
>>>>>>> occ hwmon driver should use get/put memory to communicate with OCC. One
>>>>>> What memory is the OCC using to store these buffer? Does it have
>>>>>> memory mapped onto the PowerBus into an MMIO space or something?
>>>>>>> other option ( I am not too happy about this ) is to embed the get/put
>>>>>>> memory protocol construction inside occ hwmon driver and make it call
>>>>>>> sbe fifo driver interface directly. The sbei protocol driver can then be
>>>>>>> in the user-space as a library and call the sbe fifo driver interface
>>>>>>> via ioctl. This creates duplication of the protocol driver code and we
>>>>>>> have to fix it in multiple places.
>>>>>>>>> If that's the case I thought we were already
>>>>>>>>> exposing scom chip-op operations via an OpenFSI master?
>>>>>>>> I have the same consistency question here.  Why is it preferable to have a UAPI for these chip-ops but not the others?
>>>>>>> openfsi driver is not exposing chipops. The sbe fifo driver must be
>>>>>>> calling the openfsi driver interfaces to write to the fifo. The openfsi
>>>>>>> driver must also be providing a UAPI for a non-sbe scom or cfam-write
>>>>>>> operations via cronus, pdbg or rest api.
>>>>>>>
>>>>>>> Net: openfsi driver need to have both intra-kernel and user-space APIs.
>>>>>>> sbe fifo driver also need to have both intra-kernel and user-space APIs
>>>>>>> if the sbei protocol driver goes to user-space.
>>>>>>>>> Regards,
>>>>>>>>>
>>>>>>>>> Alistair
>>>>>>>>>
>>>>>>>>>> thx - brad
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@linux.vnet.ibm.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Brad,
>>>>>>>>>>>
>>>>>>>>>>> I am not sure why we need a user-space api for SBE FIFO driver. Even the pdbg and cronus apps have to go through the SBEI protocol driver in order to construct the packets according to the SBEI interface spec which is done by the SBEI protocol driver only. I think only an in-kernel api is sufficient for the SBE FIFO driver.
>>>>>>>>>>>
>>>>>>>>>>> However, for the SBEI protocol driver, we would need both in-kernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus and rest apis ).
>>>>>>>>>>>
>>>>>>>>>>> Thanks
>>>>>>>>>>>
>>>>>>>>>>> With regards
>>>>>>>>>>> Venkatesh
>>>>>>>>>>>
>>>>>>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>>>>>>>>>>>> Thanks Jeremy for the reply.  I’ve added participants from this thread:
>>>>>>>>>>>>
>>>>>>>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>>>>>>>>>>>
>>>>>>>>>>>> in an attempt to consolidate the whole sbefifo design discussion to a single thread.
>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Brad,
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Looking to start a discussion around possible user space and kernel
>>>>>>>>>>>>>> APIs for the POWER9 sbefifo driver.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> There exists today an “alternate" sbefifo driver :-) that provides a
>>>>>>>>>>>>>> single submit ioctl.  Applications submit a request and get a reply in
>>>>>>>>>>>>>> single system call.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Is something like that the best approach for an upstream driver?  Or
>>>>>>>>>>>>>> should we try something more "pipe like" with read/write interfaces?
>>>>>>>>>>>>> It probably depends on the functionality there; ioctl() is useful in
>>>>>>>>>>>>> that (as you say) we can handle request and response in a single
>>>>>>>>>>>>> syscall, read() / write() may be more appropriate if ordering can be
>>>>>>>>>>>>> handled in userspace.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Can you add a little description about the functionality we're exposing?
>>>>>>>>>>>>> That may suggest a particular API.
>>>>>>>>>>>> In terms of hardware its pretty simple.  sbefifo is just two 8-word queues for sending/receiving messages to/from the SBE.  Each queue entry has a single ‘end of transfer’ flag to let the other side know the message is done.
>>>>>>>>>>>>
>>>>>>>>>>>> In terms of data flowing through it, there is an SBEI protocol that covers encoding operations (like getscom, getmem, etc.. aka chip-ops) and the SBE response.
>>>>>>>>>>>>
>>>>>>>>>>>> For users there seems to be two classes:
>>>>>>>>>>>>
>>>>>>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>>>>>>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>>>>>>>>>>>
>>>>>>>>>>>> If it weren’t for occ-hwmon, it doesn’t seem like there would be any need for the kernel to have any knowledge of the data flowing through the fifo (at the moment anyway).  An sbe-scom driver has been suggested but I wonder what the point of that driver would be, if userspace could simply encode a get/putscom chip-op and use the fifo directly.
>>>>>>>>>>>>
>>>>>>>>>>>>>> Would the in-kernel API be the same as the user space API?
>>>>>>>>>>>>> Probably not :)
>>>>>>>>>>>> I realize they wouldn’t be _exactly_ the same if thats why I got the smiley face :-) ...
>>>>>>>>>>>>
>>>>>>>>>>>> But I would have figured they’d at least be similar - meaning if we were go the ‘submit’ route for a UAPI..the kernel
>>>>>>>>>>>> would probably not have a split read/write API or vise versa.
>>>>>>>>>>>>
>>>>>>>>>>>> So to rephrase the question - would the chardev fops implementation simply be something like this:
>>>>>>>>>>>>
>>>>>>>>>>>> sbe-uapi-fops(chardev)
>>>>>>>>>>>>    data = copy to/from user space;
>>>>>>>>>>>>    sbedev = from_chardev(chardev);
>>>>>>>>>>>>    kernel-api(sbedev, data);
>>>>>>>>>>>>
>>>>>>>>>>>> Or are the other things to consider here?
>>>>>>>>>>>>
>>>>>>>>>>>> -thx
>>>>>>>>>>>>
>>>>>>>>>>>> brad
>>>>>>>>>>>>
>>>>>>>>>>>>> Cheers,
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Jeremy
