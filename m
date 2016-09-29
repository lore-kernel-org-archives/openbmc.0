Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skx1N4JTpzDsj9
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:54:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=o2YUK1ov; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 192so2242420vkl.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/Tk3c4QJRFnGLITKQSa6iNPKKiUSLdcgdzlJkKW8oBM=;
 b=o2YUK1ovsVzhYr6XTW7WHXpiomLU9Ub+UMpuoy6Im2FaWd6JUYSm0KTre9Rgk16i24
 RPUDbtSduLEw9mL0HM080U13Kb/Us3Dr0ipvPsmfEbe0v3cMIctTcz+KXTog9G0wrwPT
 Eh3PE323NC7owJE8prlejfGRXoRZR+ytjM6AagWc3v3F1YtDdQnIfiQa1j21uZmsVH8u
 i7Nx0ZS4keDmLb51O+wcaoy94OS9+MtrZxGIEMP2ssCZuJRgXbajHTPk3VMnYUvTWjj+
 qGNVtdYan2f7MbsA18h12P3r2HBYbNk51Y6pvmCFj9iry7kAV5BN6OXzWYLNFcUPYLO5
 yyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/Tk3c4QJRFnGLITKQSa6iNPKKiUSLdcgdzlJkKW8oBM=;
 b=idOFw5cN3dGtOAlQHTR8xC3tSQf1PofbKKizAZaUwcrqJXTwJGCHcn7/KxG/iWldTZ
 smZjRXgnzMW5xdsSdeZioBSIlZndG4PhRR/Fy8/oSBP3quLhKxlt58q9RWoc9+1Zu5c0
 CSSfM8qh+Ho6YLQNLrYioHGuIKwVRzauU4lWPlTWKK4k51dxwCArMbiCCfBfx9Ntu+CC
 RksptK0yuwrsqJCUYHf4eC4pfeqHVqUsv8ry7URosaVFHo4YoPmsFcW0TjqaRzYI55kH
 a9pokTRJjsgp1Ge3njguzXOUHy7dqZEy1zi3l1gs/PX5ihE/Q+pZ09n4jL/KIyUqCeXv
 g2/Q==
X-Gm-Message-State: AA6/9RmHp/nmiaiCQw97LlBDn4eFZN34rnNxOnEmZ0O3dKMI8M/x6cK9HaPrkdzyueGLZJ0vQsqbqqAZ1D4uTw==
X-Received: by 10.31.102.130 with SMTP id a124mr16022849vkc.151.1475110486668; 
 Wed, 28 Sep 2016 17:54:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 17:54:26 -0700 (PDT)
In-Reply-To: <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:24:26 +0930
X-Google-Sender-Auth: 7UMuf--IpAFb5SghTZrqxP0_ggs
Message-ID: <CACPK8XdmD9mOYDAw-A-X2X2=nJYpkEJkncawwhVeuhn=-KQajA@mail.gmail.com>
Subject: Re: [PATCH 7/8] pinctrl: aspeed-g4: Add mux configuration for all pins
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Thu, 29 Sep 2016 11:03:41 +1000
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
X-List-Received-Date: Thu, 29 Sep 2016 00:54:49 -0000

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The patch introducing the g4 pinctrl driver implemented a smattering of
> pins to flesh out the implementation of the core and provide bare-bones
> support for some OpenPOWER platforms. Now, update the bindings document
> to reflect the complete functionality and implement the necessary pin
> configuration tables in the driver.
>
> Cc: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
