Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x234.google.com (mail-ob0-x234.google.com
 [IPv6:2607:f8b0:4003:c01::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2481A0036
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2015 17:17:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=p9JUbKNc; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=HNWp3kOw; 
 dkim-atps=neutral
Received: by obbbh8 with SMTP id bh8so146521858obb.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2015 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=daV7tDZulc+tnJwl49KalhdL1xbLoD6YoYdP7GxGGqM=;
 b=p9JUbKNc+NAs6zswPhCCsMOoEhmNmerDQfLDmTB80T/SMMlLM0+NguKDvrZ9+wLj6f
 Uz78bcYgV2i6EtDz/monGnhtsNSr1RxOsZkDfGuipT/5Nbz8MCmmOtLX8IiuZIEXrA58
 e14r1ZEfcjn6RS0lYbLmGm++Qh/NJ6cKrnpOd9JJzfr/Ss9hSPtb8Linh03veKbAdeS5
 GFXbS1aoutjEazqo1uOkRh6gCWNBBw2bGZNx2x5X1apnYVpOE6ZBVjVfHSzhttimTSdY
 Cx9WjwX+LOzI4FuK2YUUI0FBzLGhQ2qhOJfaqqS+7z3gGwMuiB4C2cmrB0TYWXBWPrKY
 bpSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=daV7tDZulc+tnJwl49KalhdL1xbLoD6YoYdP7GxGGqM=;
 b=HNWp3kOwc79mksxWqot9Lnxu1rd58heEuPDKOJ3bSqU81ebkn5EEu4MWN8lJGtB3Kz
 KxdTHURji56j2dmx/aPk1DtRMwzlTMt158wdCQVvZtFLMd55BMvj25iyfqNPBOpUwFvW
 SAfvjSsvYumqXfF3oB9pGtO6lIp2l/YkRhjI8=
X-Received: by 10.60.102.33 with SMTP id fl1mr19060335oeb.11.1444112250077;
 Mon, 05 Oct 2015 23:17:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Mon, 5 Oct 2015 23:17:10 -0700 (PDT)
In-Reply-To: <B4E73D93-EAC0-4F2F-A1F1-74D969EDBDE8@bwbmail.net>
References: <B4E73D93-EAC0-4F2F-A1F1-74D969EDBDE8@bwbmail.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Oct 2015 16:47:10 +1030
X-Google-Sender-Auth: rticVuHBcY4gdHwjwI6HEDd6Kx0
Message-ID: <CACPK8XdBN0RUHbCrk6OZXuV5q=t7FsTtn68=DeTq8HpRNEvbTg@mail.gmail.com>
Subject: Re: Palmetto netboot instructions
To: Brad Bishop <brad@bwbmail.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 06 Oct 2015 06:17:33 -0000

Hey Brad,

On Tue, Oct 6, 2015 at 4:35 PM, Brad Bishop <brad@bwbmail.net> wrote:
> Please let me know if you run into any problems with this procedure or have
> any feedback.  Thanks.

Thanks for the instructions!

> On build system:
>
> 1 - pull updates from here: https://github.com/bradbishop/openbmc-1
> 2 - bitbake obmc-phosphor-image

I thought 'phosphor' was the qemu target we were using for OpenBMC
development, and that we would have a 'palmetto' target for running on
the hardware. Can you clarify for me?

> 3 - tmp/sysroots/x86_64-linux/usr/bin/mkimage -A arm -O linux -C none -T
> ramdisk -a 0x50200000 -d
> tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz initrd
> 4 - scp tmp/deploy/images/palmetto/cuImage <tftp>:/tftpboot
> 5 - scp tmp/deploy/images/palmetto/initrd <tftp>:/tftpboot

Can we get bitbake to build the rootfs into the kernel?

Cheers,

Joel
