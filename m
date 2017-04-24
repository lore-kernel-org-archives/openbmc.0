Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBRDS0Pv7zDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:56:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="SsspmPvp"; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id 70so14205637ita.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=H7CKg6xBTEJ5/kgcArkDtzeddgwi+fK8KZhAjHFISLk=;
 b=SsspmPvpeuR8Ehc1I4NdwwnTBZnqCyo5XP6GItKkYIh4K2g71i2r7WNOQzm07d30xt
 pub8Ft6ERwXv25qmG8ufYOEdKPk9jGCCxdXGPyY7uVE6i28yMQ6wQDLmoI9jwgdJhNQY
 IFBAnJYuyWCHOIMvQ5zTN/hKmQGZiGOxKuFRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=H7CKg6xBTEJ5/kgcArkDtzeddgwi+fK8KZhAjHFISLk=;
 b=fNuTBXeT3x7c7apGMChK0/MvVJSDKdhHuDN/4pAQE3nGn/V01EMhjVhWu8Gi2Hz3IJ
 je/qy9wcYct44uLkx1fnZxwdR29+sj4/yKdxBEXdDT1ydPShBO+ajCJ6bL2HnZH0/Wfb
 oP+gvAjsJ7+Paz18AVhguDL0nGOQJv0HFCnWxYPLCXRY7yjYDznWWxpWQ+dHJHNxUspe
 dp38o+dkF20nM9EYREC8RHhswmezJhfiXsWfF0f8cg/pI8n1SPn4fenrM8Sx6pB2df41
 vJ3vgZc6Gw78fHXLjohomf3l3eEgqY3EbQEfkENS3ksnCY4mJNj8Zj+0ZBlYaoMCrsq2
 7JAw==
X-Gm-Message-State: AN3rC/4lC/Y/ihoghkHwqJSsoi/XPWXLoibUh22EsUkJ6x3tkD5HgAVS
 HCtFNeE8IDjZi4opjRnQoAl/2TCyPdtu
X-Received: by 10.36.181.71 with SMTP id j7mr13862342iti.56.1493038582383;
 Mon, 24 Apr 2017 05:56:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:56:20 -0700 (PDT)
In-Reply-To: <20170407125713.15678-5-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
 <20170407125713.15678-5-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:56:20 +0200
Message-ID: <CACRpkdYF3v9O2XEtZiWv9LA6SzcmKMOJ-w4ZsZWc8xka7iih6A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: aspeed: g5: Add pinconf support
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
X-List-Received-Date: Mon, 24 Apr 2017 12:56:24 -0000

On Fri, Apr 7, 2017 at 2:57 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Testing for pinctrl-aspeed-g5 was performed on an AST2500EVB system,
> using the strategy outlined in the commit message for the change to the
> Aspeed pinctrl core.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
