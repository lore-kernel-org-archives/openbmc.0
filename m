Return-Path: <clg@kaod.org>
X-Greylist: delayed 49589 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Oct 2016 08:04:15 AEDT
Received: from 5.mo1.mail-out.ovh.net (5.mo1.mail-out.ovh.net [178.33.45.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw3BR3wGDzDt1j
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 08:04:14 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0EE9614230
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 22:58:35 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 3A04A2A0072;
 Thu, 13 Oct 2016 22:58:32 +0200 (CEST)
Subject: Re: Single device tree blob between linux and u-boot
To: Rick Altherr <raltherr@google.com>, Maxim Sloyko <maxims@google.com>
References: <CAPH-5w6RE2j7ghR9vhX2ANUQAvBx4GuhquZ=v8r9_vYK6q+9OQ@mail.gmail.com>
 <CAFR_W8roBycAtvE-sNLfKRTMw=uPusx0tdWU-az4mqB7N9N8UA@mail.gmail.com>
 <CAPLgG=kafSFfaj4P569+qr=y4130ScobqtwCY94sYbm1uJzfFw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <318793aa-fdee-946e-2f43-0c63734cea19@kaod.org>
Date: Thu, 13 Oct 2016 22:58:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAPLgG=kafSFfaj4P569+qr=y4130ScobqtwCY94sYbm1uJzfFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17688731962869254914
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeggdduheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 13 Oct 2016 21:04:16 -0000

On 10/13/2016 09:37 PM, Rick Altherr wrote:
> I've been working on signed kernel images which depends on building 
> FIT images that include the kernel, initrd, and dtb.  The kernel_fitimage 
> branch of my tree (https://github.com/kc8apf/openbmc) will build an 
> unsigned FIT image by including the dtb specified in the machine config 
> (usually from the kernel).  There are also provisions in there for u-boot 
> being built in two stages so a control dtb that includes the public signing 
> keys can be combined into the final u-boot binary.  From how that is structure, 
> I suspect Maxim is right that there will be some differences between u-boot's 
> dtb and linux's dtb.  That shouldn't be an issue as the u-boot dtb gets built 
> into the u-boot image while the kernel dtb is loaded from the FIT image.

No it shouldn't be too problematic. 

let's get going and see what a first draft would look like. We would need 
a first driver using a very minimal u-boot dtb to start with and I suppose 
it will be the I2C one. Could you build a uboot tree with both so we can 
experiment ? 

We need to make sure that a new uboot boots an old image also.

Thanks,

C. 



> Rick
> 
> On Thu, Oct 13, 2016 at 11:41 AM, Maxim Sloyko <maxims@google.com <mailto:maxims@google.com>> wrote:
> 
> 
> 
>     On Thu, Oct 13, 2016 at 11:20 AM, Xo Wang <xow@google.com <mailto:xow@google.com>> wrote:
> 
>         Hi folks,
> 
>         I saw Cedric had mentioned "...you can use the linux compiled [dtb]
>         and dd it at the end of the u-boot
>         partition..."
> 
>         To provide the device tree to u-boot, should we do what Cedric said
>         and also pass the address of the DTB from U-Boot to Linux? According
>         to these slides:
> 
>         https://events.linuxfoundation.org/sites/events/files/slides/petazzoni-device-tree-dummies.pdf <https://events.linuxfoundation.org/sites/events/files/slides/petazzoni-device-tree-dummies.pdf>
> 
>         U-Boot can pass the DTB address to Linux in r2 (p. 6) with the right
>         bootm command parameters.
> 
>         This means we can have U-Boot and Linux use the same DTB binary (I
>         prefer built in Linux) rather than each source tree building one.
> 
> 
>     This introduces the dependency of U-Boot on Linux. Do we plan to keep this dependency forever? This may be fine with OpenBMC, but what about mainline U-Boot and Linux?
>     Also, are we sure that they are 100% compatible? IIRC Peter was saying that in practice you need two different device trees for U-Boot and Linux.
>      
> 
> 
>         Then we can remove the CONFIG_ARM_APPENDED_DTB option in our Linux
>         build that is described as a legacy "compatibility" mechanism. We also
>         avoid having an extra copy of the DTSs in U-Boot source and avoid
>         duplicate DTBs in our image.
> 
>         Thoughts?
> 
>         cheers
>         xo
>         _______________________________________________
>         openbmc mailing list
>         openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>         https://lists.ozlabs.org/listinfo/openbmc <https://lists.ozlabs.org/listinfo/openbmc>
> 
> 
> 
> 
>     -- 
>     *M*axim *S*loyko
> 
>     _______________________________________________
>     openbmc mailing list
>     openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>     https://lists.ozlabs.org/listinfo/openbmc <https://lists.ozlabs.org/listinfo/openbmc>
> 
> 
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
> 
