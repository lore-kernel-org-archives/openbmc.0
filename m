Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZfkNS8qR"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41H9w51yd8zF1f8
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jun 2018 19:15:00 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id o5-v6so909196itc.1
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jun 2018 02:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0u8pOeiXOTCrPjIEN0/G8B2FoRAzc7uON2Lb0bNng9c=;
 b=ZfkNS8qRmel2kNInLI4kJPiTvG81DgElQKZYYyJCW685P/iQE8uJTBxt+F/ixpxszj
 BwlMr6BVxGrhKz5iNqTzRYlmy9nSyHamDZUEbMxMm2Ir63svgtcFyCcEvRz9Ua7P+iey
 gIfRwLyUz8TDe8SQn41rvV59tplucpBE8SEzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0u8pOeiXOTCrPjIEN0/G8B2FoRAzc7uON2Lb0bNng9c=;
 b=uLcrlZHoyG2vpvqvCH1eYVNeRvdvrY+O9NtBdzYonUa/NeI5qX2XKjQ3piqpmgatBw
 JkaRGPpqzNRgaL3RA6tJOvSNpua0pIPapj56MMsT1dRvYElAI6VwKwRFSLRh6wDAjalu
 hlkq8QDdVCWoOS3nkifsBRFJNk5cFuFIhEXQegyic+gnG23zAfL42aqMj/p5DQiCVJhJ
 WLUUGPA/ekB//h6Go7ls3qAbHnoT9Z1dILpXJRxRmEhJTe0xJnrdbelnhCsbxahYO82b
 3JMYGBzPVIakdj/St8LKfBrUPOgV28A4/ICLlIhyUY86EltPRCAyaBSxGGYQYrHYQGDO
 dGiw==
X-Gm-Message-State: APt69E0sW1ifB9xnHx9vryO4NSShQ4upgeQLZiZzvKsdeofGK34r118E
 2a79mlT7O+qNmKHrD0TBoiBWSFyUt0UWgiEQz769Yg==
X-Google-Smtp-Source: AAOMgpdvK+fpb7wjBzP3043BNHZ+jhfQPXqT4NvXXeLY3i4LXvwcFYd3uDckbZxY4O+2Up12wMv7N4CVp6yKGCJiCvw=
X-Received: by 2002:a02:597:: with SMTP id
 23-v6mr10870244jal.112.1530263698455; 
 Fri, 29 Jun 2018 02:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180622043134.18238-1-benh@kernel.crashing.org>
 <20180622043134.18238-2-benh@kernel.crashing.org>
In-Reply-To: <20180622043134.18238-2-benh@kernel.crashing.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Jun 2018 11:14:47 +0200
Message-ID: <CACRpkdbhxjahYaVnQN0xqD0NLPouO8VCW8w-GZD0sbLFtFtY5g@mail.gmail.com>
Subject: Re: [RFC PATCH 01/14] devres: Add devm_of_iomap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 29 Jun 2018 09:15:02 -0000

On Fri, Jun 22, 2018 at 6:31 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:

> There are still quite a few cases where a device might want
> to get to a different node of the device-tree, obtain the
> resources and map them.
>
> We have of_iomap() and of_io_request_and_map() but they both
> have shortcomings, such as not returning the size of the
> resource found (which can be useful) and not being "managed".
>
> This adds a devm_of_iomap() that provides all of these and
> should probably replace uses of the above in most drivers.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Ugh I just feel I have seen homecooked solutions to this problem
a few times :/

I wonder if it is easy to find these cases and replace them with
this neat function...

Thanks for doing this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
