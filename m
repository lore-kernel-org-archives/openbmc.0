Return-Path: <clg@kaod.org>
X-Greylist: delayed 4578 seconds by postgrey-1.36 at bilbo;
 Sun, 22 Jan 2017 04:11:19 AEDT
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
 [87.98.165.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v5PHW6vFwzDqVS
 for <openbmc@lists.ozlabs.org>; Sun, 22 Jan 2017 04:11:19 +1100 (AEDT)
Received: from player693.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 59F2F771E4
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 16:54:55 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 171FF440071;
 Sat, 21 Jan 2017 16:54:48 +0100 (CET)
Subject: Re: Does anyone tftpboot the userspace image?
To: Mine <mine260309@gmail.com>, Xo Wang <xow@google.com>
References: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
 <CAARXrtmP1i4NZNO+jE5WmS7QRLd3d7E_yR8dDu8qrx82QnOX9Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c4e8de61-cca0-ab23-f1ac-fb5d52b0e7b8@kaod.org>
Date: Sat, 21 Jan 2017 16:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtmP1i4NZNO+jE5WmS7QRLd3d7E_yR8dDu8qrx82QnOX9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9533557463459531522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrgeehgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Sat, 21 Jan 2017 17:11:20 -0000

Hello, 

On 01/21/2017 11:10 AM, Mine wrote:
> Hi Xo,
> 
> 
> On Sat, Jan 21, 2017 at 9:59 AM, Xo Wang <xow@google.com> wrote:
>> Hi folks,
>>
>> I noticed from this discussion
>> https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#2738
>> that kernel developers were tftpbooting the userspace image from a
>> obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.
>>
>> 1. How does/did that work? I guess you needed a custom init in the
>> initrd to load the u-boot container (?) instead of from mtd?
> 
> In uboot, we can use tftp to load the kernel and initrd to specific address,
> and use `bootm` command to start the kernel.
> E.g. for witherspoon:
> tftp 0x80001000 kernel
> tftp 0x81000000 initrd
> bootm 0x80001000 0x81000000

yes. There is nothing more to do to use these images. Just replace
initrd by obmc-phosphor-image-$platform.cpio.lzma.u-boot

>>
>> 2. Are you still using this? Building the extra .cpio.lzma.u-boot is
>> kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
>> mkimage' every build, and it can't be parallelized.
> 
> I believe someone uses this, since it does not require to flash the image to
> the NOR flash, and make it easier to test new build.

yes. You can also use it to test an older build to check for 
regressions or to restore a system that was trashed by a buggy 
kernel. I have used it a few times and I still do to boot 
openbmc-1.0 images. It would be nice to keep these images. 

Thanks,

C. 
