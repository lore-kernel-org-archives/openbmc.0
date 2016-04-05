Return-Path: <clg@fr.ibm.com>
Received: from e06smtp16.uk.ibm.com (e06smtp16.uk.ibm.com [195.75.94.112])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qfXjb2pqJzDq6T
 for <openbmc@lists.ozlabs.org>; Wed,  6 Apr 2016 01:25:23 +1000 (AEST)
Received: from localhost
 by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@fr.ibm.com>;
 Tue, 5 Apr 2016 16:25:18 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
 by e06smtp16.uk.ibm.com (192.168.101.146) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 5 Apr 2016 16:25:17 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@fr.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id C96D6219005C
 for <openbmc@lists.ozlabs.org>; Tue,  5 Apr 2016 16:24:56 +0100 (BST)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
 [9.149.37.228])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u35FPGtB2163110
 for <openbmc@lists.ozlabs.org>; Tue, 5 Apr 2016 15:25:17 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u35FPGTA032030
 for <openbmc@lists.ozlabs.org>; Tue, 5 Apr 2016 09:25:16 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u35FPG7n032025; Tue, 5 Apr 2016 09:25:16 -0600
Received: from [9.101.4.42] (hermes.lab.toulouse-stg.fr.ibm.com [9.101.4.42])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id
 0F9DB220386; Tue,  5 Apr 2016 17:25:15 +0200 (CEST)
Subject: Re: [PATCH openbmc v3 1/2] meta-phosphor/u-boot: Move to newer version
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <1459778435-28142-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459778435-28142-2-git-send-email-openbmc-patches@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>
Message-ID: <5703D8D5.3090203@fr.ibm.com>
Date: Tue, 5 Apr 2016 17:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1459778435-28142-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16040515-0025-0000-0000-00000EA01DFB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2016 15:25:24 -0000

Hello,

I have given some time recently to the OpenBmc U-Boot and came up with
a first initial port of the aspeed code on a recent version, v2016.03.
Here is the tree :

	https://github.com/legoater/u-boot/commits/v2016.03-aspeed-openbmc

There is still quite a lot of cleanup to do, the code has warnings, some
configure defines are probably obsolete. This is clearly not finished yet.
But it is usable.

These compilers on jessie generate a u-boot.bin file which boots a
palmetto bmc with success :

gcc version 5.2.0 (crosstool-NG crosstool-ng-1.22.0)
gcc version 4.8.4 20141219 (release) (4.8.4-1+11-1)

So if some of you has time (and a flash programmer), could you please
give it a try ? I will be glad to have positive feedback. You can curse
me if not :)

Then, I would be interested to see how we proceed from there to include
more changes.

Thanks,

C. 



On 04/04/2016 04:00 PM, OpenBMC Patches wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> Fixes from Milton for u-boot leaving ethernet device running after
> loading linux:
> 
>       net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
>       net: aspeednic: Do not start hardware in initialize
>       net: aspeednic: Remove extra spaces before assignments
>       net: aspeednic: Do not fill in a random MAC address
>       net: Implement random ethaddr fallback in eth.c
> 
> Backports from upstream from me to support building under modern GCC
> versions:
> 
>       common: main.c: make show_boot_progress __weak
>       ARM:asm:io.h use static inline
>       arm: board: use __weak
>       net: Implement random ethaddr fallback in eth.c
>       compiler*.h: sync include/linux/compiler*.h with Linux 4.5-rc6
> 
> Signeo-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> index 6070fbf..f2434ad 100644
> --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> +++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> @@ -10,9 +10,8 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>                      file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>  
> -# This revision corresponds to the tag "v2013.07"
>  # We use the revision in order to avoid having to fetch it from the repo during parse
> -SRCREV = "4b44678c11ac82c7c797bb115e276181752ad54d"
> +SRCREV = "44f1262bdf39ad93032d39f17a298165372be82e"
>  
>  PV = "v2013.07+git${SRCPV}"
>  
> 
