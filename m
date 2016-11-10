Return-Path: <clg@kaod.org>
X-Greylist: delayed 20434 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Nov 2016 02:09:35 AEDT
Received: from 7.mo5.mail-out.ovh.net (7.mo5.mail-out.ovh.net [178.32.124.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tF60H1FBYzDwFb
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 02:09:35 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id BCACC44FC5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 15:32:41 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 83976600083;
 Thu, 10 Nov 2016 15:32:34 +0100 (CET)
Subject: Re: [PATCH u-boot v2] Enable FIT image support and FDT loading for
 AST2400/AST2500
To: Rick Altherr <raltherr@google.com>, Joel Stanley <joel@jms.id.au>
References: <1478064386-29575-1-git-send-email-raltherr@google.com>
 <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
 <CAPLgG==PvpmFWm94esWZET9=8FPVdYvCcOaS24vokOvwnpwCtA@mail.gmail.com>
 <92dcdbf3-ad89-972d-ef9a-d20a1e11373a@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5053535c-ef55-6aa2-38ec-101a01c3ce90@kaod.org>
Date: Thu, 10 Nov 2016 15:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <92dcdbf3-ad89-972d-ef9a-d20a1e11373a@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9585911808393054978
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtdefgdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 10 Nov 2016 15:09:35 -0000


>>     It does introduce a warning in a hack we carry for loading the
>>     initramfs, which I think points to a legitimate issue:
>>
>>     common/image.c: In function ‘boot_get_ramdisk’:
>>     common/image.c:1078:4: warning: ‘rd_load’ may be used uninitialized in
>>     this function [-Wmaybe-uninitialized]
>>         memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
>>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>>     This code an Aspeed hack we carry. It is required to copy the
>>     initramfs from flash. Cedric was doing some investigation into why we
>>     need the hack, and it appears to be an upstream bug.
>>
>>     If I read the code correctly, prior to enabling FIT we only accepted
>>     IMAGE_FORMAT_LEGACY. If we move the hack to be part of that case we
>>     should be ok, as we don't need to do the hack when loading from FIT.
>>
>>     Can you try that and add a second patch to your series that moves the hack?
>>
>> Looks like Cedric has a patch that just removes the hack.  I'll look into this more and add it to my series.
> 
> Thanks. tell us how it goes. I think we should be able to remove the hack
> for the ramdisk if we use fdt.

Talking of hacks, I think I have killed this ugly one :

	https://github.com/legoater/u-boot/commit/c17a8847ca6c1fa8b00c16bd78a70a61cc1f0569

Here is my branch based on a v2016.11-rc3+

	https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc

in which I removed the mmu disablement hack. I only tested it on
a AST2500 evb. Could some one (with a flash programmer) confirm
on a board with the same SoC ? 



I think that device tree support will remove the need of ramdisk
hacks. From there, the only (major) problem left is the DRAM 
calibration algo which needs to be rewritten in C. 

Did a wiki update :

	https://github.com/openbmc/u-boot/wiki


Cheers,

C.
