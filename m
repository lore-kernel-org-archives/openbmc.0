Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3hw41xQzzDqGr
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 09:48:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UWxwz0Wu"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id 75so2384331pgf.3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 14:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fTZJx1PzZG71p6G6mss5BFiqS01KvdBwMP58/c5DbU=;
 b=UWxwz0WuvEl0tJ4qMpeQ2riK6YqDHBR3Iru0uGPEhHLgQE1FvRzd0aYPkGrXAMLC/Z
 2Fc0Rb0MeO8xHYTtqa/cvRw1sSk9prX5NJ3/jTSrG4Po7QClZogbbEG4XenfdibKsC0N
 OaGimmZHUjcVmKSasfE72sZ4PtJy1amKraAf53aoPA5/K5YlWdsmfH5UUOdY1/d8gMl9
 vv6CAth4ixgKqmJbSF2BvyhlFXOyQ1NIfbUFCPB9MM0UPegtj2JHXBfvkK8hzd03RFLf
 22rarW7z1QzPD4PlvorI0wPxNatL271DUBKtxoyBWmOnGGYzeQqfStkZ1f8a2sObTH9J
 OSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fTZJx1PzZG71p6G6mss5BFiqS01KvdBwMP58/c5DbU=;
 b=CIBaLpB8Ztna+YLOhFU3HHXYc0mAWphWl7Mv7BHnNka2Auw09wH6Lrnfs8gWW990Vm
 AK5GmK3fVpT5op4/kL+o6rdx2zVK/bi5fN6qlV2f3/hlTvrBa2nVpnlabfZboVG0BQVW
 ZCv6UWRQVjoCYBFDkmM38zuidV7uOSJlow/sl5PDwGHLwpSxRryLwpx6ly07Rkx5hXkr
 f2hhRlJP6mNuh2QEQW7Z11CaJv1rRzViDDuqFkrcWPurSslLBxaPkSDHXXJOPsuF1LUT
 Rjgzy16nixp2u7ghP++tnxKzxOslxkeTwoxb4Ug4AuWGKVMJTy3VaEJ2/0i05GBSw2Ei
 EVIQ==
X-Gm-Message-State: AIkVDXKwlu6tQqBDKv/DB+WGc3UUGN1hSqlNABaMtXFgNw/llYubHALVyYseB6azA+EQKQ==
X-Received: by 10.84.209.203 with SMTP id y69mr8495365plh.115.1484779714351;
 Wed, 18 Jan 2017 14:48:34 -0800 (PST)
Received: from [138.44.241.182] ([138.44.241.182])
 by smtp.googlemail.com with ESMTPSA id c11sm3068420pfe.68.2017.01.18.14.48.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Jan 2017 14:48:33 -0800 (PST)
Message-ID: <1484779649.4097.1.camel@gmail.com>
Subject: Re: [PATCH v2] drivers/misc: Add ASpeed LPC control driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg KH
 <gregkh@linuxfoundation.org>
Cc: jk@ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Thu, 19 Jan 2017 09:47:29 +1100
In-Reply-To: <1484573670.11927.35.camel@kernel.crashing.org>
References: <20170113074713.6175-1-cyrilbur@gmail.com>
 <20170113103625.GA15142@kroah.com> <1484520215.13393.1.camel@gmail.com>
 <1484541915.11927.31.camel@kernel.crashing.org>
 <20170116104537.GA29148@kroah.com>
 <1484573670.11927.35.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
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
X-List-Received-Date: Wed, 18 Jan 2017 22:48:36 -0000

On Mon, 2017-01-16 at 07:34 -0600, Benjamin Herrenschmidt wrote:
> On Mon, 2017-01-16 at 11:45 +0100, Greg KH wrote:
> > For an ioctl structure like this, can you guarantee that the "padding"
> > will always be the same?  Last time I looked, the C standard didn't say
> > anything about that, so I would strongly recommend making it so that no
> > padding is needed at all...
> 
> The implicit padding is a matter of ABI more than C standard, we
> already rely on this in a bazillion of places but it *has* bitten us in
> a few corner cases (mostly when u64 is involved due to ABI differences
> between 32-bit and 64-bit), so explicit padding is indeed preferred.
> 
> Cyril can you respin with:
> 
> 	struct aspeed_lpc_ctrl_mapping {
> 		__u8    window_type;
> 		__u8    window_id;
> 		__u16   pad;
> 		__u32   addr;
> 		__u32   offset;
> 		__u32   size;
> 
> I prefer that, it makes more sense to keep the window type/id at the
> top. Alternatively call "pad", "flags", and describe that clients must
> zero it, that way we can use it for future extensions of we ever have
> to.

I've gone with calling it 'flags'. I'll resend.

> 
> Also for mmap, you have:
> 
>        /* AHB accesses are not cache coherent */
>        if (file->f_flags & O_DSYNC)
>                prot = pgprot_noncached(prot);
> 
> Why the test for O_DSYNC ? I'd rather not make this a userspace
> responsibility to get right... I'd have made it unconditional.
> 

Sure 

> I notice ARM has pgprot_dmacoherent() that might just do what we want
> here, ie, non-cachable if needed. Otherwise, I'd just unconditionally
> set it to noncached, we can revisit that if Aspeed ever comes up with a
> coherent SoC which I very much doubt but ...
> 

If we're happy with adding the check if Aspeed ever come with with a
coherent SoC then I'm cool with removing it. I'll do in v3.

Thanks Ben,

Cyril


> Cheers,
> Ben.
> 
> 
