Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22b.google.com (mail-yw0-x22b.google.com
 [IPv6:2607:f8b0:4002:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtDBL0HV7zDq93
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 14:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ifqhHhiu"; 
 dkim-atps=neutral
Received: by mail-yw0-x22b.google.com with SMTP id p77so2487378ywg.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Z8OOw5oaKNY2u+TWsnw7mbH2/KUS5wh5hIjhuVnUgGY=;
 b=ifqhHhiuMxGmqN9y5tiUJ6DjDNwwcxGgJ4JgrBtXDRr4ydvmWcIbwlikksXdT10Z5G
 cPI25e6+VxeZ+WitIBHv5NrZoQglDgE/AP66VlK5Obg5kVCrlqPRU7WzbwrWEqgvc/r2
 leBmNgWl1GUj60Be9BUT4fblMpc52Qy9m/VH72CHIaaG7ntGXZX0IO2rC/bIFcAuxoOt
 ztnErD/b+8N6ED50xzQoclcgGJwjymMVSE7+cvoLP8l/lrVUOwGC2aS7+7dR5KIHkn+v
 SZbK+x0ntBoPc0KkB9WbNLU166O2uXqDSmTxqEy8D5lmEjtdKCCoibDUWw8jHU5G7nRH
 QR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Z8OOw5oaKNY2u+TWsnw7mbH2/KUS5wh5hIjhuVnUgGY=;
 b=lDljjh89txX08O7haZk7lnTwUakNsS9TN/bQ5b1etXw9RZ/AJl540qd0TUqzpZB/Iz
 AdWj/ikzG/eIRHbFNsotvqXWDq/nrbWBksem8N3r7o6f4lD3TenwcMlq4ZWX0T08Uwh2
 0KtyzoiTrtQjU344saUEIwCKg7ek7J6uMV2ZcYuTwOyLQh1wt1Lr1lv2Vq3WjYt22cBV
 dU/DUmsH+fvtvQ3Kzxb/LmcBdFa5z/cRPI5V3niQmt+1ICyAxJOONwFrV/TuwyDvj17D
 8fw4C87gGIrVeErc1Fla2e3Y5Mf8ddWGGeIsvqTVSHnuyTeXOELHfvPZus+Q1E0Tx0ic
 1Cbg==
X-Gm-Message-State: AFeK/H3eLgYCoDyE2sA5EGlJCiWjBO1Erej3goUiXx/oDs1KobTMG2pdzuT6I02fYze3qOD0/d+KC+GvOaj1hg==
X-Received: by 10.13.237.5 with SMTP id w5mr27283789ywe.56.1490758999395; Tue,
 28 Mar 2017 20:43:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Tue, 28 Mar 2017 20:42:58 -0700 (PDT)
In-Reply-To: <1490690751.3177.106.camel@kernel.crashing.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
 <1490682729.3177.105.camel@kernel.crashing.org>
 <ac565241-2806-67dc-fc34-7fdcc08d8a2a@kaod.org>
 <33bfcaea-ad18-3a19-5eb5-2f9e28bb6704@kaod.org>
 <1490690751.3177.106.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Mar 2017 14:12:58 +1030
X-Google-Sender-Auth: 9I19hyi7J5kAB-4bt8BFFiE_xr0
Message-ID: <CACPK8Xfxb3h578nSdwdsCFMSdwAdp2wOexdEx1n4kxnaDOsmzA@mail.gmail.com>
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 29 Mar 2017 03:43:22 -0000

On Tue, Mar 28, 2017 at 7:15 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2017-03-28 at 08:59 +0200, C=C3=A9dric Le Goater wrote:
>> > Sigh. is it that bad :/ OK. Let's do some tuning.  I will tell you
>> > what I get.
>>
>> so, with a large cleanup under "Kernel hacking", we get close to
>> 400Mbit on the 2500.
>
> I get that too with 4.7 but I'm down to about 320 with 4.10

Lets compare configs tomorrow. I cleaned up a bunch of options but
still was only getting 80MBit with iperf on a Romulus board.

I merged v3 into dev-4.10 after rebasing it on to 4.10.

Cheers,

Joel
