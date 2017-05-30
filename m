Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcnHh095dzDq5x
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 07:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iAZAs5PF"; 
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id f55so81186478qta.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SMIMIlRHckseR/T8skOof9YEVvnLA9k7bMw+jtNztOg=;
 b=iAZAs5PFUPcSZt09unK+9ABRry7uVTFHFq8sJ494a5oWFg1GSgX2xFb0GDe1EzNC5F
 Ahge98N/UJfcK3j9qBqHA0+qiwW/Cbd3mMIsxQGyMy1S8StdqykKoX2UU/F+WeJXHGWV
 RMRQe8cimSpRDITM/IIoJmDAVjqZ7DaUUwnZKkHyFhbxBE3XyGVnXvaqCxskdEuRo0Im
 tukaLS5U9GSn73sUIcjfBnV+5If4g2vAwrULMosVb4NUek+2EchZTii1p/qIoqkAMqRA
 LqHHgJvRVI0zBpZ6TY+j45gEHpZzdMrU/D+w9PSCpFGHwW4sxYZxl81toYctTED16UkP
 M7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SMIMIlRHckseR/T8skOof9YEVvnLA9k7bMw+jtNztOg=;
 b=TumwuNJsfOjzNAoB1t/GgCysgvYGmsLKeyfd8PEuoawXWw5Oc6uAA8+fHBQP29B7Cu
 jSXqrd1F6aI14gg+ZIKmY2ih58F6pfILZQlbuAjOcjVG1KJjR4h4UYemCSXdtpiDcvG+
 A0o25lZkD5w086cg1+i20C8L4gNquXqHmWe3Ajp8SACwM9ypzkZAAB0Y6QK1+T4UDHo7
 r4CV4XlCYlV8CJ4kT6aSlqv9EnqfuEu95eWLLDmOHOPIMNiFd/D4VgRACI7CeMBhuw5Z
 i231+OQoqbNJ5QqddHyxUoZ9LMMyLL8iuz2gfbhTdMufUza1aKN5tUT+EF0rGYPfkJMW
 gw0g==
X-Gm-Message-State: AODbwcD291dVoj69W2kvTykm1moTBAWqBOERst6E1ON43OccWK5frlJq
 NnCtUAfOPbqqscCX7x1smz5d0Vh8yrnN
X-Received: by 10.237.36.101 with SMTP id s34mr27312572qtc.137.1496180796310; 
 Tue, 30 May 2017 14:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.122 with HTTP; Tue, 30 May 2017 14:46:35 -0700 (PDT)
In-Reply-To: <20170530213430.vlxioxzzuzbjojhj@rob-hp-laptop>
References: <20170525064925.16867-1-brendanhiggins@google.com>
 <20170525064925.16867-2-brendanhiggins@google.com>
 <20170530213430.vlxioxzzuzbjojhj@rob-hp-laptop>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 30 May 2017 14:46:35 -0700
Message-ID: <CAFd5g45AXT0rJydYykh011JRm6cw=Tnz5EGfkQX1bddWW+SdNA@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Mark Rutland <mark.rutland@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-i2c@vger.kernel.org, 
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
X-List-Received-Date: Tue, 30 May 2017 21:46:40 -0000

Sorry, I wasn't sure. Will do in the future.

On Tue, May 30, 2017 at 2:34 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, May 24, 2017 at 11:49:21PM -0700, Brendan Higgins wrote:
>> Added device tree binding documentation for Aspeed I2C Interrupt
>> Controller.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>> Added in v6:
>>   - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
>>     what it actually does.
>> Changes for v7:
>>   - None
>> Changes for v8:
>>   - None
>
> I already acked this. Please add acks when posting new versions.
>
> Rob
