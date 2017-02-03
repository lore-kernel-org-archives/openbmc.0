Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDyx70kSXzDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 11:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j+p/QuHZ"; 
 dkim-atps=neutral
Received: by mail-ot0-x244.google.com with SMTP id 36so542189otx.3
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 16:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TnFxTKH8/XkZT5Sx0Xfk+LF4LAuwtNA5giqUPjTOXc0=;
 b=j+p/QuHZd7MwCi0r0p4JuPx6q/H++LXi41FnhIa5BJruujBXrydL51YfvzsYvtdYE5
 rjWsSL+bwlXTOZX4gLSKL+s/YKJzgxmj8ReiQot1hvGMXGhvDxpR5Xhct6Z+Ziumzric
 m5XUbD3zandiefi9he2FlpWltCd4NxIeDjWRJc2Dv02DlCX8c9YTBSG6XlosMdHrc9o6
 ulJ2JO+BXhh3EDPXVnFAITTPjnMDso2jJT/nwW8SERV1XR4GRq3UhUKq3xlTU00No9if
 m5v2Jy2vA9IyS3nW2oKl355rqPkpddqF95kEEL3SJUfoFA5cWdho/Ybv8/MNXPfh0lB2
 v7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=TnFxTKH8/XkZT5Sx0Xfk+LF4LAuwtNA5giqUPjTOXc0=;
 b=l4xZncCdf+59pIDukAn5n3QaG4cSEIuYUcy54dkWriMnNFieM8XF5T5/SVRqBiPip+
 pfLhUmWDiamCy1q0zGbhJ8Mb5e+WdTzEksJ1CrMUdLkpRnuehpBn7gAiKTk7K7PypAQn
 OqnXiSQpaKv/tLpsGi/ZYSpj38m2dFUzIAc/iYo5nkfBqEmAHZbaFhUVpYvS91ESNQy2
 i5F0mrlNzlPlI9QTVjHGX0OS3hEwH6mIdEOI+3Z3MHCr69H4si7yHlEuJZszQaTz7www
 ZOI9CyOKeuPi2tRbCFGkFNl/hKKHdU7nOWdkRSi6LVQDzxDi/X0m9ABJSlbz0oF2QQiJ
 TyTw==
X-Gm-Message-State: AIkVDXIC1wHlXkrWgGaNmfPagJT7ItQlR88b5AG0Equ+kFgGbZZpkdyfQnuqZKBy5g4TU2JTjCgyHr+QKa+bCA==
X-Received: by 10.157.8.75 with SMTP id 69mr5920890oty.275.1486083096786; Thu,
 02 Feb 2017 16:51:36 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 16:51:16 -0800 (PST)
In-Reply-To: <20170131183927.30887-1-raltherr@google.com>
References: <20170131183927.30887-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 11:21:16 +1030
X-Google-Sender-Auth: fOBB5tohwYAUVUjvm9VeXfMJUmQ
Message-ID: <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
To: Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 03 Feb 2017 00:51:39 -0000

On Wed, Feb 1, 2017 at 5:09 AM, Rick Altherr via openbmc
<openbmc@lists.ozlabs.org> wrote:
> openbmc/openbmc commit 1ed6fe335cda50cf60b7afddbe530077a1b25d27 includes
> the initrd in the kernel image.  Update the flash layout used by OpenBMC
> dts accordingly.  This is required for OpenBMC's kernel update mechanism
> to work as the kernel image now exceeds the size of the original kernel
> partition.

Brad, Patrick: This change will mean new kernels can't boot on old
flash layouts, and vice versa.

All users will need to do a full-flash update to move to this version,
and a full flash update to downgrade.

Are we ok to proceed?

Cheers,

Joel

>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> index 65095a40a203..4bcfd1bf8dc5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> @@ -12,13 +12,9 @@
>                                         label = "u-boot-env";
>                                 };
>                                 kernel@80000 {
> -                                       reg = < 0x80000 0x280000 >;
> +                                       reg = < 0x80000 0x440000 >;
>                                         label = "kernel";
>                                 };
> -                               initramfs@300000 {
> -                                       reg = < 0x300000 0x1c0000 >;
> -                                       label = "initramfs";
> -                               };
>                                 rofs@0c0000 {
>                                         reg = < 0x4c0000 0x1740000 >;
>                                         label = "rofs";
> --
> 2.11.0.483.g087da7b7c-goog
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
