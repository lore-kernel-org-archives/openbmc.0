Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq7QY2RmQzDqBv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:58:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fcmavUs8"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id p77so246517ywg.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 19:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iTB+iZjKBlPrznzGI9awFInxyM8zL3NTSGlbDIUCFZI=;
 b=fcmavUs8uXB0RfJABdml4Rb4e2KAwGDVKlcamH+daM8LoAgCx0Sp8AU4KxZSYvFLBF
 dIpl6L+DFrnUx8DaU/PhBBX6DpH+ctTwNJUuyvt2+TcCg4XybSg0j8/XuY3J7/CgfbZ+
 MMIk4YOfW2/LyXKiwB8ehImIv/TS2Ti0QWDpvgPTUWrcd81H/1yHkFCakFhEM17hTSWR
 mlf2wOQndnDnU1URiMYMZqUxYfeuoEuEpUnY+lAOSa9TtNKveEXQwm40GNWSKYrniVyf
 T3RGiRlFgWBmTtIgfiaS76cKdXs+WiblCTLGLZyGkCW5wORwduw+54r2jaHaQExdVT4M
 aTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iTB+iZjKBlPrznzGI9awFInxyM8zL3NTSGlbDIUCFZI=;
 b=VZbeG2ElbsPUd6xyiCkwiamchL8RClBp6M8PMhKhi1bIcm5kvNXIwaj/FPC5V4KhI0
 /yynO+heIZuam+toT1+juGlLh4hdQu3ZHvClS/UlZf/HT7MmtUZ/mUc83fUCxCOLNb46
 Z90RaosoCAwMbxU4ZmqoX34qu8Sb+ssGCdpscvMUQBa4V1mrGmkDxHHiO4Dgt88hgT4o
 lDXZN5YMqWkT9NMYB633KMUxv2v/V2EbIBbcJAaU+P9n51qx13s8RUWUN1+PVrhbIde9
 pJngOYuiVFLtIcxFeQgoDpkf4n7AkgfspTqqbpYfnAhptZUn3BqHClkqWarXhaxDi6Np
 6/PQ==
X-Gm-Message-State: AFeK/H1/Nx+uwMkg7Lc5SG2h8s+W4yiQgccjzoWfPhJ5JvbSRxOLJo9qHHMvpHTaGwzsb8bNbh72iIQKaaqbbA==
X-Received: by 10.37.165.67 with SMTP id h61mr4138739ybi.153.1490324289501;
 Thu, 23 Mar 2017 19:58:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 19:57:49 -0700 (PDT)
In-Reply-To: <20170324011322.31837-1-andrew@aj.id.au>
References: <20170324011322.31837-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 13:27:49 +1030
X-Google-Sender-Auth: BDhXjTUXt7fiAvFvUmyvRBGN1Z4
Message-ID: <CACPK8XdsV27QNNp+Sf=j8RvBAyYecspu3-wjmpTmouBum6SLWQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: Disable UCD90160 in the Witherspoon
 devicetree
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 24 Mar 2017 02:58:14 -0000

On Fri, Mar 24, 2017 at 11:43 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This is a work-around for [1]. Binding the UCD9000 driver to the device (and
> possibly the sequence of unbinding, poking the UCD90160 via i2cset, then
> re-binding the UCD9000 driver) appears to have some negative effects.
> Instrumenting the transactions with reads of the PMBus status tree lead to
> the following observations under "normal" operation.
>
> [1] https://github.com/openbmc/openbmc/issues/832
>
> Reduce our problems by communicating with the UCD90160 as little as possible.
> With the associated userspace change, the only communication will be applying
> the VCS work-around.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.7 with the above commit message, and a Tested-by from Uma.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4d26d4702a34..69d5897dbfde 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -253,6 +253,7 @@
>         };
>
>         ucd90160@64 {
> +               status = "disabled";
>                 compatible = "ti,ucd90160";
>                 reg = <0x64>;
>         };
> --
> 2.9.3
>
