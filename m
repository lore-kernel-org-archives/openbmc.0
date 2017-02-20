Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRqkl0tWhzDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 04:05:18 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KH1EMu108352
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 12:05:16 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28r2vmcfvs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 12:05:16 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Mon, 20 Feb 2017 10:05:15 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 10:05:12 -0700
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 8BAEF3E40041;
 Mon, 20 Feb 2017 10:05:11 -0700 (MST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KH51iX21889272; Mon, 20 Feb 2017 17:05:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D51B6AC041;
 Mon, 20 Feb 2017 12:05:08 -0500 (EST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.199.49.237])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 536F4AC04A;
 Mon, 20 Feb 2017 12:05:02 -0500 (EST)
Subject: Re: sbefifo userspace api
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Alistair Popple <alistair@popple.id.au>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
 <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
 <2536438.YnoCRmC1BK@new-mexico>
 <E3C01BA4-46A6-4CEF-8995-A04CBCFCFDD3@fuzziesquirrel.com>
Cc: Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames.ibm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2017 22:35:12 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <E3C01BA4-46A6-4CEF-8995-A04CBCFCFDD3@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022017-0008-0000-0000-0000074789B4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006651; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824617; UDB=6.00403679; IPR=6.00602072; 
 BA=6.00005157; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014361; XFM=3.00000011;
 UTC=2017-02-20 17:05:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022017-0009-0000-0000-00004010B52C
Message-Id: <a0ddaf0a-7294-60b8-9997-b9b3623aacd2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200160
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
X-List-Received-Date: Mon, 20 Feb 2017 17:05:20 -0000



On 20/02/17 10:22 PM, Brad Bishop wrote:
> Thx Alistair!
>
>> On Feb 20, 2017, at 10:34 AM, Alistair Popple <alistair@popple.id.au> wrote:
>>
>> On Mon, 20 Feb 2017 07:20:25 AM Brad Bishop wrote:
>>> Hi Venkatesh
>>>
>>> If we put all the chip ops in the kernel then I would agree with you.
>>>
>>> However, a number of others have expressed concern with putting the chip ops in the kernel.
>>>
>>> Joel/Alistair - can you elaborate on your concerns with this approach of putting the chip-ops in the kernel?
>> The main concern I had was that putting the chip-ops in the kernel
>> makes it more complicated to update/add chip-ops. Having them in the
>> kernel would require a userspace API for each chip-op that would not
>> be able to change, or at least could only change in a way that does
>> not break backwards compatibility. Putting them in userpsace would
>> allow you to build a library and manage any API changes between the
>> users of that library.
> Fair point.  What makes sbescom a special exception to this?  Are we OK with a real, fixed UAPI for sbescom, but the others are implemented in a library?  That feels inconsistent to me.
As the interface is itself controlled by the specification, we should 
anyway make it backward compatible. I was also hoping that the sbei 
protocol driver sits in user-space as a library (if not for the occ 
hwmon...).
>> I would also be interested in the answer to the inverse - why put them
>> in the kernel?
> Fair question.  I’m hoping Venkatesh responds with some things I may have overlooked.
>
> The only case I have for this is the consistency argument I made above.  I would rather see all or none in the kernel.  I’d be fine with none, but I can’t see a way to implement occ-hwmon that way.  So I fall back to all.
>
> Of course we can implement just the get/put scom chip ops in kernel and the others in user space.  I just want to make sure everyone understands exactly what we’d be doing there and would be OK with that approach.
>
>> There's the OCC hwmon driver - what chip-ops does that
>> need? Just get/putscom?
> Correct, just get/putscom.  But sbe scom, not direct scom.
occ hwmon driver should use get/put memory to communicate with OCC. One 
other option ( I am not too happy about this ) is to embed the get/put 
memory protocol construction inside occ hwmon driver and make it call 
sbe fifo driver interface directly. The sbei protocol driver can then be 
in the user-space as a library and call the sbe fifo driver interface 
via ioctl. This creates duplication of the protocol driver code and we 
have to fix it in multiple places.
>> If that's the case I thought we were already
>> exposing scom chip-op operations via an OpenFSI master?
> I have the same consistency question here.  Why is it preferable to have a UAPI for these chip-ops but not the others?
openfsi driver is not exposing chipops. The sbe fifo driver must be 
calling the openfsi driver interfaces to write to the fifo. The openfsi 
driver must also be providing a UAPI for a non-sbe scom or cfam-write 
operations via cronus, pdbg or rest api.

