Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh2Dx5xTJzDqL2
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 14:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ibo8YZu4"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id h82so7524872ywb.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 21:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=axzgNdn6pAbl+1KO+TBA0zc3DM5T/xFEeVqmT/hXwcw=;
 b=Ibo8YZu4jWKgI/B5bBR7LTd6cUvlCSvZoId8MVGFeX/KXx+viN9QLYgZ31dvwiqaLK
 QZzQ1rK0IiJH++qmXHjx+sh16H2Se1iCS+LEFHOSTruBCcB5V2wHNISYCOlX9Z1XEfAz
 v5+/G6eYDUnZL0fcrcqz7AZuJUpgqcRP5GGj6HP4p3rgScCc6Ya9QjunNYB14jt2v3qR
 Pp/wOPKVlWGNbO2ohjeRejiWASmWtzJNIsS1eC7cH825Dim5nPqoxx1E4RkWcdFx0iSY
 kRMRmBjvVZdPJO8SbUpyLngLvFldvTthM/rlBX8qrB5MCEnFPZWSMPpV3uG8cgzyurh6
 HlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=axzgNdn6pAbl+1KO+TBA0zc3DM5T/xFEeVqmT/hXwcw=;
 b=CYTtpRKDVgdWzkVYMDoZf6Psf9zkgvMnbEbt11LIpl8kpD76+dc+mKNu+Dmg59UBQ1
 F9QP3qg+MuPX5PeiWlLi6sndKfGJDU/KRvxiVU2eFfBf4B4tEfClnDlQwZA7MeQPPeRC
 d6QaYjPd7w37yMAPOQ4dZdQYJ4IGJV2mcX10HSALF24XbFousGtdJeVvwp2hRk+/gekH
 uwSiQEUO9ZuBkSypHPT9n2oIBY4sYZhT0E716e+4u6BxUqs1bHc+J8ifgytmHqnd2Oga
 yFdrX4co0FgREtrGZZFZQRPlAwdbd4sa3I9YuN2pIC5d9EKGIbdeqYvDmI9IbLjurik/
 e43w==
X-Gm-Message-State: AODbwcDpTJwlWASMu0O3mbvShfIpoVYRkm5fTvH+oLgQ8ZYEYLl+aPAh
 2WY3vfu3w8WBbZ58LMp6uKQSVRdNWw==
X-Received: by 10.13.233.195 with SMTP id s186mr11624045ywe.329.1496637631825; 
 Sun, 04 Jun 2017 21:40:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 21:40:11 -0700 (PDT)
In-Reply-To: <20170603012952.2192-4-brendanhiggins@google.com>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-4-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 14:10:11 +0930
X-Google-Sender-Auth: 9HOWi1qOs8cA09f-NfcaYdc3b0g
Message-ID: <CACPK8Xdg7AVrh7xKi0hiR_-6qSo=BkATML2OQJnUXoa60v5ApA@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 vz@mleia.com, mouse@mayc.ru, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
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
X-List-Received-Date: Mon, 05 Jun 2017 04:40:34 -0000

On Sat, Jun 3, 2017 at 10:59 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added device tree binding documentation for Aspeed I2C busses.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Joel Stanley <joel@jms.id.au>
