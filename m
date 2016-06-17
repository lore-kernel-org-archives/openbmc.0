Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x244.google.com (mail-qg0-x244.google.com
 [IPv6:2607:f8b0:400d:c04::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW8624ppTzDqhs
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:32:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JU8ClVYD; 
 dkim-atps=neutral
Received: by mail-qg0-x244.google.com with SMTP id 34so5119115qgf.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 22:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=eChvK+2vRy2/xxOijRVwqX35jNr9LinKDo8iqateSGw=;
 b=JU8ClVYDc4h3/iHkNzlz4xfKcWliBv0kpAW2CaEpWSa5dJPDhQEPOi0G+VBM+4zh0J
 7kNdA/rP85FcYQ0E9n38i98Lo8nsgrWh7P70DO8bOtGxWFUi5P2lRWwApSNHBbRQs1rE
 2KaEXnAgDtRsY7dLhadzXHv81/zIo/MdLasElMhEzf0rpN+j10mMlEUFCRd5Rf4w6zXe
 duLdnYvtekdTEQ6AK33khvqBfvtTqEUlrnzteRleYJuOP3VyxM4dfQYO5fXG+OKj6qBz
 a4s2d6Gkhcw3aJxbWhKbYn6NalGZVNStqujJz9rdb6ghnhijGDIf6WSMBSb8AHZBk7WY
 F2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc:content-transfer-encoding;
 bh=eChvK+2vRy2/xxOijRVwqX35jNr9LinKDo8iqateSGw=;
 b=L3PtNGbf1KCb6BdfaLmxp6mHqFwfzUsU0nGt22DuOJx2gdUsxSNrlMS2aLakpYVcKS
 vujr9LvlhmiU+LBQHhZo9x08BuwVzOx7WEu0WoE/VU8vICZpudakRA4TB0+3QfDBkdjW
 HGS/l88eo/nH6XcUs9gP4rgGK2OBbYyKy1CIMf3kBNprz88hnvIMX0VvBtTPOICvZWkx
 Q6fXWcRwSyzfOYKamJeJi0UJRY03yi7mrvb+fvq5YzDTZVSabhboCwtoMb4jkRO4A0Vh
 e9+lncG2AbzUVcbJgwd2rcNK3XgQej9ZQa0SuiP98PQmUM3+EQ0l2eTZEW4BMQMSS0Tk
 N45w==
X-Gm-Message-State: ALyK8tJjCjHFUD4bvq9E+rotpm1UyGjNy7cyVuzaY4lmVyfQIADhr7N2oazH5cgyg2xNKvBi/WyQy8vaNwtnLw==
X-Received: by 10.140.95.68 with SMTP id h62mr237739qge.33.1466141558968; Thu,
 16 Jun 2016 22:32:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 16 Jun 2016 22:32:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Jun 2016 15:32:19 +1000
X-Google-Sender-Auth: T3QCcdc0AQjHbkpBCq0DFbICRF0
Message-ID: <CACPK8Xft-LvtjE9gQ7a0WD+5kD_wLfOYiBfCjoytHD3huWg7LA@mail.gmail.com>
Subject: Re: Flashing U-Boot using DediProg(R) on Aspeed AST2500 EVB
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 05:32:43 -0000

Hi Shay,

On Wed, Jun 15, 2016 at 9:39 PM, Shay Slobodkin <shays@mellanox.com> wrote:
> Recently we had some problems with our AST2500 EVB U-Boot.
>
> Had several systems gone bad.
>
> We want to use the DediProg=C2=AE tool in order to recover.
>
> If you have used this tool, could you please explain briefly how to use i=
t
> with Aspeed AST2500 EVB?

I've not done this myself on the evb.

Looking at the board, you want header J70 is for the ast2500 boot
flash. It's a 5 pin connector on the south west area of the board. The
pins are labeled in the order: CS0, Clock, MOSI, MISO, Ground.

If you need further help perhaps send a photo of your programmer and
whatever cables it came with.

Cheers,

Joel
