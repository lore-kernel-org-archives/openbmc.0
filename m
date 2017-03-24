Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq97v3Mm0zDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 15:15:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CwAzh6uu"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id i203so354550ywc.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 21:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xMycUHDuaau/vmphYvYMZh40/5L+HeS0wnPm2i0jLuI=;
 b=CwAzh6uulJBpVhrBoJFePUwIYJx4S7dB6Ldd6N0ZmnNJuQ03nEdprrHTn/+ygTs12/
 iZkGm/Xc9KyaksmKNyFw8bhb2Zx1h2of3ogCvnMfrX+gP0KeB8qZrxtW5KddjGknbsFK
 Em7EhZ7pL20w83Ceuz9XCaJsBZZGh9UZywtJe90jR3yPR22TTbOTFdHVXDbVcx+iPdEd
 /122PD7eUqqT1Wy9yv7Dv69Aw5RfMU8PsLnG3F3GnD2VkZ4kDC5pHk4T+5zMY/iz++r7
 bP9Zxa/J9H0cVKABjU2teQwKif/DHcXK/0Knz6L517KsHbeRB0i1eRnW/XgNcTJ+1xSW
 svSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xMycUHDuaau/vmphYvYMZh40/5L+HeS0wnPm2i0jLuI=;
 b=HS3qTccUpurVwQVhPKecLtQAo54SfTkd2Rm7rkOaDytQC91QqGZrXcHmfNG/VehKB7
 0C05DFRr/d+hJHwYgHhnM8nAqV09kYMZUfBvJoRokPiJczrzJ5kVg2aDyDQEePT1KMKG
 aoT4LqrnlgXtHlq+G1Yzq+j1rKGq0iUzTN9kSsDn54p3iFBb40+Hqrny56R5MpTGilSq
 Z/7xpmuIU62gUVEAEcPvC1EeNRF6HKY1gf4PAr/Hm0GALFmWcYenxamvOIh9Pl+ok6DM
 pPQpFSRgVk99NL3N9owX2T3VrWQbY4K9mr2Knp87C2I4DAWUP2Ag3tyXxL4h3hFwtsi2
 gjxA==
X-Gm-Message-State: AFeK/H2zZgw5HVLe9LUHGsCQyJIaVff/nNZZ213CleutI4n7w7ULYyEkK9FZADPRuNOvkxCFPY9GCXJaDL3/AA==
X-Received: by 10.13.194.70 with SMTP id e67mr4425826ywd.10.1490328936439;
 Thu, 23 Mar 2017 21:15:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 21:15:16 -0700 (PDT)
In-Reply-To: <1490251369-6481-1-git-send-email-mine260309@gmail.com>
References: <1490251369-6481-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 14:45:16 +1030
X-Google-Sender-Auth: oJg0ANNeaVGVRfJ17ex1iIaYoYA
Message-ID: <CACPK8Xdr=8JwQ8GCi1e8sidEz7oBfO_HytDfWB6LOwMCqRsKPg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] ARM: dts: aspeed: romulus: Add UART1
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Fri, 24 Mar 2017 04:15:40 -0000

On Thu, Mar 23, 2017 at 5:12 PM, Lei YU <mine260309@gmail.com> wrote:
> Romulus has a RS-232 connection on the back of chassis, add UART1 to use
> this connection.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 2266c85..65be964 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -73,6 +73,21 @@
>         status = "okay";
>  };
>
> +&uart1 {
> +       /* Rear RS-232 connector */
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                       &pinctrl_rxd1_default
> +                       &pinctrl_nrts1_default
> +                       &pinctrl_ndtr1_default
> +                       &pinctrl_ndsr1_default
> +                       &pinctrl_ncts1_default
> +                       &pinctrl_ndcd1_default
> +                       &pinctrl_nri1_default>;
> +};
> +
>  &uart5 {
>         status = "okay";
>  };
> --
> 1.9.1
>
