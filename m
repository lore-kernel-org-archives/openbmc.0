Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKx7743byzDqBW
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 13:47:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K++0MgaZ"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id d5so4394662uag.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 18:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5m9OSYkc1yb44azEwyFcKW67imYp8Qdkl8MbVYx/WsM=;
 b=K++0MgaZNI/Q2f4yPC0kuI97xZqeQCQyNozk05ZWP26qFanQh3hh7h3ekw/+8rUgfG
 eK8idtN+4ll6NoYWtkmHlQnMTzJZvt5EoXwJd/ZnKT7HHJPoVB71wDWl4UfcqDXObX8C
 A7DK1yt6GejGrpLXVGW3CDxieWYLQWzn3WvikcxjzwRxNNdnUBjpskNwk2XQb0o+32Zi
 K3bWUnO3aPxvf3plb9Y3DSYtNk61OzWFPS9ddAVCsShfplOjndLHhEVQbMZWiTxWLLEc
 QPfCWQ+MCUxyv6woYno2xjPfs7TBAAaCSrikFsfefY3KTwwYvgzVBBVstLaAfaFfEUZw
 gBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5m9OSYkc1yb44azEwyFcKW67imYp8Qdkl8MbVYx/WsM=;
 b=I3w1vdXeFg+qcCplNVaND87S+7/NtlY3tSvk9/qz5eyC/OYgtWWPWpebgtl92oYbVW
 QFaH/QM7gi+YI96FLp1S3J1Nb/GNZTEuQZGMltUi+xR3XI14gaIlh63+UX/6RtKjVq5f
 2BF73SzcBIyzzeVQlCCDTETx7f4Oy2G1gLGl5EMR1rafibjFhqwH6N2R01nt0uKHM50d
 pawvMp+WI0ZeCxvD9ERpoG201wWhZ56QIyhFVK1jyKExCyypguXF+qTyKdSqVZ28VH35
 kQfKgoibhrIRG/Jd3T88sgfxxyTKwyzt3xjj5i3vXmnm2K6z4SM7UJMkNOSP0EXIvKjq
 ETJQ==
X-Gm-Message-State: AMke39mTGfoZz7xFTh7WLLXDLbFoy65B+q8RKZQXFzigV5HzZRiSugH0PcJnZutj4gbsAg8BP/amK0C7f9im8g==
X-Received: by 10.159.49.25 with SMTP id m25mr6537845uab.87.1486781248928;
 Fri, 10 Feb 2017 18:47:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Fri, 10 Feb 2017 18:47:08 -0800 (PST)
In-Reply-To: <1486760074-17019-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486760074-17019-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 11 Feb 2017 13:17:08 +1030
X-Google-Sender-Auth: WnCRFmNKwZm94B0QZQnazMJUV2g
Message-ID: <CACPK8XeTC4fyXiAs1yDtO5XoRUP3ZyQXyudqXOMu=aHuU0G_LQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v3] dts: aspeed: witherspoon: Enable FSI
 master
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>, 
 Alistair Popple <alistair@popple.id.au>
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
X-List-Received-Date: Sat, 11 Feb 2017 02:47:32 -0000

On Sat, Feb 11, 2017 at 7:24 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> set status to "okay"

Did you successfully boot a p9 with this?

I found that it did work, but we have two separate bits of software
poking at FSI - pdbg via /dev/mem, and the kernel driver. So it's a
bit of luck that it still works.

In order to not have this, pdbg needs to use the kernel driver. I
started doing this work but hit the issues that you and Chris have
been debugging for us.

On Monday I will re-test pdbg with your fixes, and if that works, we
can push the pdbg OpenFSI backend and at that point change the device
tree to bind to the driver. We will need to make sure we can use the
kernel driver to perform the DD1 workarounds on both p9 sockets.

Cheers,

Joel

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4b2d8aa..e532737 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -50,7 +50,7 @@
>         fsi-master {
>                 compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> -               status = "disabled";
> +               status = "okay";
>
>                 clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> --
> 1.8.3.1
>
