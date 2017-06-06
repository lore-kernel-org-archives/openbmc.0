Return-Path: <arndbergmann@gmail.com>
Received: from mail-ot0-x231.google.com (mail-ot0-x231.google.com
 [IPv6:2607:f8b0:4003:c0f::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whknM41pQzDqLN
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 18:07:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMHw7I9+"; 
 dkim-atps=neutral
Received: by mail-ot0-x231.google.com with SMTP id i31so11543748ota.3
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sCAX7sxDXPhH3Df6scJbd4A3yqYCbejwpgUiWrKkM6s=;
 b=FMHw7I9+hvPDu7o7B93CPzQH6YqS6k1YSZeDfObcAQY1hOc+tYwObIMXBKb5J99sxp
 cNYfLzcFdjhduXYVxxt+8PZHucg0PxRxj0UJJdNlLZeVHmBum3WBATDWjV+31SqmamNy
 JaMQEX7W4AXVVSVr7C+NqNXWzii4hRvOlI5l7rPvn1NVmcLT1mP12Nrg4NSI9+y4IjaQ
 pCS9FnARvVQLGCE1pwwfdcNPFHQfcMrMTcMKVXZpUdRH1UmeRZWyGoi1sKLVoqkTJIMi
 wLjYzzO7qpWtLQrdjminVweGXlZIqG9aZuCN3+52cbBGwDbsqpq+tMcITide0R0tPlRU
 f/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sCAX7sxDXPhH3Df6scJbd4A3yqYCbejwpgUiWrKkM6s=;
 b=fj1WGgcdMVhZLocDmBXVkggKgBwGzLRRu+LTUAJp5UNsyDVPYGmAeNDs9Fc1ZKHXx7
 sgNm/qLlIHI/NxSYn/RwTwULRoYZ3v20JfS7Ytq4jiupthkSBlw/g2eUytAmu/cxvIu7
 CBaYhJ8vpgTkRl8UA3uUHObKxjsK/K/Fohj4h8BBX0/UMq05S48/oFs+r6XIFlI8Zm+W
 w3hlAQCrp947FH4+iqs2nailcqcgpcEEmO5nzJhw8EjbG2haxAgZn9dQTGHzWFpLT0QV
 3TkhWX/1nqECl3A9rpoWsO7k3uVvvwZImofnR67oQX04GkcexlvTVxXGDhRdmfenQLCm
 4f+g==
X-Gm-Message-State: AKS2vOw5nf1XvWPmSv+NnV8OO2Tb8wyJiw8eSKi+D+cavN4TkSDUEtI0
 ySTdj+LsgHJ6l7i1YJCWo7miiPN9Ug==
X-Received: by 10.157.83.29 with SMTP id g29mr4986339oth.20.1496736452890;
 Tue, 06 Jun 2017 01:07:32 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.51.139 with HTTP; Tue, 6 Jun 2017 01:07:32 -0700 (PDT)
In-Reply-To: <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
 <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 6 Jun 2017 10:07:32 +0200
X-Google-Sender-Auth: DHt3U3BYi8k92USDYzQE62DMZ4c
Message-ID: <CAK8P3a0BLCL8s+-iWut=himPsVUL==+jqzhDP92+NOPXEMsoNg@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Lippert <rlippert@google.com>, Robert Lippert <roblip@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Greg KH <gregkh@linuxfoundation.org>
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
X-List-Received-Date: Tue, 06 Jun 2017 08:07:36 -0000

On Tue, Jun 6, 2017 at 4:16 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Jun 6, 2017 at 5:16 AM, Rob Lippert <rlippert@google.com> wrote:
>> On Sun, Jun 4, 2017 at 8:25 PM, Joel Stanley <joel@jms.id.au> wrote:
>
> Yeah, get_maintainers.pl only suggested lkml. cc lkml I think.
>
> I'm not sure if we want to put these drivers in misc, or if we want to
> use something like drivers/soc/aspeed.
>
> Arnd, Greg, do you have any suggestions here?

I think the main question is whether there are going to be other drivers
like this one. Are there any other BMCs that still survive on the market
with an LPC slave port? The only other ones I have seen were the
old Broadcom one (apparently discontinued when Broadcom acquired
the Emulex BMC line) and those Emulex BMCs (now part of ASpeed,
presumably merged with the other product line) and some obscure
Nuvoton product I could not find out much about.

If we do expect more drivers like this, I'd put it into a new drivers/lpc
directory (which we might use for both slave and master drivers,
at least one master driver is pending merge), otherwise drivers/bus/
or drivers/soc/ would be better.

Between the last two, I'm not sure, since this still doesn't fit perfectly
in one or the other, but both would work.

        Arnd
