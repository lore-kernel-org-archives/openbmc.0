Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxfFv0BqzzDr0g
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 18:28:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QO724rGl"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id r62so19578945qkf.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=i5wni73GaradbYu5LOZrsQP4IEG2knaa6aRCJXic/7M=;
 b=QO724rGltmFZx8lyoojMZWqlQS2ToZ4Mj62ryK48eV6QZCrUaRFpD3yC4jnBbpU/wE
 n5i5rsZlhgc1e3JMc5ofvi5vKwTdnPW1FxRvZqmplY+Y4rpfUs0VMoJ7kzblf0xSeXOK
 ZkjH/rqyRd0b4dE9kOCR4tFisGGB80L4Z7UYF6GtxK0et8GS49crZdAqYGz+3312KfEU
 VeT7/mDkNoz8aGHhXZbt/ajL0PrgPzKtfobQM91pfivwTdYfgyUb9w06nOsjt4727akI
 flIwcKPArdR+Zl2MMMNX5ChZigUK4birycfejnZOCJltGkQhVUsqjHaJB0FyeQfw5btX
 +tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=i5wni73GaradbYu5LOZrsQP4IEG2knaa6aRCJXic/7M=;
 b=eRqjxf9HdUcF29PGWCjHdSudQ10cF54fVtcJWV6Opse1Jn1v9i4+vOFJrzPCQaKX7g
 fRlo32Efs8dhOlCTWQPXQrOvusQ5WPUsUCeEy7o2w0VFyepAiaKgnS9oYP3ncBoOWD1p
 qKxqvePeGEy/ZovmIfBTiFSCxBIXaMsJTfGh6dkvYy2YDEbGfmPg9H/3qVLkqG95VFun
 WzGH1RHRil4rArE+wH+EmqiYNBWoMx+xjahqiv2K+CBnTfiYUxeXCeXsLC89umNiXFF3
 d27wubnKaZ05/ojTAKCrk2sRuWdHGbJJcNKbiSXC4oekuu6tDA1YXjUmTgDG0sS5ClqV
 STvQ==
X-Gm-Message-State: AKS2vOyebjvlIPPr28c5EfAmyZcYBy4srOuNijgXxBYP6YNqgI10V1nw
 VM3CkyPsyjMatcKYtE9cTE37QkzL/ool
X-Received: by 10.55.99.76 with SMTP id x73mr4671764qkb.219.1498552112490;
 Tue, 27 Jun 2017 01:28:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.67 with HTTP; Tue, 27 Jun 2017 01:28:31 -0700 (PDT)
In-Reply-To: <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 27 Jun 2017 01:28:31 -0700
Message-ID: <CAFd5g45=O2_MgfZEkmbY-=ZZY+izxeWSuhZT+B2e08P=O+WEog@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 gregkh@linuxfoundation.org, 
 davem@davemloft.net, mchehab@kernel.org, Joel Stanley <joel@jms.id.au>, 
 martin.petersen@oracle.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
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
X-List-Received-Date: Tue, 27 Jun 2017 08:28:35 -0000

On Fri, Jun 23, 2017 at 11:43 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Tue, Jun 20, 2017 at 02:15:15PM -0700, Brendan Higgins wrote:
>> Added initial master support for Aspeed I2C controller. Supports
>> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Applied to for-next, thanks for all the hard work!

Thanks for the patience!

>
> One question however which can be solved incrementally if needed:
>
>> +     if (command & ASPEED_I2CD_SDA_LINE_STS) {
>> +             /* Bus is idle: no recovery needed. */
>> +             if (command & ASPEED_I2CD_SCL_LINE_STS)
>> +                     goto out;
>> +             dev_dbg(bus->dev, "SCL hung (state %x), attempting recovery\n",
>> +                     command);
>> +
>> +             reinit_completion(&bus->cmd_complete);
>> +             writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
>
> If SCL is stuck low, how do you want to send a STOP?
>

Fair point. I should probably drop that in the future and just do a
reset, and even then, doing a
reset is probably just wishful thinking. If a slave is holding down
SCL, we are pretty screwed.
