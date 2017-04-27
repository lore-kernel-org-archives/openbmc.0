Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD8y00NrszDqFG
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:19:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PfGAOji2"; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id m36so20136456qtb.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6IBTb/Ayqlxbzpf7LDF1szPo26eJCasUQVPFV4wB42Q=;
 b=PfGAOji24uKUb6MDwezvjJ4X+qBz8M3t2FTdRFKixO8mpDKCwRxFaMhZa9phrpP6RA
 ELU75BTA90nT3q6meQ0vlGZeuUrK3IiTKTxON10M5RjtrCeY/GP9p4nkI6T3YzcamtNU
 51YK5ggT36QdvDCOobq7VzdCA4OmzBOvr6LjWBLVg12X8w3TE0iznGd2SCLbzp1aZCB6
 Ox2PDT0sF8cP8A37dR1ijvuI2gApY5qtcqWTLAWn9jMb1+BrESmLytPaM/odnEroa/ua
 Z5Yj5G0HDvx7lYwExSrV2YyWx0tEJYhVjylw/GEIr6yQ8zwAmcODrhFVAanLEfNi7ME5
 YZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6IBTb/Ayqlxbzpf7LDF1szPo26eJCasUQVPFV4wB42Q=;
 b=pC1J7DCHo52c7T1VmJ75tKxTIA99c78VJ+4vA3QYmnDY/xoHPsXFIFLk+84sXZBMlO
 fNMzJsdR5vrpoTVrZDwzytgyi5tpjwq2xnO3A2+5Qqn8RvMrVk+Tbq1BeN68UK8E/ADL
 rhVFW2zEiItlwJWa5+PiJtSXLDQu4545n6pgDedbO1cBAUOdVd7qD3LhXHnXfknKInG1
 P3/uyw9KaTE4AZR1qeW5Wwb5IPWl6Gj7JlzRv1hY83UYwVw/ltj3v/KCibxaXdhebPYj
 3B13UlFjSR6rX1Olht7NzouVaq1kjlJSdUL6uUodJLcbMlax0CCI17TLVdE+eK2mADKH
 75dQ==
X-Gm-Message-State: AN3rC/6X6Ni2FwDduLrBgKsaZ8+brji4QAzfkqv1g0iMJC3wzb3MBidW
 48VMIraHT318U6o9kSu4V+0S9y+hzLiz
X-Received: by 10.200.35.27 with SMTP id a27mr3775809qta.2.1493281189174; Thu,
 27 Apr 2017 01:19:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.185 with HTTP; Thu, 27 Apr 2017 01:19:48 -0700 (PDT)
In-Reply-To: <CACPK8XecV7ffxhzbKJy_8D3jyieacCryHuoTV_r_MgRDv8XmpQ@mail.gmail.com>
References: <20170427072015.23334-1-joel@jms.id.au>
 <CACPK8XecV7ffxhzbKJy_8D3jyieacCryHuoTV_r_MgRDv8XmpQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 27 Apr 2017 01:19:48 -0700
Message-ID: <CAFd5g455k78EaV4ES5gssVcMhVr-6iO96kz4pGs9jReGoi8LEA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Update i2c binding
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 08:19:53 -0000

On Thu, Apr 27, 2017 at 12:35 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Apr 27, 2017 at 4:50 PM, Joel Stanley <joel@jms.id.au> wrote:
>> The I2C binding changed when upstreaming the I2C driver.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>
>> I've boot tested this, but please take a look to make sure I didn't stuff it up.

I will take a look at the rest of this tomorrow.

>
> Do I also need aliases so the character devices appear where userspace
> expects them?

Yep, someone asked me about this a while ago on IRC. I can find with
whom I had the conversation with tomorrow, since he probably already
did this.

>
>>
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 156 ++++++++++++++++++++-------------
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 180 ++++++++++++++++++++++++---------------
>>  2 files changed, 207 insertions(+), 129 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index b9a6730cc831..c25c5f839d58 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -958,200 +958,240 @@
>>                         };
>>
...
