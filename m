Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfXxy19WXzDqKX
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 04:37:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q+HueaLf"; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id c13so65697384qtc.1
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VxkE/KI+OUhVOLHcXWPjmwDaj+P9Q/eCruqFJlhOULQ=;
 b=Q+HueaLf70Xrzg70HN+b3wWLLWikBmmFYcQZMVlLU9mxSCjaOWRwi1FGzAxJU/VCRf
 Fka9E10gKsUeJJEtv2jaxHDorOmJ0aksoIEImgNpboUriXQCF855GItlnPsuRwWMxJZi
 wp3DDUfROJVlMlWUICpVGvf6+uaP1T0dhqycHC3Ul276ZgY4kfv8dDngAeQaCBvA/Nrx
 1Szl4SA6kzTlJPlh5WdvrEznCEoZeU8VjqLlZe6U8qHUckCuk9B+I3R4FbtYdTa1SzW3
 DTk1K4h61WX3Un9ZYl34k9x/ngAjNbE6inXK7XAz5wZi5IRda6DMoUV/V3c+H86veSNw
 pFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VxkE/KI+OUhVOLHcXWPjmwDaj+P9Q/eCruqFJlhOULQ=;
 b=rs+CrZN6nuzsCUEvfs7hjYqRx4UPxsYaK1SzTmTVoMUoOzqvxL9BGpsp9vpWHk73U5
 Unk0rk1ndLOvolNb+A+2T74pvOcIB0brepe6qELCToBRHSUxLYJqOH4T3z7FTqdq5SIa
 TbP9DNJxay+Qf7I5wH6tGN+AyvZKesvq4vEwNaXR9p/y7LaUWiz+T3+ZkjTR2Qzky8OD
 M+E6k0OrTWMl2RZVU3ypOI6N9FpXiwW36OuqjGq6uUQ74vNgLWAOXmSINDedsrRxqYSP
 pkLSlXh2PgDpqi7TPb422Lne8ZYekm/9fNG5dmhG5P+sN0E60vkyqJU8doNfb8kzrzCx
 SbNQ==
X-Gm-Message-State: AODbwcAUkLzxazUcBfq2bYUPO38rWFsY/x4mE61vXp3vbMAFP+Lgk7e1
 13jmjnkQx33lP3i+lnj6kMQXKRlxOrxk
X-Received: by 10.237.36.101 with SMTP id s34mr10495551qtc.137.1496428643703; 
 Fri, 02 Jun 2017 11:37:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.73 with HTTP; Fri, 2 Jun 2017 11:37:23 -0700 (PDT)
In-Reply-To: <1496405090.2842.5.camel@kernel.crashing.org>
References: <20170602084603.30811-1-brendanhiggins@google.com>
 <20170602084603.30811-6-brendanhiggins@google.com>
 <1496405090.2842.5.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 2 Jun 2017 11:37:23 -0700
Message-ID: <CAFd5g448cSQnGnhNegQ4+u5tZ_n1ndZQVpZexMYS1RBO2bzyZw@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] i2c: aspeed: added slave support for Aspeed I2C
 driver
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Fri, 02 Jun 2017 18:37:27 -0000

On Fri, Jun 2, 2017 at 5:04 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2017-06-02 at 01:46 -0700, Brendan Higgins wrote:
>> Added slave support for Aspeed I2C controller. Supports fourteen busses
>> present in AST24XX and AST25XX BMC SoCs by Aspeed.
>
> (Not an issue for merging)
>
> Have you looked at a "mode" by which you implement just enough of the
> slave support to decode smbus notifications ?
>
> This looks like it could be useful when using pmbus devices, as some of
> them use smbus notifications fairly often.
>
> Today only one driver calls i2c_handle_smbus_host_notify() (the Intel
> one of course).
>

Although I have not thought about the exact thing you are mentioning, I
want to implement a number of other features for the slave. The thing I am
most interested in is adding support for smbus alert from the slave side.
Nevertheless, I wanted to actually get the driver in before I start trying to do
interesting things. As it is, the slave code satisfies our current purposes and
I do not know of anyone else who wants this feature at this time.

Cheers
