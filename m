Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHJmT3m5pzDvPn
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 16:22:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kv26D3tl"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id c20so9024580itb.0
 for <openbmc@lists.ozlabs.org>; Sun, 13 Nov 2016 21:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=H7Z01JyS2Q9QsKZyLSo8d+s2DHjla0VpPUGGItv5VWM=;
 b=Kv26D3tl36Hp44WoEIc1z60FeSxLzv1axdaza322s2F54NTxqt8unv7AEOVhYxZGZP
 cJRtMkZVgqVQrSgPbkqRwF3EcnV5JVtld4VofCDv0PeH5zrnYQbIslPTOS5n3EauTNqf
 VvyXSac36aIePluGZV2LsRtGT1K5DUi3nyJQxDEV8XsSKi36FCNr7RrTZOknZ0WDpp65
 +cUp/xWnaXs/cWghAinhCdcrcTh5Ct8gRlHYDnW/8UyrOZe2YsG4R71JawLRBeoKlRFz
 rF6/fI6onqOto26uYD/WKlOHo91tt/5LC4xCWs2C6vuHL/mFBQzq9z2MF0uvwyiJYVNC
 qHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=H7Z01JyS2Q9QsKZyLSo8d+s2DHjla0VpPUGGItv5VWM=;
 b=TMJvoaVRZfsn45002Lhv4S+B9n+PmS3kUKKdkiUG3nAvKRCFyQmDYOGrdRPuLuRfwK
 i+aSj/PcJMD0DlHnLDd/cDy8WD7uqsJLjrkUBqzh8ZWB/FocWnwbZTZ+DHIVcRUJOfG6
 awTctsjKAaV8RHWGYk8qUMYt4/EogXFX0N90Uw35dsVOcaKcEFbz2wiz7fSIepkI33fg
 t7K2kZ+qAOmBHHZ9lm0mZfMVIaPRwef/xnCxROJxffHzA0P4c5tfWFubcjtqGJGPuf3a
 HPJKe0x6LLK7DBaW0NUYItAfxEcmA5y7uH3hkjfnuCyLfCRn+B/Rgwm2i1+tPfLIhO+H
 L+ww==
X-Gm-Message-State: ABUngvfx/txKcgs7/CCE++PCU0x4ndebrz6nGw6C+L+uZ/N5vJhZKWi5xqo9ZW4RSydgS3hBrvhDiqxzJa58Yw==
X-Received: by 10.157.63.199 with SMTP id i7mr6271129ote.63.1479100919254;
 Sun, 13 Nov 2016 21:21:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 13 Nov 2016 21:21:38 -0800 (PST)
In-Reply-To: <85fa06da-c4d9-e64d-c5af-141f7aa5e074@kaod.org>
References: <20161111040238.5972-1-joel@jms.id.au>
 <85fa06da-c4d9-e64d-c5af-141f7aa5e074@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Nov 2016 15:51:38 +1030
X-Google-Sender-Auth: RAqaT2xP3TtCJ-B65wXq221nuw0
Message-ID: <CACPK8XeUh65FM9OC45FZnwVSwLN1ZF7Z5zfasNurHzdBfVKGvA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: Add pnor label for wspoon and romulus
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 14 Nov 2016 05:22:02 -0000

On Fri, Nov 11, 2016 at 6:32 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> So, according to :
>
>         Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>         Documentation/devicetree/bindings/mtd/partitions.txt
>
> we can not label the flash module node but we can label the
> partition instead. Would a patch like below fit the need ?
> Here is what we get on a palmetto and an EVB, the approach
> are different.

Okay. That's annoying.

Is there a reason we can't coax the ast2400 version to call it just
'pnor' as well?

>
>         root@palmetto:~# cat /proc/mtd
>         dev:    size   erasesize  name
>         mtd0: 00060000 00001000 "u-boot"
>         mtd1: 00020000 00001000 "u-boot-env"
>         mtd2: 00280000 00001000 "kernel"
>         mtd3: 001c0000 00001000 "initramfs"
>         mtd4: 01740000 00001000 "rofs"
>         mtd5: 00400000 00001000 "rwfs"
>         mtd6: 02000000 00010000 "1e630000.spi:pnor@0"
>
>         root@evb-ast2500:~# cat /proc/mtd
>         dev:    size   erasesize  name
>         mtd0: 00060000 00001000 "u-boot"
>         mtd1: 00020000 00001000 "u-boot-env"
>         mtd2: 00280000 00001000 "kernel"
>         mtd3: 001c0000 00001000 "initramfs"
>         mtd4: 01740000 00001000 "rofs"
>         mtd5: 00400000 00001000 "rwfs"
>         mtd6: 02000000 00010000 "pnor"
>
> The partition definitions probably belongs to the machine dts.
>
> And a udev rules would also fit the purpose I think.

What would you suggest? A symlink to create a /dev/pnor node?

Cheers,

Joel
