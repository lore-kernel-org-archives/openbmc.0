Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="OHpwdWxr"; 
 dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jsNP2FW9zDqXN
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 00:10:12 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id k15-v6so17459915ljc.8
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2EuBnnE3VIldbwRik6t3OmAGVBJmIET53dfW9r2eL5Y=;
 b=OHpwdWxr1RPJJ17SR/Nr580pdplQR3okHLQMvCNfJg3+ZxeNXARyebmW6EEpwrhkjw
 Qbi9R0vRhnANOFhFJ3WoQbDEHf3jUvrm3/w/+6epKBwBaNefct5FhsDfTS/YQ7bju8bO
 7zENX0VctH3/0b6RifjQu6M6mm/4rO1yKMcyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2EuBnnE3VIldbwRik6t3OmAGVBJmIET53dfW9r2eL5Y=;
 b=siG1/OCmgB+AoZNXmYYoMWGdH2yn7oxCxnYPSglz/guXuT63Egjywh8TYef+L5FwhM
 hJPiAUeVn4iR40jn/EeuWN0Qo1qte6hhv4duiMxx9XH8CtPaZikJp9oKCOm/i0wj4NJB
 l1wkxZwH7yhNLf9Jys87bsP5/4x7EOipg4Dwz7zYYj5xzIp+GI3Yc2Z7XmwNdSGyYiZ1
 cr3DConIsGam46kLsrrzL9q3RBszwBVPVur9juWMxi3zTqLovciQE9uZPPevL2ye61O5
 Y2+aJVhUq9ytzqPrHXQBOhk6gEKdb5Ro1RJTmJLThqz8O1ot51hddaa4riy7OgkxAabO
 h4kQ==
X-Gm-Message-State: AJcUukdIK4Ulp/fpxfpu/5zr1JErD2v33MM8vA2D4ZF6BqHoLA+KrSQt
 WdsJBslStHz6x6D1dEiHc3xKBYIwNmNUHBIi0JJPCg==
X-Google-Smtp-Source: ALg8bN5cFfO6iIskH30cGR/h8p9a83VpgnAjIbXcufwsAVmoLxT6p6VVg+QWzghvfv+KZeaYlz46q3GjV5NaqgXZ4QE=
X-Received: by 2002:a2e:710a:: with SMTP id
 m10-v6mr17604741ljc.66.1548076209116; 
 Mon, 21 Jan 2019 05:10:09 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Jan 2019 14:09:57 +0100
Message-ID: <CACRpkdbcKLXFNpWWsNqrDa2U9QKnO7700n2-1gM64-v1+bkrTg@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery,
 Vernon" <vernon.mauery@intel.com>, 
 "Feist, James" <james.feist@intel.com>, "Yoo,
 Jae Hyun" <jae.hyun.yoo@intel.com>, 
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Khetan,
 Sharad" <sharad.khetan@intel.com>
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
X-List-Received-Date: Mon, 21 Jan 2019 13:10:14 -0000

Hi Kwin,

On Wed, Jan 16, 2019 at 3:30 PM Wang, Kuiying <kuiying.wang@intel.com> wrote:

> Hi Joel,
> Do agree to use proposal #1? (extend "passthrough" to the "direction" property of gpio, use  "value" to control it be disabled/enabled.)
>
> All,
> Any other comments?

I think you maybe misunderstood my previous mail, or I misunderstood yours :)

Make sure that passthrough mode is set up in the .set_config() callback,
nothing else.

Do not change the signatures of the direction functions or set_value()
functions in gpiolib.

But maybe you are talking about implementation details in the specific
GPIO driver for Aspeed? Then I just missed that part, sorry.

Yours,
Linus Walleij
