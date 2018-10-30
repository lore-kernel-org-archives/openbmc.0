Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="MuzQVs7T"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kqxS6lF8zDrPw
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 23:08:28 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id d7-v6so8648540lfi.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikcapejhZs1NZVz+nd6VxP3ivNvG3HHZ13oWDtGHyD0=;
 b=MuzQVs7TLQXYLnlv5NK83Rwiud/j6ktYcTpRljzkYwYuFtd789l8uwxlsutoAq8Blo
 lKoaRr4x8QlnYuZsd24rc7OQcR/VrueBxGsUOcc5nrF1zqG6VdshbGg8E67kKDz/OlCn
 uvgyMzO8jAXTJb/IBXpVjTOjcVbSgqFj8jyOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikcapejhZs1NZVz+nd6VxP3ivNvG3HHZ13oWDtGHyD0=;
 b=uTZCkgI4m8vaxE9SAvNrD8M/579XMgWZUZNiu222jOIJFUoB6voPnqmNTU3kpI90T/
 7wET4f7kC5YJmJzuF7KFjzcW2p+7Yp2i/YOBaaj423lEjd4uhmysDI6VazEn69WsznrW
 HY1jAoxv/psFqY5Caafv+U7hU5w29AaAbIFrRTIcvWhwyNhqqnWhjsxF67YQHzBvGMI3
 ///rii8+1aE/IB4/esSRki+Va0rHOqLbddThkeCmLBvz/InEekAI4YD+qSoi+NAAAM04
 nXr3ShMy2Jq+iDEFvb19UIIXFM94w388JC2onX8H4dJ4Ar7a+Qr85yOJYa0+2zElGR5p
 RM8Q==
X-Gm-Message-State: AGRZ1gKCkP6n+n4Eyi0Fvzd72YnFIdqN8Skj+mfhpR+uKEvSX/b7OVKB
 +SUf2sPJhYcEzM3yo+HWcMH7cM0X/T09JQeagn8DSgwmtLc=
X-Google-Smtp-Source: AJdET5cqFmVpeTUU6Zx9FEHXAbX+H7xXPsQF2YCI9u9fDNjCLiPBz0LKYw/gQP709OxDvQHCwKxkedz6MaMolXCgFrY=
X-Received: by 2002:a19:41c4:: with SMTP id o187mr1800325lfa.32.1540901305574; 
 Tue, 30 Oct 2018 05:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20181017213012.233957-1-kunyi@google.com>
 <20181017213012.233957-3-kunyi@google.com>
In-Reply-To: <20181017213012.233957-3-kunyi@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 13:08:14 +0100
Message-ID: <CACRpkdbS_aOpFORVnK3QJUsF1p-mVxtMas-q6fOp7emTx281Lg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG
To: kunyi@google.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 avifishman70@gmail.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 12:08:29 -0000

On Wed, Oct 17, 2018 at 11:30 PM Kun Yi <kunyi@google.com> wrote:

> Indicate that the pins are both controlled by the pinctrl driver and the
> generic GPIO driver, thus GPIO driver should read the register value
> before updating, instead of using the stored shadow register values.
>
> Signed-off-by: Kun Yi <kunyi@google.com>

This is quite a rough measure, if we instead use regmap-mmio
we can exercise fine control over what register are volatile and
not instead of saying that all of them or some of them are.

Yours,
Linus Walleij
