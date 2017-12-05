Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DK/JJ2g3"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrMyg1b7CzDrp4
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 11:27:38 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id l81so21243958lfl.6
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 16:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=w/oRuS9hh3DRwCoMPkzTaAOp+omiph28a8++HJ1GUaM=;
 b=DK/JJ2g3jiB07reNnRnVqveglAbDAdNf07T3jOyRyoEPKcpbTdpxj+HE200g0qNCfe
 pbMCQrRSBr9SK47hr0sOF7dsB9z6NLdmtYlzOi20jKeo8i84t8ezB0eoyEZFE5wbMeCb
 KIbyV5f8Q00EAexzR8TljYobVjJ0guAWu0OrtnH5OAyyvM3EzxNmUbggOBr/dxlVP9qW
 MSKOpxNTk9Awt5eemmHZYJ9d/eNLrPGngBXOJ7zZibyY1gdBemcmh0TUgt+4MPgGAVq/
 5CErkHje1ZlI9X5leJkQAggvJtNeEqB+ClIe7TuPUIbTJvNb3fKG0qJgztAni7iu6+Ku
 xScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=w/oRuS9hh3DRwCoMPkzTaAOp+omiph28a8++HJ1GUaM=;
 b=qpooRpnWSTSRQ4o78C0oc6fi0TK56D/X5PqoEJchMeiH4Dw9PCYKk6uUajbSU/G9n/
 03R9sqNImixcEtR7Zgrjg/alJqO1q9jDsCVsbkhievHQg96/FhVMm9QnN5V5+qclmN7M
 6sl7PYmKXTifLNXkYyCVdkw4cZskaPOtcJ56YwXcuFDsTUv6xV7FLUg6da1ypaQf4om4
 xauAxcCyBDovtiaGCy0eT5g00wqkt/rKKUTKKOoL9veYwjiGOIdtJHxKdrLKmPMeCI4E
 ealdkv4pXeuqvYX0wGIs3TVIJI0CcHl82Q8SAxBMpzajIiQhl0YKlXk4tgFUDu+xFyOi
 6aiA==
X-Gm-Message-State: AJaThX504v7XMa1GR/OYsKBe4M5F1tpQDO/aXi19C2APy12JdmCQMmUn
 DSd053uMmhLSffQBRPE9sWDAZdur7lRo2buG1xQ=
X-Google-Smtp-Source: AGs4zMbcDnPiqj0Wolg7Dh6fpuVTmSqN6N9XwZ2PWZPxooDWCrjSllwXqoIRBEU7rDV6h4d9h7gS5OyReXwGEqp9WNw=
X-Received: by 10.25.168.140 with SMTP id r134mr8054832lfe.65.1512433654329;
 Mon, 04 Dec 2017 16:27:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 4 Dec 2017 16:27:13 -0800 (PST)
In-Reply-To: <20171204165537.107035-1-venture@google.com>
References: <20171204165537.107035-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Dec 2017 10:57:13 +1030
X-Google-Sender-Auth: JLx7j-lFAk7ANJNfBSRd7qyHqL4
Message-ID: <CACPK8Xf8-BisgcS15yB0+FT_met-pO7Y15zs8bQLMwbZ3nuezQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: quanta: i2c-2 idle disconnects
To: Patrick Venture <venture@google.com>
Cc: Peter Hanson <peterh@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 00:27:40 -0000

On Tue, Dec 5, 2017 at 3:25 AM, Patrick Venture <venture@google.com> wrote:
> From: Peter Hanson <peterh@google.com>
>
> Two top-level pca954x muxes branch off Quanta q71l i2c-2 bus; they
> have different addresses, so there is no confusion in that sense.
> However, by default, the pca954x driver skips disconnecting the
> selected channel. This supports expected topologies, but will leave
> two channels selected at the same time when connected in parallel.
>
> This commit adds the i2c-mux-idle-disconnect property to both muxes
> to inform the driver that disconnecting is not optional on bus 2.
>
> Signed-off-by: Peter Hanson <peterh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dev-4.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 7ed3a773b2d5..05cfbf086c84 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -227,6 +227,7 @@
>                 reg = <0x74>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> +               i2c-mux-idle-disconnect;  /* may use mux@77 next. */
>         };
>
>         /* 0: PCIe Slot 1,
> @@ -243,6 +244,7 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x77>;
> +               i2c-mux-idle-disconnect;  /* may use mux@74 next. */
>         };
>  };
>
> --
> 2.15.0.417.g466bffb3ac-goog
>
