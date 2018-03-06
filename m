Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rMZf7X2c"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwcn94b1SzF0nY
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 00:19:25 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id v6so21997451iog.7
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 05:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X1GqLJSs70mU+Hi0nCNtIWkAnuFR5UYUEq2exZOJtPA=;
 b=rMZf7X2c9+voEskv2XI45zwW9jaDiBVOefP9ltl5jnCUbBA/oi5vdyS0nyWcaO8M72
 OiglGufzjWoDtOVRs55lQ0DsbfPig1mqaxxrDxJX+RL5ihb7AIi2Ylv/BpftwWlAjMi5
 b4Y0Rn9C0WV55PUzsqqPLmjraAj/sXPPBqnP1Dze/pTmgKIhd7QyjZGAAmTz+QLEFCmb
 mWxcoQH5ERTPrUGkHbtvUtymdxKYNp1LIphYlJeEisFlAmU2BHUe6fipW91rzht4yUGZ
 4KGIQu28cV543Mlhi/zjE5v/UyS4KJMrTPS85j4dYOxJLA1/m5mBdM3oP5oEqoUyKowc
 EnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=X1GqLJSs70mU+Hi0nCNtIWkAnuFR5UYUEq2exZOJtPA=;
 b=e33+vlCO/MXAA7Bdf4cTzZ8ZcAVVhw9LuhlbfmhczOauM+J9qo6nZL7egUAZ87Nh93
 3vrl/gsxOTrlOpUlxyTRycv57NIDErO58wBIB596n5U31RdMQpJyh/gdLGfB7gsgj+IU
 dc1lcD8AJSe46Zk4NtTVYDJo/oVnSpNfJqYW0LuBj9835xoJv7Ccy45j0FgH89m2uzno
 UgnxipR1GwXLGvg99qc9WXupTfy2KOWMdsHtZv/Up3uADlVO4iqkFpARtV188BSt1BW9
 txNjbrBcUEJ1IO+qfJ+ShL1L2fke7JWWGHe6dbYAtKcjYdyuyWOJ3xFQ4yN8CN0wtfkv
 m2/Q==
X-Gm-Message-State: AElRT7Hch97jLSOSehkkxnlY/+DyYxaEa5Y6C7hdnxj0wv/0ABT+K3sI
 74y5yu5X+MDWvSnPzaNdVp0tgb2vZd1rsS8ZQaM=
X-Google-Smtp-Source: AG47ELsf27hNfo36p0U4aS7dNaWzr9ZebAUD/lJS5I3YZJeOPCb6zk2KVAlNLA8n8bBIFlaxtxI5oTazWmGqLeBElwc=
X-Received: by 10.107.97.21 with SMTP id v21mr20881266iob.22.1520342363331;
 Tue, 06 Mar 2018 05:19:23 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.79.34.71 with HTTP; Tue, 6 Mar 2018 05:19:22 -0800 (PST)
In-Reply-To: <20180306130551.GA16061@amd>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <20180306125416.GD26143@lunn.ch> <20180306130551.GA16061@amd>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 6 Mar 2018 14:19:22 +0100
X-Google-Sender-Auth: EEox9t7UDbbxxPcc3i00QRynH-U
Message-ID: <CAK8P3a2VvaFMO6jsx09ukN+=tj7sRZ9mkYGcSRiO1Fe6==sJ9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
To: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Lunn <andrew@lunn.ch>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-hwmon@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 06 Mar 2018 13:19:26 -0000

On Tue, Mar 6, 2018 at 2:05 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Tue 2018-03-06 13:54:16, Andrew Lunn wrote:
>> On Tue, Mar 06, 2018 at 01:40:02PM +0100, Pavel Machek wrote:
>> > Hi!
>> >
>> > > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> > > ---
>> > >  .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++++++++++++
>> > >  1 file changed, 73 insertions(+)
>> > >  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
>> > > new file mode 100644
>> > > index 000000000000..8a86f346d550
>> > > --- /dev/null
>> > > +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
>> > > @@ -0,0 +1,73 @@
>> > > +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
>> >
>> > Are these SoCs x86-based?
>>
>> ARM, as far as i can tell. If i get the architecture correct, these
>> are BMC, Board Management Controllers, looking after the main x86 CPU,
>> stopping it overheating, controlling the power supplies, remote
>> management, etc.
>
> Ok, so with x86 machine, I get arm-based one for free. I get it. Is
> user able to run his own kernel on the arm system, or is it locked
> down, TiVo style?

In the past, they were all locked down, the team submitting those
patches in working on changing that. Have a look for OpenBMC.

       Arnd
