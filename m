Return-Path: <xow@google.com>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqZJH631mzDqdX
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 07:09:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qS/m4EPz"; 
 dkim-atps=neutral
Received: by mail-qk0-x22b.google.com with SMTP id p22so586127qka.3
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4AntDfA4FPIJn2aERBA0lYu7K1SHooObAI2FMqxQmHo=;
 b=qS/m4EPzrLbUlQgWcKoFe2BvcFlYJVkA6bAOsikx8nsQ7kwGoGc5ws3z8jgGqXa4vs
 qrXF6XmDTO2+hPqyyRKj92Nd5/vUyL3Zf3KMLfJOFOCC4AX9FAFYV78y++xUrFjiK7Vv
 HSUykSTax3+i0lMMBrO4AywF2GAbLE9xvFdiUlwGHkvMJhNnk0dHV6gLyGZiPSOExsNv
 rBkBaHbSMNuCeJcs8VVlqVmCDz+UXWAgU3wYAbvh6PeuF4kFMyqK9Wo/N8sXAT/xUKeO
 oYqVfO9F4jK0IAkY8RgNaMxwbM2COF5mDUNRXNYjBhgH1CfEU31e1qFAl+Yeu5zLv2R1
 tdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4AntDfA4FPIJn2aERBA0lYu7K1SHooObAI2FMqxQmHo=;
 b=JOPwAjaPscqgeeNelbgZ1/irQSYj864O/bDM9hJxCIOYz6LlYDiqo5fCBrGUnvvkfF
 UOlMylKtyF+BPCLmmM28iX4ROEZKx86Z3YTpq4zsAdNs9fayEvmBMPfZZYZaIv8zBifV
 ZdqTANYNPYUPJOWJph418Yt+lNzm8pYXp37QUAJGKjCjQOcmZr9P5HWmk48rRllyn/CQ
 d729lriHCMSRLUe5AeGwlApxXyI0wbeAmwnpdqtaMo7t46Igic4yGen5MUYCuzBCIKzB
 SOauiawLq8/F7dec9QpmRNfyY/HBCg+D/FdUVcex75q1dKQTcMsst1y3051rSaM7BBsA
 Uolg==
X-Gm-Message-State: AFeK/H0smtc9wLUC1pWUINFW+VlvuusduTQAqcfuVdlc1onDGFgFDXdWmq8T4IB+z70pozoNvTTkVI1a9MT6EWZ7
X-Received: by 10.55.212.193 with SMTP id s62mr2901755qks.254.1490386156418;
 Fri, 24 Mar 2017 13:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Fri, 24 Mar 2017 13:09:15 -0700 (PDT)
In-Reply-To: <20170323011926.176272-1-peterh@google.com>
References: <20170323011926.176272-1-peterh@google.com>
From: Xo Wang <xow@google.com>
Date: Fri, 24 Mar 2017 13:09:15 -0700
Message-ID: <CAPH-5w6apyUNVAVPqCXmPF_sBGSd_+=Y=kSHusXm8KJhx_7cCg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: zaius: Enable 12V Delta Power Brick.
To: Peter Hanson <peterh@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 24 Mar 2017 20:09:20 -0000

On Wed, Mar 22, 2017 at 6:19 PM, Peter Hanson <peterh@google.com> wrote:
> Signed-off-by: Peter Hanson <peterh@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 3bd70ed810af..dfd0dd7c16e4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -269,7 +269,13 @@
>         /* Master selector PCA9541A @70h (other master: CPU0)
>          *   LM5066I PMBUS @10h
>          */
> -       /* 12V SMPS Q54SH12050NNDH @61h */
> +
> +       /* 12V Quarter Brick DC/DC Converter Q54SJ12050 @61h */
> +       power-brick@61 {
> +               compatible = "delta,dps800";
> +               reg = <0x61>;
> +       };
> +
>         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
>         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
>         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> --
> 2.12.1.500.gab5fba24ee-goog
>

Reviewed-by: Xo Wang <xow@google.com>
