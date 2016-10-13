Return-Path: <clg@kaod.org>
X-Greylist: delayed 671 seconds by postgrey-1.36 at bilbo;
 Thu, 13 Oct 2016 18:24:16 AEDT
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svj0J4CBqzDsyH
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 18:24:15 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 42D771402F
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:17:41 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 1A4EA2A0072;
 Thu, 13 Oct 2016 09:17:38 +0200 (CEST)
Subject: Re: FW: Kernel panic error while emulating qemuarm image
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <C160D2872FE0DE4683E1910F9BF829414846E2E3@avsrvexchmbx2.microsemi.net>
Cc: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8edc2e64-9ead-43ca-f4ae-d2c262721644@kaod.org>
Date: Thu, 13 Oct 2016 09:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <C160D2872FE0DE4683E1910F9BF829414846E2E3@avsrvexchmbx2.microsemi.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3824963462054644482
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeefgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 13 Oct 2016 07:24:16 -0000

Hello, 

Could you try out the instructions under :

	https://github.com/openbmc/docs/blob/master/cheatsheet.md

and please use this qemu tree :

	https://github.com/openbmc/qemu

Mainline is missing a few models.

Thanks,

C. 

On 10/13/2016 06:46 AM, Arjun Padmanabhan wrote:
> Hi,
> 
>  
> 
> I cloned openbmc repository and built image for qemu-arm.
> 
>  
> 
> Since I need to build for armv7, I changed tuning files.
> 
>  
> 
> The file I changed and changes I made was
> 
> 1.       meta/conf/machine/include/tune-arm926ejs.inc
> 
> -          DEFAULTTUNE ?= “armv7a”
> 
> -          Require conf/machine/include/arm/arch-armv7a.inc
> 
>  
> 
> After making these changes, I executed bitbake obmc-phosphor-image.
> 
>  
> 
> I tried running runqemu qemuarm but the command is stuck at VNC. Please find ScreenShot1.png attached.
> 
>  
> 
> As an alternative way I downloaded qemu-2.7.0 source code and built the qemu executable.
> 
>  
> 
> Using the built executable, qemu started but I am observing kernel-panic error. Please find ScreenShot2.png attached.
> 
>  
> 
> Is there any way to get past this issue? Am I missing something or whether the steps I did was wrong for building for armv7?
> 
>  
> 
> Regards
> 
> Arjun Padmanabhan
> 
> Software Design Engineer
> 
> Microsemi Storage Solutions India Pvt. Ltd.
> 
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
> 
