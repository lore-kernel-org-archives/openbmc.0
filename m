Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh2Dq0dGqzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 14:40:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RPJizLuk"; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id r66so30053948yba.2
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 21:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8/K9ACZCXymcjtqSabs+vgQZTKzQY+tLqJFZYyPq7lc=;
 b=RPJizLukk1UYa7ty4bPDhSmg0IC3nNd/uDa+5xkkFdBHjvqutK8F5rHv/77kgm9/IB
 IbwzRWzIfebPJyiiKn36GWU+2/LCqnU3eU4IyWaH/D3VFktn0x0nP/ZGiQogsDBMy2+t
 qYdhY3jlXJ6hwvAWNhgkMqtBfPsTroH0dnp1FdH3x6hiaxNH9MRo1zv63UQ9IH4JjLq8
 nghGd+tchEuru76HAYUFf2t6HNRlrZJQ7W2SJBl8bikkQWRt/Y+Wg0O8a++x+l2nSspg
 tS32QT3FGpWg5PFa6Qu35TJ2o2wauCpdFMdwHZMN+eX7BmEqUHw3IbkdcvZp0upO92Z2
 Xxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8/K9ACZCXymcjtqSabs+vgQZTKzQY+tLqJFZYyPq7lc=;
 b=QDZyzrbg6hqb9RNg2xb+YRPJ55z5ugdrPZLODNkX8FRRJhV8xFJincmBuoimBQbEWI
 LspxoNIz+N7Cljss1Mp+MiE/sOPDzjBOUsefhcQtYsgjMUcisj2uq2E+Gm5RxToTWA7H
 ASnn+DbCJtrWNGVBdenYlptMyaSGCBIG183ZK8vRK6hDxsbN0B6grEcYskrN7lh238GG
 0jJwQ/UdYqfE3Y77Wob/okvNpOlGa1YzEM1DKNdfzk1EpZjzezrq/R1EZabUb5kzh5yN
 LePz1WwuPoS+oKLhJLFFDRmw+woBVxuLbnt9Qcfz+gZtRUdTPpugrJDi0DIuRSlzWy2H
 9QMQ==
X-Gm-Message-State: AODbwcBIMp0O1E1Y1S9IbulCpfREScrfrLMsISL8z8vZLoa4ZpIME0pP
 LXSCdGrlhEQ+26htbfeePTgC+sOOaA==
X-Received: by 10.37.202.140 with SMTP id a134mr4328334ybg.182.1496637624601; 
 Sun, 04 Jun 2017 21:40:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 21:40:04 -0700 (PDT)
In-Reply-To: <20170603012952.2192-5-brendanhiggins@google.com>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-5-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 14:10:04 +0930
X-Google-Sender-Auth: wt3Ukg6df5UcAxWwc5jXjJeiWF8
Message-ID: <CACPK8Xd51-pi=HT7XO9_D65__=mGqJiqMex6mi=qd_90An=aEA@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 vz@mleia.com, mouse@mayc.ru, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 05 Jun 2017 04:40:27 -0000

On Sat, Jun 3, 2017 at 10:59 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added initial master support for Aspeed I2C controller. Supports
> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I have also tested this on an ast2500evb.

Cheers,

Joel