Net: openfsi driver need to have both intra-kernel and user-space APIs. 
sbe fifo driver also need to have both intra-kernel and user-space APIs 
if the sbei protocol driver goes to user-space.
>> Regards,
>>
>> Alistair
>>
>>> thx - brad
>>>
>>>
>>>
>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@linux.vnet.ibm.com> wrote:
>>>>
>>>> Hi Brad,
>>>>
>>>> I am not sure why we need a user-space api for SBE FIFO driver. Even the pdbg and cronus apps have to go through the SBEI protocol driver in order to construct the packets according to the SBEI interface spec which is done by the SBEI protocol driver only. I think only an in-kernel api is sufficient for the SBE FIFO driver.
>>>>
>>>> However, for the SBEI protocol driver, we would need both in-kernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus and rest apis ).
>>>>
>>>> Thanks
>>>>
>>>> With regards
>>>> Venkatesh
>>>>
>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>>>>> Thanks Jeremy for the reply.  I’ve added participants from this thread:
>>>>>
>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>>>>
>>>>> in an attempt to consolidate the whole sbefifo design discussion to a single thread.
>>>>>
>>>>>> Hi Brad,
>>>>>>
>>>>>>> Looking to start a discussion around possible user space and kernel
>>>>>>> APIs for the POWER9 sbefifo driver.
>>>>>>>
>>>>>>> There exists today an “alternate" sbefifo driver :-) that provides a
>>>>>>> single submit ioctl.  Applications submit a request and get a reply in
>>>>>>> single system call.
>>>>>>>
>>>>>>> Is something like that the best approach for an upstream driver?  Or
>>>>>>> should we try something more "pipe like" with read/write interfaces?
>>>>>> It probably depends on the functionality there; ioctl() is useful in
>>>>>> that (as you say) we can handle request and response in a single
>>>>>> syscall, read() / write() may be more appropriate if ordering can be
>>>>>> handled in userspace.
>>>>>>
>>>>>> Can you add a little description about the functionality we're exposing?
>>>>>> That may suggest a particular API.
>>>>> In terms of hardware its pretty simple.  sbefifo is just two 8-word queues for sending/receiving messages to/from the SBE.  Each queue entry has a single ‘end of transfer’ flag to let the other side know the message is done.
>>>>>
>>>>> In terms of data flowing through it, there is an SBEI protocol that covers encoding operations (like getscom, getmem, etc.. aka chip-ops) and the SBE response.
>>>>>
>>>>> For users there seems to be two classes:
>>>>>
>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>>>>
>>>>> If it weren’t for occ-hwmon, it doesn’t seem like there would be any need for the kernel to have any knowledge of the data flowing through the fifo (at the moment anyway).  An sbe-scom driver has been suggested but I wonder what the point of that driver would be, if userspace could simply encode a get/putscom chip-op and use the fifo directly.
>>>>>
>>>>>>> Would the in-kernel API be the same as the user space API?
>>>>>> Probably not :)
>>>>> I realize they wouldn’t be _exactly_ the same if thats why I got the smiley face :-) ...
>>>>>
>>>>> But I would have figured they’d at least be similar - meaning if we were go the ‘submit’ route for a UAPI..the kernel
>>>>> would probably not have a split read/write API or vise versa.
>>>>>
>>>>> So to rephrase the question - would the chardev fops implementation simply be something like this:
>>>>>
>>>>> sbe-uapi-fops(chardev)
>>>>>    data = copy to/from user space;
>>>>>    sbedev = from_chardev(chardev);
>>>>>    kernel-api(sbedev, data);
>>>>>
>>>>> Or are the other things to consider here?
>>>>>
>>>>> -thx
>>>>>
>>>>> brad
>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>>
>>>>>> Jeremy
