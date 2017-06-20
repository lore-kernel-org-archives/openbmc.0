Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ws8bg6lnlzDq7q
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 10:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uQDWZBZX"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id g83so46533184qkb.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 17:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NXpQsQgdpBzaId1yRkssjKX6FiOjTq5ZFdwt1YMMS64=;
 b=uQDWZBZXbJIIZ+GHIffqgOrJOFIItIqDV0tcxztkKSgutf9SPbDcyWaYojm4q+5l0S
 qJuciLiojX5qh7yByC+noIxdwscyArORdO+5ZJCx2GUcI3d4CKj0xhbS0LACf0woXQuQ
 Ips+fnzJCWVupoqoNkM8oA7hcvS2vseXYt+eUlsSo5iXJYqAA9AWK3CjmrVUPMLh6eIW
 UBhDrIpLyewaq3Y3QFGw7QtjEcunrHBIuHR9GuTP8hOXU3BQ/xrLr0nvW6kCiyh3bemG
 qm35038OUORHoEhU2bltZszZWPgCDfCczrfBDPn8QS+R2te3ibHHaETf3avBnU4CI6dk
 OYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NXpQsQgdpBzaId1yRkssjKX6FiOjTq5ZFdwt1YMMS64=;
 b=EQTus+wq7UHsCqi/F96WwKVyZCf6djx+QwlQIVpRD7tZTFzy3trIHQQzJOdbaQRomu
 oO1P1ASrzEVXWFoXf0EcIDai4T+/GCzSHvbw8JnJcxjA5bYaCPPUtwz+OpOzPOD3Gk2s
 Oh/GaVJ4InHRezSZdVQInxhNZZw59d6jM8Q1vVP/kkYBveL+aVWP9Yf/yq7dfmfpNhRA
 Xyx/4ecEyehUmBN09cvHQyu3LWiqAur012Z/L2D9ZpzbyAQorkOWs9cuIyqwpPmc9Hvo
 IulTgqFJFW1zjq8fDwoMRprLtjqYsYR90BHR9dMTanSo9pJ5Lwbh6O06ZMmiLWlzhR+j
 M/cQ==
X-Gm-Message-State: AKS2vOyP6dkUUjB6stlFZE3hUrxMbsmmZHUtNevdzaSBb1SDORRJlW3C
 jECcmOabhxuGlbR5WzlZWCF5cqXuCI04
X-Received: by 10.55.160.196 with SMTP id j187mr19908493qke.145.1497920300153; 
 Mon, 19 Jun 2017 17:58:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.73 with HTTP; Mon, 19 Jun 2017 17:58:19 -0700 (PDT)
In-Reply-To: <20170619142105.kynebk74y7nbvmfx@ninjato>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-5-brendanhiggins@google.com>
 <20170619141322.devvmcbjaeq4jnv5@ninjato>
 <20170619142105.kynebk74y7nbvmfx@ninjato>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 19 Jun 2017 17:58:19 -0700
Message-ID: <CAFd5g47D0zJax1X8MeV_OwMJvzd2Ba-hZc+8_X_Ks1ibH8ipeg@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 20 Jun 2017 00:58:24 -0000

On Mon, Jun 19, 2017 at 7:21 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> And any chance for a MAINTAINERS entry?
>

We already have one:
http://elixir.free-electrons.com/linux/v4.11.5/source/MAINTAINERS#L1090

However, if you would like me to own this driver, I could add an entry
for myself.
