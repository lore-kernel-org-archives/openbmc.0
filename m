Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="c5I2IPL2"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Lkyc5zMPzDr96
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 21:15:04 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id c19-v6so4227470lja.5
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 02:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGstlgzAhYekvSI+PJ9By92VAGAoLLwYkDeZkhyu6X0=;
 b=c5I2IPL2v2/au8jFT5du0k+RJP1kCtptQ6y4dH+1/Bit8xmzEJc4/12YMmnPUnpUh2
 ojVRNIlnxl/nKp7jqAplsaizrmh3z38cOghW302OAWFagOg4SG8pZ9J5t5RpWCJlYRsc
 8wDphWPt32yfcmnPlelX7NX9Mw+fGekaPCElM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGstlgzAhYekvSI+PJ9By92VAGAoLLwYkDeZkhyu6X0=;
 b=Zt+aPTmdSkBgj+UjKIE4ypJ8cjDRyALb9eqYMyfZwI3eIfdEH7oXmjieszA7qir8f6
 tI9ORbvj/yoo77D65Lp1KwAJqYUp/sDyLA5O6V+cIlO7DvF9QpprxBm1E4PzuenlfiwE
 5XObjDh8hYjvX3pPYCmw34EYTzcvcypDAcSt44O0R5gPA9lwZq9L61p81TO5cud/0tBe
 v8c+LMn5QtjvO61yZ9SpXvJ62ZbsARX89qGw2nbdspRpF+9I1y20VUoF9LVoa7QBxsvY
 rASRiOvHp1xDigfs6qT0G5nJFpHbc1pcqqi8FYCip2/XNc6JCBtttA0ArRBEe4lWdh9o
 +/dA==
X-Gm-Message-State: AJcUuke1Y7s58wbVrpRQGjbDUm35rdTyuXWCz4teJahoojMoDq1x4j0+
 yGd37dSn+jkREtfAs9PEQbCLtLDnq2VYVUETajWzjg==
X-Google-Smtp-Source: ALg8bN7AopW4FfqmbqbcDvGxfNYRDMgbPHW18qr/+SeYk+5GjNXRgJbQgLxxSX/kfbkrDMjq5hpbL14VpZIRL4d2eK8=
X-Received: by 2002:a2e:9e16:: with SMTP id e22-v6mr1190314ljk.4.1545387301141; 
 Fri, 21 Dec 2018 02:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20181212215305.3852170-1-taoren@fb.com>
In-Reply-To: <20181212215305.3852170-1-taoren@fb.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Dec 2018 11:14:48 +0100
Message-ID: <CACRpkdZr7zX2cvk-T93Ahj3Q2cE7-ey+T4Kr0n_==jae3KGr0Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: remove duplicated statement
To: Tao Ren <taoren@fb.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Dec 2018 10:15:06 -0000

On Wed, Dec 12, 2018 at 10:53 PM Tao Ren <taoren@fb.com> wrote:

> Remove duplicated assignment statement from aspeed_gpio_probe() function.
>
> Signed-off-by: Tao Ren <taoren@fb.com>

Patch applied with Joel's ACK.

Yours,
Linus Walleij
