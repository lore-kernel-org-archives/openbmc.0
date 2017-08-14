Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW1rH5gV8zDqlm
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 13:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9Ah1AWg"; 
 dkim-atps=neutral
Received: by mail-lf0-x22a.google.com with SMTP id t128so34867145lff.2
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 20:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OKiSARMDRMpxxx6Voooiy667hsqAhpxMCk6zKp/leBg=;
 b=W9Ah1AWgO4w8AQ9gJ33IJGX/6U8WzuC4DsGo7q/x9r33WFl/3tShmdKXNmnpPbX8t0
 9tczBWgT6KtKSdLnwBiELk7a6xdp6KvNP31hXsUvFqn/jKrYOn6hi+LpnrNBVIK6ic+b
 OqDfw51WfuBumQmsOcXuTf/chvmVuiumbv35MsDFWhHO0/hZ6MyrNidyw8KJA2UJrRHT
 pRXjw2qsK/sCAnuss7hbiyZb2AcjPYvWOZNkTMv3Vp42WyOGZr8UDGsWjqDsnYFKcuIy
 OX4ZpRILRPxbnUMM1ASp7Rrk6JNyWraQs+r7qxsqOzVO93ZgUpDivGOm4qzbhRoxymt5
 E+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OKiSARMDRMpxxx6Voooiy667hsqAhpxMCk6zKp/leBg=;
 b=RhCDNnpSY5rlEEXvBEiQtTLDQZw+S6N2sBgOm7lnNOjBSl7TOeJaUjHlkSa9kEXWmH
 I3fwp/6lXmqodvA5DHnpP3tN0JcVodD4T3FGWynZp4SMiKYm4qMQ8lk0c2Y286I2L/8a
 vf4TnnF/MaswSmB7GbBKgrNQ+MHZPXav1eGk1il/maicG2HZtX3g8hJtLJWjAq/o4joO
 AJsDDFlwYQyVsauR+WxIyExpwlcveeiJM+XDHvGjCxtsF5MkSm7SVhLTY892apbQIFIg
 tLnCJaeFTpeH2IaquT+Ur727rSOpRVdQ1JytWPbkQObKjwxOTgSzgaVtEoZu/HPgQz6q
 hWhA==
X-Gm-Message-State: AHYfb5iiIg/jZpz87+Anczc6CZd1W+s+PNtUiCJSXM1qtSqzxYTmT3RW
 qeK7nEW+UceGm7SRytD0FuojaA78Ig==
X-Received: by 10.25.168.3 with SMTP id r3mr8132587lfe.111.1502682699458; Sun,
 13 Aug 2017 20:51:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 20:51:19 -0700 (PDT)
In-Reply-To: <20170812113250.iydbbggbcvfvhxyo@ninjato>
References: <20170729010012.5032-1-brendanhiggins@google.com>
 <20170812113250.iydbbggbcvfvhxyo@ninjato>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 13:21:19 +0930
X-Google-Sender-Auth: 1sRSsbBVuL2egod4aPdqQw9UFsE
Message-ID: <CACPK8XfVrsg1KyxQBRJZf4Qn6mZaL2XPDMUwFoKgEAYL8SmP_A@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: aspeed: fixed potential null pointer dereference
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Brendan Higgins <brendanhiggins@google.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Patrick Venture <venture@google.com>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Mon, 14 Aug 2017 03:51:44 -0000

On Sat, Aug 12, 2017 at 9:02 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Fri, Jul 28, 2017 at 06:00:12PM -0700, Brendan Higgins wrote:
>> Before I skipped null checks when the master is in the STOP state; this
>> fixes that.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Is there a suitable "Fixes:" tag for this?
>

The driver was introduced in 4.13, so we could add:

Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")

Cheers,

Joel
