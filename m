Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22a; helo=mail-lf0-x22a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="epCY2o3m"; 
 dkim-atps=neutral
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWHNG0YjRzDqlM;
 Tue,  7 Nov 2017 16:02:05 +1100 (AEDT)
Received: by mail-lf0-x22a.google.com with SMTP id 75so13006237lfx.1;
 Mon, 06 Nov 2017 21:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+ArkDyp8iFOUbsIqcRB2fSfD6+j6hZtQ99eLGWxk3jE=;
 b=epCY2o3mexpTVKXiEV0eheFNd+EhcC1l6y8XWWKDPIb+cjsK5v9dhyP+x6GtX1Wmqy
 1j3Jl6gRJDfF2iPLmP9rUzF9Uok5uC1YE1fKTrbYpEpXxHP0xmi6n8R2viupizq2fC+X
 Ew/lE5nK63F9PjVRvVTQBcyQ5Tl/p+ZEqIxNWHb2ekEWHJ2HMEjsxSvrduGd9OA6ikby
 scuy9oT1g+puKSLBwlr9ckAJG5yqYF8T8qffGKpFhNrsr48hV8NvrZ7YzbvQ3XeIJTB7
 ojE/e/BNsw1cFZ/jhYtSJtQs7mI2zKLqZcPRuEY0id71RP9OlFT9I+MbJapBcvkQGzil
 P8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+ArkDyp8iFOUbsIqcRB2fSfD6+j6hZtQ99eLGWxk3jE=;
 b=IW/HvZBECzOYE5OjVtauabHZOEdrw5RqQR1G1ht5n+uf1t56rZ9UvKYnPMngZ0J5aa
 Jf6BKe1rQraI9qdfefj+3rILtbGuRFWejw/NW10KYsupggPGD+fbgAOlnJ/kxGGMHfky
 A4FzkjEWhXpUmKYgbScdrI3ATRG2BDBaQd1BcE4xI10QbU2aWLc2GFbXwKlL2Jk7B2H9
 VC6chyRB+neuZt5wKduOzWdoqlC4p57aPv4FsR6Jazjg7f1S5hW30P4coLn9to2AtNxh
 nBEqQAzxMwc5PZsVvl3VCx3jGqEtnWmJ4sASzjh74jAhCaT2uPQWFHOybTUQ1EgSWeoc
 d5ig==
X-Gm-Message-State: AJaThX7szcbHQP/b+J/y4+2CfbyWqN8s+Dy94HkDjacHyzanOiLrZn9c
 OsNtp5vqEzB1h7/DSLaKEfrGbOWZ76fgujTlEEY=
X-Google-Smtp-Source: ABhQp+SNBQRruia7gf7cfN6a9C+wGa3eScLmifzuggeAOqquYMQh3deNixfNSVcQhTriRTmFK4fF8HgMFCLzdfsBZZc=
X-Received: by 10.25.143.78 with SMTP id r75mr6034462lfd.85.1510030919929;
 Mon, 06 Nov 2017 21:01:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.71 with HTTP; Mon, 6 Nov 2017 21:01:39 -0800 (PST)
In-Reply-To: <20171101040457.1200-3-andrew@aj.id.au>
References: <20171101040457.1200-1-andrew@aj.id.au>
 <20171101040457.1200-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Nov 2017 15:31:39 +1030
X-Google-Sender-Auth: xYbnMccRiDXP-FigrewMT--V61M
Message-ID: <CACPK8XcTU84w4e4qtbUxsqBNpv2ucNu4AcicHWb7NRrVM3Dveg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: aspeed: Add support for reset tolerance
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 frowand.list@gmail.com, 
 ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
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
X-List-Received-Date: Tue, 07 Nov 2017 05:02:08 -0000

On Wed, Nov 1, 2017 at 2:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Use the new pinconf parameter for state persistence to expose the
> associated capability of the Aspeed GPIO controller.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I took a look and checked the offsets against the datasheet. LGTM.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
