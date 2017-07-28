Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJWm25v1LzDrLw
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 11:41:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOxp61iI"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id t139so5321067ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 18:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mVhAb8x1hLsP3ZsGn0yv/omGlh3SYwokmrMCa6rtiiY=;
 b=FOxp61iI+ClMCE/2uYf/C9QPvakl+uo+lgyZJ9ohaAtJqwfeJ3gY1piUGf1raA7lph
 9UdS78+NLtLJ8uvekbw+Fofc3T1F3rdEmkOrPb2qqbbwTEUc0vRU+LTGEHe5rQeQBfOn
 Vk6F72CB3VxgvSp/dp3Z2vCJL3f3CktxmXewaQge66Sg1HKWCmgIlSX01zFYUtC0I0uS
 KbvhlpbnmCbsmjgzzLVAYSLb6i4H+94LEUvX1YU880Ahc4CzLj78kf1dPLI15UffE8PM
 V/48ZyPiMOZASSKb6dciGUgJJ7gxItDbKrj2TosutOywD4AWEz2dHfW0kXTAOSaIwmgR
 +Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mVhAb8x1hLsP3ZsGn0yv/omGlh3SYwokmrMCa6rtiiY=;
 b=X1G7NY3I06AXvbD87IJWFPthyuXhg9yI++En9pFRhSKoiWeZ9N7iI8bu85trAWFY0B
 o590ur9bEo1v1n3R9dAwH7OOzFwh0O83R9acj9tYQRAsDlYL1RSsdOJd1mMehBu+jE2q
 frIGdLxc4rwfKyl97zd7CSDPaaJ7GQFdDng4VghPJtuFBVlCMlZZqX5HYOhZRVkj3Sgo
 8gR2P6z9OFio24DXcLDU32HpG5LBodw9nRaIb4y5w2xi/G5zoxdZg09dC1fdoJwgt61u
 THxu5RV70iXzcr0pirAmOXw2Ay0omrFKZOitHrBppBzYdo6PP0cOVoSVNGeYbuGGZ4xZ
 TPzg==
X-Gm-Message-State: AIVw113P/ndAiqKErIayBHaJ0Am/2USLGZAIyV4VvpiNSGQJ13mSekC+
 BK3K/PEVnje2qLD/+6ZGSSz+0tf4qA==
X-Received: by 10.13.199.195 with SMTP id j186mr5600128ywd.41.1501206096026;
 Thu, 27 Jul 2017 18:41:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 27 Jul 2017 18:41:15 -0700 (PDT)
In-Reply-To: <20170727101647.26960-3-andrew@aj.id.au>
References: <20170727101647.26960-1-andrew@aj.id.au>
 <20170727101647.26960-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Jul 2017 11:11:15 +0930
X-Google-Sender-Auth: 1avbuleUwVyHVNSP1NsN0TwVdjQ
Message-ID: <CACPK8XeAF5bDPbi6Z5MOv0d-xD8Fj2YyVSNFdVa0P4o32FYMYw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3 2/4] dt-bindings: watchdog: aspeed:
 External reset signal properties
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
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
X-List-Received-Date: Fri, 28 Jul 2017 01:41:39 -0000

On Thu, Jul 27, 2017 at 7:46 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> For the AST2500 and compatible watchdog controllers the external reset
> signal can be configured for push-pull or open-drain drive types, and in
> the case of open-drain driving, active low or high.

In addition to this we should document the pinctrl phandle: the fact
that it exists, but more importantly how that interacts with the
hardware.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index f526b003b2e0..7aa885f620ef 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -36,10 +36,18 @@ Optional properties:
>   - aspeed,interrupt:   If property is present then interrupt CPU.
>                         If not specified then don't interrupt CPU.
>
> + - aspeed,alt-boot:    If property is present then boot from alternate block.
>   - aspeed,external-signal: If property is present then signal is sent to
>                         external reset counter (only WDT1 and WDT2). If not
>                         specified no external signal is sent.
> - - aspeed,alt-boot:    If property is present then boot from alternate block.
> + - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
> +
> +Optional properties for AST2500-compatible watchdogs:
> + - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
> +                        drive type to push-pull. The default is open-drain.
> + - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
> +                          is configured as push-pull, then set the pulse
> +                          polarity to active-high. The default is active-low.
>
>  Example:
>
> --
> 2.11.0
>
