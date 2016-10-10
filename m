Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssst41yKbzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:57:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=M11InwgH; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id t73so4022323oie.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hfa/P55dAAOtImYnhyOImquq+nznFjx0CCeZmogFIJk=;
 b=M11InwgHTnq4e8p78QrEd2OZuw2YcLGe8SgfIuB0yG29dEkEiDrZ6IwnmBOfCcqwQM
 /ltszDYvzy8ViInjRKbvqn9gxMhyga2ir3CXgfaIxIVIjlOzHSAksjMbx/Der7g/N33j
 OdPw+ANxFZ7qMdSFlt316M3vFM8UVWRPwFlsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hfa/P55dAAOtImYnhyOImquq+nznFjx0CCeZmogFIJk=;
 b=HnTbj3F5bwETcWt9pupoO/hc1eXzBEBHyOVZ9sqw1X8T7nYZaRP9sz0h2s0tDn0Gt6
 WB1KADq0siYiWAm4xi9rG5UfAFu3oS1yyQ20x5PZFQ2PVxeknDyi94K1rBZP3t9OW+fl
 HOkxrcQqVWI0fNEM5EPzh8b1IH6on3AK1b6OazfW4Xp+JsgrZ8T2UCMUUr+Qpch0zrv0
 eLMtcm/1Jr5doksXhbyxWszPZrVc31RX4XM0mynn8V1//qVonwx51Aa/ZgYkj+TuNmHt
 DisImBsljOhxa/GRDeh0MTw6zTyoJ8r1xcu+cs3z9zjQhuqsDNPODOdWu0VpMJa14e9L
 LmwA==
X-Gm-Message-State: AA6/9Rmxw7sVVRwTJSu8mODT6ZbRyFr9qMQ2pNGVKu85Afa6bijwa3Za5Hal742j5sL9p8LiC4vNRIYrn9+XgbV+
X-Received: by 10.157.44.151 with SMTP id p23mr5629527otb.200.1476086250319;
 Mon, 10 Oct 2016 00:57:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.146.12 with HTTP; Mon, 10 Oct 2016 00:57:29 -0700 (PDT)
In-Reply-To: <9364de84d3be30a5349298e219ca827d176d7ba8.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <9364de84d3be30a5349298e219ca827d176d7ba8.1474986045.git-series.andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Oct 2016 09:57:29 +0200
Message-ID: <CACRpkdYvgN0_yogc05kdcwqNzyMx=rZXQ1i_v1k4S0evKnYqrw@mail.gmail.com>
Subject: Re: [PATCH 3/8] pinctrl: aspeed-g5: Fix GPIOE1 typo
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Mon, 10 Oct 2016 19:54:26 +1100
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
X-List-Received-Date: Mon, 10 Oct 2016 07:57:32 -0000

On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> This prevented C20 from successfully being muxed as GPIO.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
