Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHC8j5s3MzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlnolYJO"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id l192so5642510ybl.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WcWDk36ZczHjAkdwDxe+HveAGc+gfzt0INX2MyOX9ww=;
 b=AlnolYJOd4UXcTkasCZRNcCMus/AhXSiFMVdyzMkp13pHJkTiYskeeaqxgnR9T4/Ti
 Vv1AAMVfHWFLLg85Jbd8zVOYK/7d0VR24ihqTWu+mGZCcNkNvXkC7PBBRydKQ6J7qY/U
 3j0gIDsReh1VO7IgOyWQf3HOfiLNTGxUcZH4GO4LquEVyvWi6ZQhI8Ia2GOKULpYUN4v
 zY0XeOs9RucqksEdfoDh4I5GICY7nTL3+Ay9+BEIaD5KrbsTybdO+/l3vhFTWroSBcpw
 qqK6Ybrxs4L5Bcqh1eI+ib1gfXnVC0xK489iMJj1SEwNfQLWY8POdBxfE7WG48+G0KDN
 Dyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WcWDk36ZczHjAkdwDxe+HveAGc+gfzt0INX2MyOX9ww=;
 b=IeempqygeRHortD/jA6NY6gUi03e995w/NgH+bdaxFME7UvIPSaAZDslMONSxJ5WcV
 hLT3WN8AFl2l5/EAH2IFAmEbmvdLPJSOqV25i36ROGfcJA7hPrJJWwneI8hlnhgmVWEN
 v2mi5L91snEq+ClNhVEg17PAQ1pLjzcuBSid+hYEuK2C/GJ2OiU/iBW49yU90hVko3n0
 R5j9HbpaVHI+P9x/OHVxtu9yX/No90b2B7JI1HjfMSfu3rXnRg3N08WX6WmuYA88bJhc
 vxYqJSZaQkDO9HuFhfcWiLj7Akpj04qqRsolAm4CQPZMoTESU7YQMAJH8gHOXe4mb+RR
 2pZA==
X-Gm-Message-State: AN3rC/4gH1+zBgVHNJwiS/Noo2xkw4v/6XxZJcy5FobD/uQsShf3vhaK
 I14tk70FAiOQk9NzVL/GG86vizp7Og==
X-Received: by 10.37.31.193 with SMTP id f184mr23628897ybf.25.1493708979450;
 Tue, 02 May 2017 00:09:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 2 May 2017 00:09:18 -0700 (PDT)
In-Reply-To: <1493417524.77601.959872576.42A9BAE9@webmail.messagingengine.com>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-4-andrew@aj.id.au>
 <CAPH-5w4UOPOLhwduFByg0JcFJyKYoY04TRd5dMACdpg7OFy5fQ@mail.gmail.com>
 <1493417524.77601.959872576.42A9BAE9@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2017 16:39:18 +0930
X-Google-Sender-Auth: BShwT8LJ6xa7owk9PQ4tt2Ki3ao
Message-ID: <CACPK8XcjPhaR5Av-KZwFQ_D3qDrNeocjnL=rPt9KymBOJ_9W1Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 03/11] aspeed: dt: Add clocks property
 to GPIO node
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 02 May 2017 07:09:42 -0000

On Sat, Apr 29, 2017 at 7:42 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
> On Sat, Apr 29, 2017, at 06:00, Xo Wang wrote:
>> On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > This enables debouncing of GPIOs as requested by drivers.
>> >
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

>>
>> Does this fix any particular bug?
>
> No, no bug,  it's a new optional property for the controller so the
> driver can derive debounce values, which are specified to the hardware
> in hpll clock cycles.
>
>>
>> Reviewed-by: Xo Wang <xow@google.com>
>
> Cheers,
>
> Andrew

Applied to dev-4.10.

Cheers,

Joel
