Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyr8Q67MJzDqLd
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 11:57:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mXaabGo+"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id i68so54044099uad.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 16:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OXfRBnAXfljgqmeJmuYer8XulJJBHOaOGCE7v5diXiQ=;
 b=mXaabGo+YOlOKeY+e8ZO2nPTq01+J9W547Po4MZqgkpHzut1RId/Wz8BjphncRNuuV
 EAw6skjO8wrVn255evtvLH5+kXioOOHsWsquyCq0pi7mruE1EZblglhEM4FAkNxE4UXU
 eSyzPW+Wcw3mNhnhqjBTvIm75JXSsVxzaarpXqnqLwc4wam14Yzo8lrcPwRJX0V8BT+z
 OfP1pond8UN3IYXetLjIBpBRYWscisMoKbZiyFMHEE3GQPb9jO8kjzmbW2DElBLFltf6
 +Pg2mu26p4Vrow3sgvWqtyqAByhHgLV5oS9PA5j/AawqkLfbQa8zZ0DEterIGrTdFuaz
 KRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OXfRBnAXfljgqmeJmuYer8XulJJBHOaOGCE7v5diXiQ=;
 b=THE0hycj5bFsh964LWx866yGdIPllGOKzwQIg75oHlzYzYsUBEUAqMgwOAlxp38AV3
 9F23DxgswUQ8K14jAPDSE6aDaGOa8mkqVeOUm0HpwuLbzmxjbRmkF6ezagykcXUhh75c
 dbgxE81UQVeHxgXW9iZp6gzDj0EH7foSFw120jnet81BFwE8EDzyOqwHNz5M6gPBl4+i
 aKVGUJllDSy6lDx3sLm6usM2rNNVVh93dD3J1F1oKJ5HsJIJ+GJdRqAd0C3nF2votDmV
 Nwgi6iAy8puQJrRGg/LLG2iNNmA+4f7beHmT4ft/ULrWYBVaD1VhMXpLTfCThJ70pIjs
 7H4Q==
X-Gm-Message-State: AIkVDXI8bK5j8e9U7iB7hqk0O5bhO79r0/awvdt1K0tcAG2NgGHCFYq9AFpdjcW8MRZ2VFEG+gZAENFlUbnUOg==
X-Received: by 10.159.34.111 with SMTP id 102mr3328659uad.160.1484096244311;
 Tue, 10 Jan 2017 16:57:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.73 with HTTP; Tue, 10 Jan 2017 16:57:03 -0800 (PST)
In-Reply-To: <20170110090640.12608-4-cyrilbur@gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
 <20170110090640.12608-4-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jan 2017 11:57:03 +1100
X-Google-Sender-Auth: P006WD_2JCRi4b6FULrMiIyorF4
Message-ID: <CACPK8Xe8qKDZax_9ac8NVH=+FubY+GPt=3HjEzCbp7aQQWMrDQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] ARM: dts: aspeed: Add mailbox and LPC Control nodes
To: Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 00:57:27 -0000

On Tue, Jan 10, 2017 at 8:06 PM, Cyril Bur <cyrilbur@gmail.com> wrote:

> index 7c78eb1c01ff..c84e833c9480 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi

> +                       lpc_host: lpc-host@80 {
> +                               compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
> +                               reg = <0x80 0x1e0>;
> +                               reg-io-width = <4>;
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0x0 0x80 0x1e0>;
> +
> +                               lpc-ctrl@0 {
> +                                       compatible = "aspeed,ast2400-lpc-ctrl";
> +                                       memory-region = <&flash_memory>;

You can't have a phandle to the dts in the dtsi.

Cheers,

Joel

> +                                       flash = <&host_pnor>;
> +                                       reg = <0x0 0x80>;
> +                               };
> +
