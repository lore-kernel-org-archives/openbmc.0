Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8NTY2kg7zDq62
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 00:45:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="T9ABqTlZ"; 
 dkim-atps=neutral
Received: by mail-io0-x233.google.com with SMTP id j13so36573571iod.3
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xoZSueDgruWmE3E2Q3upLHzbBp5Y2fsqNHf183zSCDY=;
 b=T9ABqTlZW/BhQIdpRIWvUI3q9T3yZsggQp4+MFcCL0Yo4Oo7wyC9OIIfuddANPd8xX
 Xgt60HTwtjMydYcyuBLJhhE6IoZq4oxwPE3McELJpn9SLMwowk10YwPEFZrP3jfX4oCw
 uHe//uIjzdO4jduxhD4svXRJHjH2Z+EfKvtR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xoZSueDgruWmE3E2Q3upLHzbBp5Y2fsqNHf183zSCDY=;
 b=maSY82cJ8OYgu7XecGZ7P+SysPMA8/6JuVhuwScykNQuKygqNrQdqBbV764qHJQ5Dm
 MOwtXuRCO0t6UisDLwJf7Pn1RoXS6+N71uC08SzLBx+np0uHoGallNPaujBgf6YOeCXb
 JNpVVG+t2afsnQpjgES1E7SQoE66SPa3qXpxfGo0Lqc19vk8lf+jdktc52GBwyjDPKTE
 JXdGE1UDXdt/3Brph58xhh1Jgx5fpd+KaaxRxfMiJFlT/fG39UbiKjI3GREuic/tdijU
 nA2ZULd/lAErhJCUh5VK6AT0XBAjMl3iAe9BR7g5j6lIcHkSEPllwKGpGzk1DlvbHnsx
 bR3A==
X-Gm-Message-State: AIkVDXIFMhNmqLMcLzP6cmSkLAxCmq75gtSRVkuM2kfUMOizFvhnEtfBWKuW/HBjCMXFW0VuGrvHlM43tIX+GZ4o
X-Received: by 10.107.15.12 with SMTP id x12mr2655472ioi.61.1485438319272;
 Thu, 26 Jan 2017 05:45:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Thu, 26 Jan 2017 05:45:18 -0800 (PST)
In-Reply-To: <20170124061646.9317-2-andrew@aj.id.au>
References: <20170124061646.9317-1-andrew@aj.id.au>
 <20170124061646.9317-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2017 14:45:18 +0100
Message-ID: <CACRpkdaPzQ9VRM9_MDCZ5VugTiXBD0F57=LWScsyb=tshsE8QQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: aspeed: Make bank names strings
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
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
X-List-Received-Date: Thu, 26 Jan 2017 13:45:21 -0000

On Tue, Jan 24, 2017 at 7:16 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> From: Joel Stanley <joel@jms.id.au>
>
> The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
> documentation uses two letter names such as AA and AB, so make the names
> a three-character array in the bank struct to accommodate this.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I already applied the v1 of this, I guess it's the same.

Yours,
Linus Walleij
