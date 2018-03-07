Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::232; helo=mail-it0-x232.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DJMjjIOk"; 
 dkim-atps=neutral
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwxfW1BcBzF07w
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 12:59:42 +1100 (AEDT)
Received: by mail-it0-x232.google.com with SMTP id w19so14604183ite.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 17:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8kazBbBVczXRK0HyAumKG1W3jQRKZweToxkYxdTFL2o=;
 b=DJMjjIOkIhEKIF1kVu539EbfbrA+44m5J9+mPJZB5w18o+qmP4ARGwvE+rXEhgSdMs
 m+WBe0+G8sdWy+J/1Xc7imPUr5YJ9HckXRnQ/sUDf37fcNAwn5mfWK+CcdXAPsC2t7A3
 6NAI3ThgL7MtexB6qbMInm47A4QRNYiJwutC0svLq3p8UPyFv5UXpiiPjrGtG1Ghgdsf
 aw93tssfRI2sjibKa3CXLEi86vGIveYUSgVXBIKQ5dPloTnrzK7S79vwBMj2sM+YTghI
 qIZ/Zgqqtw8yqTdKcnSe6+xn/S31mYiHjbbAwHvPXhF3uJltqYQtwXN4CcQw9UWhWVmb
 vAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8kazBbBVczXRK0HyAumKG1W3jQRKZweToxkYxdTFL2o=;
 b=APd1V9hJUQezDHyLTzWQNLI+VyI5k4vq8GpBceulhc+Yqhi3JL6w6PPfu0NOmFD3g7
 rwmLrb84jWLAXKseV42vGlMxFYoc/omuXfWeCXZjCzJjTf++TqUdzsvr2ckWGUItqZ0t
 58cXDlefIfOyD4ayEevnCNxb2kWmOlcBoRP1QqucdIzccBAz0+yKTJJr4RzakB08exTN
 +6mnf0QTdFn33BwRfYSzJlVm7f5fvZq0RsboefZzNlyg0iyCDaw8mKMkFPsd1O9e+7RP
 yK7JM0izvT/YL6owDQ/UkqWCt9lHAm4D3a4KCmkIkvruMmGr4dQ5e3ZOaeuPXUsElry7
 6vZQ==
X-Gm-Message-State: AElRT7HUt2+kZdO4x/TVGO63hJ0zFPHEsRLaBcwoon/U1repAZZELpMo
 l1SnsK1K3Or7kg+nHNktCYPE4bDLkWi5J+5QQa8QRZkx
X-Google-Smtp-Source: AG47ELsHw94A1mPCPAbFxhxUKtsgVIbxjlSZ+a3kW19AHyrd/m3PyUmFB3qQVWivZDF++OffAMJQhLqHckhPYuzKe40=
X-Received: by 10.36.54.144 with SMTP id l138mr20756067itl.14.1520387980893;
 Tue, 06 Mar 2018 17:59:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.146.18 with HTTP; Tue, 6 Mar 2018 17:59:40 -0800 (PST)
In-Reply-To: <1520377773.2464042.1294034000.3560A4E9@webmail.messagingengine.com>
References: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1520377773.2464042.1294034000.3560A4E9@webmail.messagingengine.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 7 Mar 2018 09:59:40 +0800
Message-ID: <CAARXrtmXGvC-+gCqKr0LchjMwQvC3_xEdRnkU52iXdUXwoS3uQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Prevent reset and enable if
 clock is already enabled
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 01:59:47 -0000

On Wed, Mar 7, 2018 at 7:09 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
> On Wed, 7 Mar 2018, at 06:54, Eddie James wrote:
>> Systems are seeing some issues where the LPC clock gets into a bad state
>> when the ASPEED clock driver resets and enables the clock during
>> startup. The LPC clock (according to AST2500 spec) is enabled by default,
>> so resetting and re-enabling is not desired.
>
> Well, maybe. Why do we have to avoid this sequence?

This change is based on the finding of
https://github.com/openbmc/openbmc/issues/2948

>
>> Add a simple check before the
>> enable procedure to see if the clock is already enabled.
>
> I don't think this actually solves the problem, just papers over it. Can we solve it properly?

According to Aspeed spec, the rest sequence should be done when the
clock is stopped.
It does not mention what happens if the reset sequence is done when
the clock is already
enabled. And from testing it shows the LPC is having some problem in this case.
So I want to make sure the reset sequence is done only when the clock
is in stopped state.

>
> Andrew
