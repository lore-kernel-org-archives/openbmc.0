Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2Dk32t5dzDqMj
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 00:34:51 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0GDYNdx029985;
 Mon, 16 Jan 2017 07:34:24 -0600
Message-ID: <1484573670.11927.35.camel@kernel.crashing.org>
Subject: Re: [PATCH v2] drivers/misc: Add ASpeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, jk@ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Mon, 16 Jan 2017 07:34:30 -0600
In-Reply-To: <20170116104537.GA29148@kroah.com>
References: <20170113074713.6175-1-cyrilbur@gmail.com>
 <20170113103625.GA15142@kroah.com> <1484520215.13393.1.camel@gmail.com>
 <1484541915.11927.31.camel@kernel.crashing.org>
 <20170116104537.GA29148@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 16 Jan 2017 13:34:52 -0000

On Mon, 2017-01-16 at 11:45 +0100, Greg KH wrote:
> For an ioctl structure like this, can you guarantee that the "padding"
> will always be the same?  Last time I looked, the C standard didn't say
> anything about that, so I would strongly recommend making it so that no
> padding is needed at all...

The implicit padding is a matter of ABI more than C standard, we
already rely on this in a bazillion of places but it *has* bitten us in
a few corner cases (mostly when u64 is involved due to ABI differences
between 32-bit and 64-bit), so explicit padding is indeed preferred.

Cyril can you respin with:

	struct aspeed_lpc_ctrl_mapping {
		__u8    window_type;
		__u8    window_id;
		__u16   pad;
		__u32   addr;
		__u32   offset;
		__u32   size;

I prefer that, it makes more sense to keep the window type/id at the
top. Alternatively call "pad", "flags", and describe that clients must
zero it, that way we can use it for future extensions of we ever have
to.

Also for mmap, you have:

       /* AHB accesses are not cache coherent */
       if (file->f_flags & O_DSYNC)
               prot = pgprot_noncached(prot);

Why the test for O_DSYNC ? I'd rather not make this a userspace
responsibility to get right... I'd have made it unconditional.

I notice ARM has pgprot_dmacoherent() that might just do what we want
here, ie, non-cachable if needed. Otherwise, I'd just unconditionally
set it to noncached, we can revisit that if Aspeed ever comes up with a
coherent SoC which I very much doubt but ...

Cheers,
Ben.
