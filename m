Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sssqG469ZzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:55:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=ansOpcGx; 
 dkim-atps=neutral
Received: by mail-oi0-x22b.google.com with SMTP id t73so3970972oie.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xzistCZBMS6pWKyd5h27EGFWUCVfSTYiEDFIvP+bERU=;
 b=ansOpcGxhStxy+63TD4ACtLx3q9Dcw7IBv2+GqK+KopGRJR3AsznEhxwozfVj/SR8L
 VDgzxVunxpmEY5tx2rA5mFKzyef/xBrmdTxI4ur4V7g+JzDbmlRQ3aFS13E+HXcqk/tF
 h4R5E+1z06OjvJ4Q1yc5xsL7fXGk8W3cnPsko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xzistCZBMS6pWKyd5h27EGFWUCVfSTYiEDFIvP+bERU=;
 b=Iec+tfSTItVbQkV2b5zXYms5bhkdKVTv5YfNB+QukK8I8xITJAX4jtaxQJoGqzAGcE
 LbkZiSQUYR1qP2P3ZnPAagSDq+s4LKgO/cOwuCrDymsz5t6RUfRQuIt0BWnxiAOpXR/p
 nvnwHlRk1PVzkoMdtFm4iXJpD4cQK3UlJMP0Y/0da6iOoOvJK21Sry5e+f9k06zDDhWW
 xcMXOxd6morYNDCqj8AQwlk4bcCJWQik56EGZOCjR+HeGLH/8x7QTwvCCXHr2xTM7vwS
 P1R+qZUNCY5vbZp6pzlwEK4KDavEr/uWEz1jWmEcAwvOt4LZn22lC6hxg/TyBncm6qH3
 DP7w==
X-Gm-Message-State: AA6/9RkjAIFfOydAMsOuUafmRIvWRHAOUgPY+7ovMxY2mD1DlQnivHIZ6KtgouHdy7JFHRrotczxWBvvbyWq9bfJ
X-Received: by 10.157.21.29 with SMTP id u29mr16462040otf.142.1476086102628;
 Mon, 10 Oct 2016 00:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.146.12 with HTTP; Mon, 10 Oct 2016 00:55:02 -0700 (PDT)
In-Reply-To: <a2fce70d4285ec2321a64a4f7145ea8a90d988b3.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <a2fce70d4285ec2321a64a4f7145ea8a90d988b3.1474986045.git-series.andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Oct 2016 09:55:02 +0200
Message-ID: <CACRpkdY3m3cMohOApQOR_xae4Hxfdrnqp3BpizYVgQ-YTTVppg@mail.gmail.com>
Subject: Re: [PATCH 1/8] pinctrl: aspeed: "Not enabled" is a significant mux
 state
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
X-List-Received-Date: Mon, 10 Oct 2016 07:55:07 -0000

On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Consider a scenario with one pin P that has two signals A and B, where A
> is defined to be higher priority than B: That is, if the mux IP is in a
> state that would consider both A and B to be active on P, then A will be
> the active signal.
>
> To instead configure B as the active signal we must configure the mux so
> that A is inactive. The mux state for signals can be described by
> logical operations on one or more bits from one or more registers (a
> "signal expression"), which in some cases leads to aliased mux states for
> a particular signal. Further, signals described by multi-bit bitfields
> often do not only need to record the states that would make them active
> (the "enable" expressions), but also the states that makes them inactive
> (the "disable" expressions). All of this combined leads to four possible
> states for a signal:
>
>          1. A signal is active with respect to an "enable" expression
>          2. A signal is not active with respect to an "enable" expression
>          3. A signal is inactive with respect to a "disable" expression
>          4. A signal is not inactive with respect to a "disable" expression
>
> In the case of P, if we are looking to activate B without explicitly
> having configured A it's enough to consider A inactive if all of A's
> "enable" signal expressions evaluate to "not active". If any evaluate to
> "active" then the corresponding "disable" states must be applied so it
> becomes inactive.
>
> For example, on the AST2400 the pins composing GPIO bank H provide
> signals ROMD8 through ROMD15 (high priority) and those for UART6 (low
> priority). The mux states for ROMD8 through ROMD15 are aliased, i.e.
> there are two mux states that result in the respective signals being
> configured:
>
>          A. SCU90[6]=1
>          B. Strap[4,1:0]=100
>
> Further, the second mux state is a 3-bit bitfield that explicitly
> defines the enabled state but the disabled state is implicit, i.e. if
> Strap[4,1:0] is not exactly "100" then ROMD8 through ROMD15 are not
> considered active. This requires the mux function evaluation logic to
> use approach 2. above, however the existing code was using approach 3.
> The problem was brought to light on the Palmetto machines where the
> strap register value is 0x120ce416, and prevented GPIO requests in bank
> H from succeeding despite the hardware being in a position to allow
> them.
>
> Fixes: 318398c09a8d ("pinctrl: Add core pinctrl support for Aspeed SoCs")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
