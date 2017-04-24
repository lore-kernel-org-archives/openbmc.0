Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBQwp3bLFzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:42:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="VAqY7dDE"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id x188so53084121itb.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UmrcOveSDXPV/sJEnxpstT5BeTJLCxr+xbrYnKbyzUE=;
 b=VAqY7dDEqglZifXwCSS4cvuJV7idm2h8vsWzYW22sFV1hl73JnCgOGS0CamD+ROP6r
 PM7+OsWmCviJHhKx6MWDTDnrKxw4iPmOxFDWbRyqiXyNqsELZ8i1a4dhhWAHLDKE9gru
 y5Sh9AstmxIkBibSDnV5/MHzZAPHpRYBFABx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UmrcOveSDXPV/sJEnxpstT5BeTJLCxr+xbrYnKbyzUE=;
 b=YSaji03ApBbD6LAqXkW9CSwK33SxdhXcvAPc3qdJrrw29sKNHgn/WNxAQ3XeNjIP5P
 X/n7b+QXuJuUPWB33qSG2il+Fpmd3xNpVVl8KdCyzN8LLZCUeXahWVidJf0bBFEfCNtc
 uRa1WT6NFFu4C7JyKOlDyCrxTai9q8Gj0xHkBVdUIFCCiAvh9zc4DeWWVGDmSlP/RuQc
 kD11IDIwzWqJj5ha/yAaRSBsa1ir+kNkmxBbqZ2fuNcOlGlBccOtop73tD4XNxeWTd0o
 w+Fwxc7Wo5IOJROgCujAG7Jk0jhIt7dNxAidFHJWbkYpmIRllvUYdmycYAw0CDrg+IPE
 OjdQ==
X-Gm-Message-State: AN3rC/6jCNIlwpel2dRHFsA6eOACl5gNNopo7dgXr7au4msFUMsccAQO
 dDzYFZZuxr/qHMt3bG2wfHvd2H6uRozk
X-Received: by 10.36.219.195 with SMTP id c186mr13556670itg.25.1493037768560; 
 Mon, 24 Apr 2017 05:42:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:42:47 -0700 (PDT)
In-Reply-To: <20170407125713.15678-2-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
 <20170407125713.15678-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:42:47 +0200
Message-ID: <CACRpkdaU7HWb434P_gctr9a6jCTxoQ4CYdbfoyvEHxVBrv0Brg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: aspeed: Document pinconf in devicetree
 bindings
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 24 Apr 2017 12:42:51 -0000

On Fri, Apr 7, 2017 at 2:57 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with the ACKs.

Yours,
Linus Walleij
