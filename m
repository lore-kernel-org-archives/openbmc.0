Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdrNQ51kFzDsgb
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 04:08:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=NT/y752t; 
 dkim-atps=neutral
Received: by mail-vk0-x229.google.com with SMTP id g9so36778387vkg.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XZSJi+luSZMg7G1Jaz7xKY1fzHTS9UKAs0WBx3Tw/sM=;
 b=NT/y752tKpfMFdsRvQO98mkkPK291W28EvRW1j9hNDuQtKbJlTe1iB0GT9lYFLvvAO
 TV/V1QMV4HX1HWU1Pj3wI0VQoBnHJV+bLoABM/F2/j+vCMBFEaECjrry8VkM3isClIkC
 n9/IcUtKn7Vw6WRo39SOMVwqh1Z6xuLxzr+X9WgKzTOiC2WmWFUP7lefeiDvtKwIEvWu
 7aPqxh94Gxdg9wAAfRTNq7ojd+EWrzu1OraBdBIUJYZNCgRK3UEbdctabaWA8WOgdV/S
 VaOLb0+1+1aNNKjGce8jhms3heVYvtHIbXs2oQiDo/AMbdJa+RXrSJwhJPiGB3RY4w7h
 jcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XZSJi+luSZMg7G1Jaz7xKY1fzHTS9UKAs0WBx3Tw/sM=;
 b=d8fZtJfWWtesDjU7vF3Vh/s4r5cQ2dBqSWex184whqDeWxVrRh+syJhW+cgHkA71aW
 ubo4LRxKfXABdp/p8oB1tachaR75MrsL+o18La634BjXrNokkhNx1ZdI1AkleUuH7N4A
 jCi08OsXDzHr7p1O5aELxxipKN0hbcG9jE2cr4W3AHHhiC/URNU96T7nYwyoeEROP785
 F13g39hOjt1F0MqWfctk/AmAHoyS4efaXFx6q5QWTiiq2n/pJkuIbl3WqAduQB064jv0
 dzA6gtbHiLq+9PrvNL9+Tg84uxZYp0teLAbtj1Y5IcwTA2l8D2PoQJD5umQqS/DCGH64
 W04Q==
X-Gm-Message-State: AE9vXwOF0/zwnytv1k8c6Lf1qw8aEamKteOY0MMT7V5RbY1QKiPCnRBjviO/Rtufe6UMRwniJDaNVCwdQYtUyqFC
X-Received: by 10.31.222.67 with SMTP id v64mr4421728vkg.45.1474394910893;
 Tue, 20 Sep 2016 11:08:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.137 with HTTP; Tue, 20 Sep 2016 11:08:29 -0700 (PDT)
In-Reply-To: <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
 <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
 <20160919213536.GA19274@rob-hp-laptop>
 <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 20 Sep 2016 11:08:29 -0700
Message-ID: <CAFd5g46F1reb-d47YBtxOywPObsLWy+L4KEGuXVJPGvL29O+ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, mark.rutland@arm.com,
 linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 20 Sep 2016 18:08:39 -0000

(sorry if you get a duplicate, I forgot to send plain text)

First off, someone pointed out to me that the mapping that I used
between addresses and bus numbers is not actually valid for busses
8-14.

This could be fixed by checking the offset, but I am wondering if that
is the right way to do it. It seems like this is not completely
trivial so maybe this should be specified in the device tree? If that
is the case, should I do this as another reg entry or go back to the
way I was doing it before?

On Mon, Sep 19, 2016 at 4:26 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Addressed in v3.
>
> Thanks!
>
> On Mon, Sep 19, 2016 at 2:35 PM, Rob Herring <robh@kernel.org> wrote:
>> On Fri, Sep 09, 2016 at 06:55:51PM -0700, Brendan Higgins wrote:
>>> Added device tree binding documentation for Aspeed I2C controller and
>>> busses.
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>> ---
>>> Changes for v2:
>>>   - None
>>> ---
>>>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 63 ++++++++++++++++++++++
>>>  1 file changed, 63 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>> new file mode 100644
>>> index 0000000..df68f2a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>> @@ -0,0 +1,63 @@
>>> +Device tree configuration for the I2C controller and busses on the AST24XX
>>> +and AST25XX SoCs.
>>> +
>>> +Controller:
>>> +
>>> +     Required Properties:
>>> +     - #address-cells        : should be 1
>>> +     - #size-cells           : should be 1
>>> +     - #interrupt-cells      : should be 1
>>> +     - compatible            : should be "aspeed,ast2400-i2c-controller"
>>> +                               or "aspeed,ast2500-i2c-controller"
>>> +     - reg                   : address start and range of controller
>>> +     - ranges                : defines address offset and range for busses
>>> +     - interrupts            : interrupt number
>>> +     - clocks                : root clock of bus, should reference the APB
>>> +                               clock
>>> +     - clock-ranges          : specifies that child busses can inherit clocks
>>> +     - interrupt-controller  : denotes that the controller receives and fires
>>> +                               new interrupts for child busses
>>> +
>>> +Bus:
>>> +
>>> +     Required Properties:
>>> +     - #address-cells        : should be 1
>>> +     - #size-cells           : should be 0
>>> +     - reg                   : address offset and range of bus
>>> +     - compatible            : should be "aspeed,ast2400-i2c-bus"
>>> +                               or "aspeed,ast2500-i2c-bus"
>>> +     - bus                   : the bus's number
>>
>> Don't use indexes. The reg property is enough to id which bus is which.
