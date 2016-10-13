Return-Path: <clg@kaod.org>
Received: from 10.mo1.mail-out.ovh.net (10.mo1.mail-out.ovh.net
 [178.32.96.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svjP469svzDsxn
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 18:42:16 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E420C14109
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:42:11 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 1934B2A0072;
 Thu, 13 Oct 2016 09:42:09 +0200 (CEST)
Subject: Re: FW: Kernel panic error while emulating qemuarm image
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <C160D2872FE0DE4683E1910F9BF829414846E2E3@avsrvexchmbx2.microsemi.net>
 <8edc2e64-9ead-43ca-f4ae-d2c262721644@kaod.org>
 <C160D2872FE0DE4683E1910F9BF829414846E33E@avsrvexchmbx2.microsemi.net>
Cc: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c00687ba-1f32-14e9-57f0-52df17aaa6a0@kaod.org>
Date: Thu, 13 Oct 2016 09:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <C160D2872FE0DE4683E1910F9BF829414846E33E@avsrvexchmbx2.microsemi.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4238731677858171650
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeefgdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 13 Oct 2016 07:42:17 -0000

On 10/13/2016 09:32 AM, Arjun Padmanabhan wrote:
> Hi,
> 
> Thanks for the reply.
> 
> Update: For default compilation(armv5e) without changing tuning 
> features, I could run qemu(2.7.0) with built image. Issue  of
> kernel panic happens when I change tuning feature file as I 
> mentioned in trailing mail.

I am not sure what you are trying to achieve but, under qemu, the 
machine 'palmetto-bmc' emulates a board with a ARM926EJ-S CPU which 
is a v5. So it will be difficult to run a kernel compiled for
an above version of the instruction set.

You will need to run the machine 'ast2500-evb' which emulates a
board with a ARM1176, which is a v6+. That might be better.


qemu-system-arm -m 512 -M ast2500-evb -nographic \
	-drive file=<path>/flash-palmetto,format=raw,if=mtd \
	-net nic \
	-net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu

using -kernel should work also.

Thanks

C.
 

> Thanks
> Arjun Padmanabhan	
> 
> -----------------------------------------------------------------------------------------------------------------------------
> 
> -----Original Message-----
> From: Cédric Le Goater [mailto:clg@kaod.org] 
> Sent: Thursday, October 13, 2016 12:48 PM
> To: Arjun Padmanabhan; openbmc@lists.ozlabs.org
> Cc: Balaji Marimuthu
> Subject: Re: FW: Kernel panic error while emulating qemuarm image
> 
> EXTERNAL EMAIL
> 
> 
> Hello,
> 
> Could you try out the instructions under :
> 
>         https://github.com/openbmc/docs/blob/master/cheatsheet.md
> 
> and please use this qemu tree :
> 
>         https://github.com/openbmc/qemu
> 
> Mainline is missing a few models.
> 
> Thanks,
> 
> C.
> 
> On 10/13/2016 06:46 AM, Arjun Padmanabhan wrote:
>> Hi,
>>
>>
>>
>> I cloned openbmc repository and built image for qemu-arm.
>>
>>
>>
>> Since I need to build for armv7, I changed tuning files.
>>
>>
>>
>> The file I changed and changes I made was
>>
>> 1.       meta/conf/machine/include/tune-arm926ejs.inc
>>
>> -          DEFAULTTUNE ?= “armv7a”
>>
>> -          Require conf/machine/include/arm/arch-armv7a.inc
>>
>>
>>
>> After making these changes, I executed bitbake obmc-phosphor-image.
>>
>>
>>
>> I tried running runqemu qemuarm but the command is stuck at VNC. Please find ScreenShot1.png attached.
>>
>>
>>
>> As an alternative way I downloaded qemu-2.7.0 source code and built the qemu executable.
>>
>>
>>
>> Using the built executable, qemu started but I am observing kernel-panic error. Please find ScreenShot2.png attached.
>>
>>
>>
>> Is there any way to get past this issue? Am I missing something or whether the steps I did was wrong for building for armv7?
>>
>>
>>
>> Regards
>>
>> Arjun Padmanabhan
>>
>> Software Design Engineer
>>
>> Microsemi Storage Solutions India Pvt. Ltd.
>>
>>
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>>
> 
