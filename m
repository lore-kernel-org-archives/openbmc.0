Return-Path: <sjg@google.com>
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72VW56VXzDq8V
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:11:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HhWOlF2v"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="EuSnkP3j";
 dkim-atps=neutral
Received: by mail-ua0-x22c.google.com with SMTP id f10so5196609uaa.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8ouOMGmSTS7l7qWqq9UMuIZPHftfylHmpg3qkGjPL7c=;
 b=HhWOlF2v3obSmgXRS2a6DLjBvXP7zRG51zLSsmhJFWn54mtMDB2PdJNcC0xUXNE4zw
 6XCg4I7ODyzun5B+NLVzSMdtrJ41n6ZK3Z8DP1JI105QcVYvJV3KvYU3VXtLnzNiFB0S
 kaiD1kJ1eBfsyZnNZEe5fIHjPh9mjFDw2/I5HfIYBH/YWwxYJBZb9JbSU9QdDdig0Hzs
 HoeIyADGRq5wFMXo2kx2VfRklvJfY7B/nHz9dYq0j9bYKzy+unLOgAHaAXNPEI4FpPKS
 xbcRAXfRzE6hMNEjx7jqbL9ArxqHZJGkIo8ZH89Pl+NkgB83zLm6tDyc1EH2F0fghqf/
 D1AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8ouOMGmSTS7l7qWqq9UMuIZPHftfylHmpg3qkGjPL7c=;
 b=EuSnkP3jIxKZOaqId5+Ni7vDX5SQcX5RVwkMSxLAuV5HfB1ET5NwH7oiSOEcu7yhvH
 /QTYn8BOtpvfGsBHMnYTdeG2Q2s3gBBXnWT0Z1zlK4cMl1oz1TyuJ/G9/rO6y3Bq6TTu
 LSgZx4MlVOTE4CXbi9RJJJO27lU92nfpU6MpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8ouOMGmSTS7l7qWqq9UMuIZPHftfylHmpg3qkGjPL7c=;
 b=SvdFsu9PMf7ty1q8aSbX/CBUouO9Evh4VRwZnaxt1R6mcSkSdq3Oc+enDoCNAUAoat
 UzQ7IR5y+rphCIBARdXGDIgKj2Z+IX5cDbxvdg2XmWUhvRKydCZuxAw9wRzONdxUgj37
 za0ipRnmt+xmc+3OVvVgHouh/2IEaRYo2soYqCZaocJ30UvdLt830UZB4jmsfMv/ZK/n
 X8js2lC68A54Q0JVksNGD7jc294DDA+a1SbGT9ig8l3nTRXpgcxRpNP8YHZXKHEtJ86h
 EOoubbU+KPXXoS8EBxyigHMqUhrhEtAXbNTd0nkq8CtRvWZLCSuQqsW3PxtIBet1Ld9f
 vLng==
X-Gm-Message-State: AN3rC/6cMNJgwbfGqamksr82SX5jmPFyyn4IEfzhHhYGB5S6fhtzIJJE
 trLNDEtMrcjCRjv5tzqXMfdzFH0cyw2Q
X-Received: by 10.176.79.162 with SMTP id m34mr56562uah.62.1492560705398; Tue,
 18 Apr 2017 17:11:45 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:24 -0700 (PDT)
In-Reply-To: <20170417190034.71945-2-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-2-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:24 -0600
X-Google-Sender-Auth: 7jgTxZ2CEMdlduzkufJJJ5pziOI
Message-ID: <CAPnjgZ249fGjS2h3xwxEG52qqYa1MuKZOEuOj3pKcnj_jbeZTw@mail.gmail.com>
Subject: Re: [PATCH v1 01/15] aspeed: Update ast2500 Device Tree
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:11:48 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Pull in the Device Tree for ast2500 from the mainline Linux kernel.
> The file is copied from
> https://raw.githubusercontent.com/torvalds/linux/34ea5c9d/arch/arm/boot/dts/aspeed-g5.dtsi
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
> Changes in v1:
> - Added link to the original version to commit message
>
> ---
>  arch/arm/dts/ast2500.dtsi | 881 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 880 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
