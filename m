Return-Path: <sjg@google.com>
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXF9k52DFzDvhD
 for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2016 17:25:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L4tEtjHl"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ebHTojiz";
 dkim-atps=neutral
Received: by mail-oi0-x230.google.com with SMTP id v84so328369503oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Dec 2016 22:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=54BAlqtvZPpoiSl9W+nSSKrEfE35PTnO8/d1HNzP56k=;
 b=L4tEtjHl+04tsK28shlB3gIdkm8nwC4SWjoTvoLeMW2wf+Z0MukDQj3anU15k3IvQc
 EEuWyp6fFYbZ97PoG75+KHlU7ssTmvehkXL7yVuj99lkJFITJZlnxUbShtaeJXhA+jLX
 wevuyuAPBc3zKwWqpII3sl/JC6Vm1TnW8J5tnOverE3GnkJRGeoTn0/Csof9/0pufdHU
 1rgO/x/TFe0bDQLcM1RigPoutxNhkwC+w3auyjriIfiDSytpHEifo6mCJaW1Q0wu2un4
 32WDUdCULFXOHveTMbVWWNgVLErAP8X0JpEE8+N+zSIaS0qf+U65uCvoezJpco6PIJr+
 MHcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=54BAlqtvZPpoiSl9W+nSSKrEfE35PTnO8/d1HNzP56k=;
 b=ebHTojizZXATSVhBHGIWNunzpUYN04+Py4jC1v1QlPowYwhytvjVE29b8GooMroWLR
 nN1PjcZoT4PLZkegU5uLRIMabKkenDf0o99JqP17+aPz/K66fGbCeiTNTJYR5yPq/S3x
 ZuwTYHeRJRRLykhO/wg4KFTNxU/KeD/xlLQqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=54BAlqtvZPpoiSl9W+nSSKrEfE35PTnO8/d1HNzP56k=;
 b=F0fkfw47oYeYBZ3/B4WjhcKmSED7v8wlVvytSFK9O0lcEMPPnchAhOROwq0rcdfAKg
 rXUQGXkNQbuaFC6v2mgxgnRaoaPr/pvN29v5PmavO+G0/d5l9ZJ7sV5JUG+ednkO4ng4
 TLl2zHA9b3NcgyG/MAziTUc5aH5SznbmdL8LX4vXL7GDXJ4xWHXTnYA1jRDJ1oMSu4mi
 8+m7vYdlXrPQSXH5IdpKUleKfAnfWjgVXRRzncQmQC8d7cwT+Zs/KOWAxGlC9iQm9Pvd
 rY3XNLmm+Jq046muhpErgp2Xmorn2N1WllgMuOtNDjNCDGiskbcUf8F4PoTR6RBqheSz
 1Otw==
X-Gm-Message-State: AKaTC02zFUEEf4Tk0D6/eQRh+ychBC55dMCDg/k8ibTd2QYzjeeQ9sSdnZSPXSQv8pVGxy89vc2hD0sDHpyM+xf/
X-Received: by 10.202.177.65 with SMTP id a62mr27089633oif.52.1480919112475;
 Sun, 04 Dec 2016 22:25:12 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.128.229 with HTTP; Sun, 4 Dec 2016 22:24:52 -0800 (PST)
In-Reply-To: <1480717624-24994-4-git-send-email-raltherr@google.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
 <1480717624-24994-4-git-send-email-raltherr@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Dec 2016 23:24:52 -0700
X-Google-Sender-Auth: -fjG2vow0pKy3dNBMnGPSu8e76g
Message-ID: <CAPnjgZ32_hmsFfX8FF_zYQPyb0C061T2COMVNt0E8kD2O+RePA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 3/3] Enable FIT image support and FDT loading
 for AST2400/AST2500
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 05 Dec 2016 06:25:16 -0000

On 2 December 2016 at 15:27, Rick Altherr <raltherr@google.com> wrote:
> FIT is the modern u-boot native image format for kernels, device trees,
> and ramdisks.  Enabling FIT only compiles in support for the image
> format.  For these devices, the kernel+dtb and ramdisk are loaded from
> separate locations in flash and can be any mix of legacy or FIT images.
> When using FIT images, the dtb is stored as a separate entry that
> requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.
>
> u-boot enables EFI support by default but it only builds once FIT

nit: U-Boot

> support is enabled.  EFI support adds ~13k to the binary and is
> currently unused for any Aspeed platforms.  Explicitly disable EFI
> support now that FIT support is enabled.
>
> Tested under qemu with both legacy and FIT kernel+dtb images for
> palmetto and witherspoon.
>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  configs/ast_g4_ncsi_defconfig | 5 +++++
>  configs/ast_g4_phy_defconfig  | 5 +++++
>  configs/ast_g5_ncsi_defconfig | 5 +++++
>  configs/ast_g5_phy_defconfig  | 5 +++++
>  4 files changed, 20 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
