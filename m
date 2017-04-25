Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBxPF1qTzzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 18:35:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P3iWI5u5"; 
 dkim-atps=neutral
Received: by mail-qk0-x22f.google.com with SMTP id u75so41136651qka.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lSvXlwtLMO+XcMa1QjBZqCj0j+TPSFThigxqTEL3L+4=;
 b=P3iWI5u5gyFs7QbbE5HY/SYy5ljQbSu7Avqe50/VAoL1InO4ZEBdvIYpbJ7SQaYfm8
 7ohoohVVt341ZdJo4SmRsmwgcE3x/D0nwOs9v89NZkF8LRnSPRtJqJRTh5bg32+DiydF
 SvT8XXFL8BqoojIbUsl9brm7/csO7IqNydE2aG2vEHhn4YqvANO4BvrsWEBz+l+Hph/K
 15DqvHBvFXFirSaVqrHv3q/lmHDw+rj65V6wy28vQV5xDoy8o+Ev1u9H2QSwcaxwINxL
 CbA2hy6W4oCbhr4wpAVAgGsxDWNJvNSrmRedUquSh5j15zwdxjhZ7FWxbKDdvySVLFwM
 QdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lSvXlwtLMO+XcMa1QjBZqCj0j+TPSFThigxqTEL3L+4=;
 b=GjHdj2sgEsDPzDWnWlOTorMbtUMVFrPemYriF04LfAe5LE5cnhmsnvxCOhSl/art3x
 bi/ODMxrOOAtgjybiDCyF61RftWn8Vzf5L8BydsurHP9m3KnzT3p+NpBcf9XOrXmDGIZ
 hnU52dsPd7ub/ViUM77sqQvO8ImkIGfkoNpkRYOa9+znbQ4qqY3IFmdB3GTM4zng5ckp
 YHkAit9lP0nKx85I8XFYc4oSQpmjrTMv6aQuqcrpqoR1QJ3gKyEVLU3Qu6HIk3/MPxpv
 gkR7dv7aF0p7pVko8FxUQj6un3gKYg7JQXhCTJjvQl5e0bPu1n7/ad2+mUdBN2/oU6IJ
 G2zA==
X-Gm-Message-State: AN3rC/5gFuwQt8OICdDSo45CNsZC8DH1Ta2YgjXEE4uGGRruFyFhmTiU
 xrc4QLBglpBfvX5Bu5ZLkMa71TpAmBic
X-Received: by 10.55.88.4 with SMTP id m4mr26399791qkb.84.1493109343114; Tue,
 25 Apr 2017 01:35:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.162.69 with HTTP; Tue, 25 Apr 2017 01:35:42 -0700 (PDT)
In-Reply-To: <20170424181818.2754-6-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-6-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Apr 2017 01:35:42 -0700
Message-ID: <CAFd5g44vNSmnsGQq=d+Nz_tpY9eWSEU8hS5=M3UrCcKGbPu-_w@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] i2c: aspeed: added slave support for Aspeed I2C
 driver
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Tue, 25 Apr 2017 08:35:45 -0000

Adding Ryan (sorry to everyone else for the spam).
