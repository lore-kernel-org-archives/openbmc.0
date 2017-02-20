Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRWmT6n6lzDq8X
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 16:05:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1K53hfs099611
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 00:05:43 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28qca3h2sf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 00:05:43 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Mon, 20 Feb 2017 00:05:42 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 00:05:40 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 019826E803C;
 Mon, 20 Feb 2017 00:05:11 -0500 (EST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1K55dgf59572260; Mon, 20 Feb 2017 05:05:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A5B5AE04B;
 Mon, 20 Feb 2017 00:05:37 -0500 (EST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.199.66.188])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id BD963AE03B;
 Mon, 20 Feb 2017 00:05:34 -0500 (EST)
Subject: Re: sbefifo userspace api
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, eajames.ibm@gmail.com,
 Joel Stanley <joel@jms.id.au>, Alistair Popple <alistair@popple.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <8d23fb00-29ae-dc69-46d6-27b48ab3dfa4@ozlabs.org>
 <06896367-F28B-4BDE-8EDC-7AC3AAE8766D@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2017 10:35:43 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <06896367-F28B-4BDE-8EDC-7AC3AAE8766D@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022005-0040-0000-0000-000002AA8919
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006648; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00824377; UDB=6.00403536; IPR=6.00601833; 
 BA=6.00005154; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014352; XFM=3.00000011;
 UTC=2017-02-20 05:05:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022005-0041-0000-0000-0000069DAC27
Message-Id: <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200051
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
X-List-Received-Date: Mon, 20 Feb 2017 05:05:46 -0000

Hi Brad,

  I am not sure why we need a user-space api for SBE FIFO driver. Even 
the pdbg and cronus apps have to go through the SBEI protocol driver in 
order to construct the packets according to the SBEI interface spec 
which is done by the SBEI protocol driver only. I think only an 
in-kernel api is sufficient for the SBE FIFO driver.

  However, for the SBEI protocol driver, we would need both in-kernel ( 
for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus and 
rest apis ).

Thanks

With regards
Venkatesh

On 20/02/17 8:17 AM, Brad Bishop wrote:
> Thanks Jeremy for the reply.  I’ve added participants from this thread:
>
> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>
> in an attempt to consolidate the whole sbefifo design discussion to a single thread.
>
>> Hi Brad,
>>
>>> Looking to start a discussion around possible user space and kernel
>>> APIs for the POWER9 sbefifo driver.
>>>
>>> There exists today an “alternate" sbefifo driver :-) that provides a
>>> single submit ioctl.  Applications submit a request and get a reply in
>>> single system call.
>>>
>>> Is something like that the best approach for an upstream driver?  Or
>>> should we try something more "pipe like" with read/write interfaces?
>> It probably depends on the functionality there; ioctl() is useful in
>> that (as you say) we can handle request and response in a single
>> syscall, read() / write() may be more appropriate if ordering can be
>> handled in userspace.
>>
>> Can you add a little description about the functionality we're exposing?
>> That may suggest a particular API.
> In terms of hardware its pretty simple.  sbefifo is just two 8-word queues for sending/receiving messages to/from the SBE.  Each queue entry has a single ‘end of transfer’ flag to let the other side know the message is done.
>
> In terms of data flowing through it, there is an SBEI protocol that covers encoding operations (like getscom, getmem, etc.. aka chip-ops) and the SBE response.
>
> For users there seems to be two classes:
>
> 1 - user space wanting to do chip-ops (pdbg, cronus).
> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>
> If it weren’t for occ-hwmon, it doesn’t seem like there would be any need for the kernel to have any knowledge of the data flowing through the fifo (at the moment anyway).  An sbe-scom driver has been suggested but I wonder what the point of that driver would be, if userspace could simply encode a get/putscom chip-op and use the fifo directly.
>
>>> Would the in-kernel API be the same as the user space API?
>> Probably not :)
> I realize they wouldn’t be _exactly_ the same if thats why I got the smiley face :-) ...
>
> But I would have figured they’d at least be similar - meaning if we were go the ‘submit’ route for a UAPI..the kernel
> would probably not have a split read/write API or vise versa.
>
> So to rephrase the question - would the chardev fops implementation simply be something like this:
>
> sbe-uapi-fops(chardev)
>     data = copy to/from user space;
>     sbedev = from_chardev(chardev);
>     kernel-api(sbedev, data);
>
> Or are the other things to consider here?
>
> -thx
>
> brad
>
>> Cheers,
>>
>>
>> Jeremy
