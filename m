Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="IwgNeqsQ"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHVf5Rc1zDqBc
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 18:29:30 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id k70so12332642itk.0
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=IXnSzI40PRkieLRXyvUwdC+iJxB71rS0Wz/Q+sQiJ3A=;
 b=IwgNeqsQgDfqvg87flqSD5YQmEI3J6PK3gDq8kS8WP4+ja4LVBg4lO6rg7oru7g083
 mpcBpij3MZjRYShz6V9u3+7wMpBF0GoL1plYQmb+tKvpafXMlWxqZLm95DBwSkvizEop
 IyalPQiSPKkE0MNBXECJLeTJuDmM1AC+xoSH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=IXnSzI40PRkieLRXyvUwdC+iJxB71rS0Wz/Q+sQiJ3A=;
 b=sO6hUwZYH1fpDH5LHV4MnpkHjQIYtbCjnvRpjqzAqxjpWamgZtbjk5t36FESM7wLFK
 GFRjNwt1df14BN0KsJLUeGLmD8woxx/XP4wiHVBFg4+yg3VJK4tlopeB18gaFadhOKTe
 94EDAHaoU+rNjyfnGrJqMkr43l/QESOED2wMZaV0Xj24Y30EKPpbEAYtjlCkhl/BuPvo
 VeQGIm6F6ekitNIPakFgIrqlL8MRTbzMPRiGarJe1XjLk+aB5I1Cj0vdw0nw9EKXbrac
 k+aobDEXU3BRVyOgHMJkQfl9RCwoHKTkw0Ynjtsfa/qZfS2+KX4OPxd7yZUZpfMkbowW
 Sm8Q==
X-Gm-Message-State: AMCzsaWqo9L2aTu7WW60JXOs+SKr/9ggI/BhaJv+Bi0WwIuTHeBlukmM
 b+fHlSoEk1EOvgBSQGQIPBFTnzpQZ2JLgw74PVsX1w==
X-Google-Smtp-Source: ABhQp+SXdH1ampuoUskMBJL7EECWF2zhz5robOdPtwRquhWkpewICDsK+p8G8RFafqB3KUcK4hOntJpAZfOa7h2Twro=
X-Received: by 10.36.62.3 with SMTP id s3mr1254818its.113.1508484568229; Fri,
 20 Oct 2017 00:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.140 with HTTP; Fri, 20 Oct 2017 00:29:27 -0700 (PDT)
In-Reply-To: <20171020033727.21557-5-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-5-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2017 09:29:27 +0200
Message-ID: <CACRpkdZ9HpXXuauRtVjA9n1dwF3sUQ4gJL-FOUMcMBDCL9oxYw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] gpio: gpiolib: Add sysfs support for maintaining
 GPIO values on reset
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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
X-List-Received-Date: Fri, 20 Oct 2017 07:29:31 -0000

On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Expose a new 'maintain' sysfs attribute to control both suspend and
> reset tolerance.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

NAK. You will find the actual ABI documentation in
Documentation/ABI/obsolete/sysfs-gpio
that's why. This is being phased out and should not be extended.
Everyone should use the character device, especially for new
functionality.

Yours,
Linus Walleij
