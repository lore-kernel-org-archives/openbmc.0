Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdrFB3dN3zDt08
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 20:02:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qb6xL9Jk"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id l126so2013091vkh.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 01:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nmjF8T5p+kUtiLzWHorcBDcZlu6K1TXOZ+XKVYr5J4c=;
 b=Qb6xL9JkAp62HtPUCelEx0RqFMKpLsqMbhkc5moe7L0Oy7VvJkOIW3Q4EhkZbnMyiF
 dKZE/Syx62kM47nLDm6wpMjTEdBmHrLH4yaHIEs2yNpHQw9sRxuLkjTIFSiuwCbFlbBU
 eooBYM2lt0k/SiDkL6pjno6XkIgnNCQsuUne/0iT84lQJU9SCEm7upQSoFrmVJDmh6OA
 zDaBdydldY5yUR+jpCrg3Ex+6H6AVAu9NWzyhjmoJGSUD6Bdk+zc+0RYG5Gl5/c9wHY4
 lAGy1ZyOg9Kma31aI1QU4wP/i5VtQQgrnC6HlZrR+fTWkeDPYPEKcbAAQ9XnK+GY6Xtc
 VzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nmjF8T5p+kUtiLzWHorcBDcZlu6K1TXOZ+XKVYr5J4c=;
 b=YjddYXhauunFrKuceFmPdDfJ8Vzuww+pyTf4/LVdE5VFx4pGdQvhx6BIXaAv96I5f1
 BMreeK1lo9gk76K1xti/N576fiDbrINZqNTG2Aw7ZduWS4F5J1d538UA5N3QJjzTfM9S
 OsVmuNXRPxFrAzhMU2PkS1vwlXTHoElqkXzfF72EhT5R4yWgbjmdckRPrRaltNW1e7Eh
 WFefmxIu43G6n+fIVus1g6eUeNN9GkFp8kyVXTKKMoE+YRdWq3mIg3t3XrmSaEWrRkVY
 KvxMbHp3FMu0rU3kjzF2nk7gCKlfugFlSgu2n34sXTU6Tgdx+cnxBJsZShlncC6yRpqr
 +VVQ==
X-Gm-Message-State: AKaTC03RJyuUItBTS65u8teON2STMXdW/wB7wNm3NKAgwqEjvP8AixRx5c0BF/FMUCn/Cl7sPsGbmBG++sODww==
X-Received: by 10.176.84.207 with SMTP id q15mr72576153uaa.177.1481706155971; 
 Wed, 14 Dec 2016 01:02:35 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 14 Dec 2016 01:02:15 -0800 (PST)
In-Reply-To: <1481702104-8617-5-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Dec 2016 19:32:15 +1030
X-Google-Sender-Auth: xjp17XaiyUGqzoAyFF2PfGKhhE4
Message-ID: <CACPK8Xd0znB0C+P8mstjjSgJWN2T_a0h2jJYG77gVbiZghtCyA@mail.gmail.com>
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
X-List-Received-Date: Wed, 14 Dec 2016 09:02:39 -0000

Hello Jagha,

On Wed, Dec 14, 2016 at 6:25 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Add clock, data and clear signal GPIO lines to control seven segment display on
> zaius platform.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>

The Zaius device tree is not upstream. I suggest you submit it through
the Aspeed maintainer's tree (me!) for inclusion in the next merge
window.

For the time being, drop this patch from your series as it will not
apply to the upstream kernel.

As a general rule make sure you're basing the patches you send
upstream on a tag from an upstream tree. Linus' v4.9 tag would be the
best one at this point in time.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 8ef4ece..ccb8147 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -43,6 +43,14 @@
>                         gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       seven-seg-disp {
> +               compatible = "seven-seg-gpio-dev";
> +               refresh-interval-ms = "1000";
> +               clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +               clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +       };
>  };
>
>  &fmc {
> --
> 2.8.0.rc3.226.g39d4020
>
