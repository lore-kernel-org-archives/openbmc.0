Return-Path: <clg@kaod.org>
Received: from 17.mo5.mail-out.ovh.net (17.mo5.mail-out.ovh.net
 [46.105.56.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tF1t665RxzDt0P
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 23:03:58 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 32A2644DE0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 12:55:33 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 30E4A60008E;
 Thu, 10 Nov 2016 12:55:09 +0100 (CET)
Subject: Re: [PATCH u-boot v2] Enable FIT image support and FDT loading for
 AST2400/AST2500
To: Rick Altherr <raltherr@google.com>, Joel Stanley <joel@jms.id.au>
References: <1478064386-29575-1-git-send-email-raltherr@google.com>
 <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
 <CAPLgG==PvpmFWm94esWZET9=8FPVdYvCcOaS24vokOvwnpwCtA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <92dcdbf3-ad89-972d-ef9a-d20a1e11373a@kaod.org>
Date: Thu, 10 Nov 2016 12:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAPLgG==PvpmFWm94esWZET9=8FPVdYvCcOaS24vokOvwnpwCtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6926536230971673346
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtdefgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 10 Nov 2016 12:03:59 -0000

On 11/10/2016 01:00 AM, Rick Altherr wrote:
> 
> 
> On Tue, Nov 1, 2016 at 11:31 PM, Joel Stanley <joel@jms.id.au <mailto:joel@jms.id.au>> wrote:
> 
>     Hi Rick,
> 
>     On Wed, Nov 2, 2016 at 3:56 PM, Rick Altherr <raltherr@google.com <mailto:raltherr@google.com>> wrote:
>     > FIT is the modern u-boot native image format for kernels, device trees,
>     > and ramdisks.  Enabling FIT only compiles in support for the image
>     > format.  For these devices, the kernel+dtb and ramdisk are loaded from
>     > separate locations in flash and can be any mix of legacy or FIT images.
>     > When using FIT images, the dtb is stored as a separate entry that
>     > requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.
>     >
>     > Tested under qemu with both legacy and FIT kernel+dtb images for
>     > palmetto and witherspoon.
> 
>     The changes look good to me.
> 
>     Is the FIT support in v2016.07 new enough for us? Is there any reason
>     to move to a v2016.09 base?
> 
> 
> AFAIK, v2016.07 is new enough.  It certainly includes FIT, FDT loading, and FIT signature checking.
>  
> 
>     It does introduce a warning in a hack we carry for loading the
>     initramfs, which I think points to a legitimate issue:
> 
>     common/image.c: In function ‘boot_get_ramdisk’:
>     common/image.c:1078:4: warning: ‘rd_load’ may be used uninitialized in
>     this function [-Wmaybe-uninitialized]
>         memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
>     This code an Aspeed hack we carry. It is required to copy the
>     initramfs from flash. Cedric was doing some investigation into why we
>     need the hack, and it appears to be an upstream bug.
> 
>     If I read the code correctly, prior to enabling FIT we only accepted
>     IMAGE_FORMAT_LEGACY. If we move the hack to be part of that case we
>     should be ok, as we don't need to do the hack when loading from FIT.
> 
>     Can you try that and add a second patch to your series that moves the hack?
> 
> Looks like Cedric has a patch that just removes the hack.  I'll look into this more and add it to my series.

Thanks. tell us how it goes. I think we should be able to remove the hack
for the ramdisk if we use fdt.

C.
