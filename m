Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZbQUMiWH"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420dK30wydzF13F
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 17:57:57 +1000 (AEST)
Received: by mail-io0-x241.google.com with SMTP id 75-v6so3683678iou.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 00:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrLADOX2CyAZJ7ZqxBfs9N8TlXtdBnJXH5xv397VT60=;
 b=ZbQUMiWHnthMQ9JuhqggQrpujgDrH6xXWQHJVt4w5r5yOYzgevuqV5Nomv2/1AOmp4
 IDwm++N7ngOMUXgB6L5lliDt44jqaZihCuNN9HvsxYI/P3qh0165gXyoTW9cImaYA0cI
 fICXZJZPE9pL3D8j9c+qRC4vnMR4DhRh7A+n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrLADOX2CyAZJ7ZqxBfs9N8TlXtdBnJXH5xv397VT60=;
 b=FBhE8D1/PHgx30jf6Ndwg5hpo/LYJY5My+PBzpD6gLBg1AgFywuCkyuT922lkU/7k7
 xR0lgllNNZEva/lzNGeae8komctU8k9LvwKQHEAc/DX4NJmant6VBSSp1+jE68tffv1N
 H9XBsMposexx+u/mJDrNtR8kuiBG18Mh2iSu0U1301f2OQBMpbX3A9sgHPx22aH+zGBY
 8SnoCmsb3n6QoLQtfQlmGJdkOkNrKzBcZc4T3Sxq1z6FkxRQ1cKUAeWYKbTTSM9t4Qfg
 wpmV7IqUHz60sQAvSHMsDGetHjMrojar5AMRBE1zcWJilOZFzvh1TLO9tsayTSTjZqMA
 k0/g==
X-Gm-Message-State: APzg51BOD62vhIjUxKhn+Rx3H1d9kU5fQ/AzP24Y+MVTOib49i6rhkEp
 GPa848aqiPWlzf55UjMBupSYfb7YejD2/7knANEnRw==
X-Google-Smtp-Source: ANB0VdYMfqxzAJxNLgFOmBLuNV1K0CgCDhPp6MNA7hYRUZczsGxPbZbgDxgV1xfzuaLNKEJzzgbArAAAPbm87v5lPzA=
X-Received: by 2002:a6b:4006:: with SMTP id
 k6-v6mr3968335ioa.277.1535529474588; 
 Wed, 29 Aug 2018 00:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180808092526.87405-1-tmaimon77@gmail.com>
 <20180808092526.87405-2-tmaimon77@gmail.com>
In-Reply-To: <20180808092526.87405-2-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Aug 2018 09:57:42 +0200
Message-ID: <CACRpkdYDUO9JY3+d1_iOquMo6yoJmjuH5DV42rjY47gomt++tg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO
 documentation
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, 
 Joel Stanley <joel@jms.id.au>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 07:58:00 -0000

On Wed, Aug 8, 2018 at 11:25 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Added device tree binding documentation for Nuvoton BMC
> NPCM750/730/715/705 pinmux and GPIO controller.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied, bindings are clearly finished!

Yours,
Linus Walleij
