Return-Path: <brendanhiggins@google.com>
Received: from mail-yb0-x22d.google.com (mail-yb0-x22d.google.com
 [IPv6:2607:f8b0:4002:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdyx36FpyzDsfh
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 09:03:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MJuRP2bz; 
 dkim-atps=neutral
Received: by mail-yb0-x22d.google.com with SMTP id 2so10624889ybv.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 16:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6VvEmQ7Gnh+VNyBwY54ElZAZ3FC5tvUzqPF//fXCHj8=;
 b=MJuRP2bz4EhSdQKqY2GHe2TBN3ZrVW5jRkB+U/DrWUo6JR5ig0nfBIrgVztpGPpKC6
 MpNf1Rvdv8ZbuX4APqdBvWl4eTH8bx1+yyedQ3z6hEjNMxTt51c40i+X5CXnoqPAtJlh
 Xylq76UpKYSYE3N1gA5B1QiDx8SYBJ/H1vD+osFzq4X9zmaNnY2F+g32IF0IsP0j0pna
 XK+61k1VMBbRkeH0sTaf8gUgFRfyYXYoDpZ+EvEOLdGmCKq9ObrmpJFJXYHfONzXm4NP
 HrjieiYD7eTzjt1jwys6WTkIXHxjedSMxlva6SJmDRp2vsAUj0FPXY63eYKd7upS4FQ8
 e63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6VvEmQ7Gnh+VNyBwY54ElZAZ3FC5tvUzqPF//fXCHj8=;
 b=QcHbJAa6U4Ernd18PPmj3y2qYm9TTqA/4+gn6m/wUFoUS8mRcZ7udqhTf7KKJyOpMT
 IH8KkUivtDeSfhxemz//on4SYFbfi+jTX+efk1uhmqPAdmcZmuU0MRty2BF07ay4DEjf
 xxEDowzT1gYaXrNLAs5YSpQ+9m0Wfq4F6gtQ26NurcxtyHirznqHLMyN3tWzleeNzIt9
 g0k1ps24IbLYCkuSt3SOsofV0eJdWf0v+Po5sFnT5osf+t+P8y+HDVXWK1fQYYyz2Syl
 6uvv2Ahx7FzygSxqAadoziiYZ9FYeMUybxEV6EVS/SdWLqLkpP71J5dMg7ILZyMnIqnW
 yClg==
X-Gm-Message-State: AE9vXwP/o2fFNO4YlCW2yU4FSmC9HKkGnB9oZ3p1zR6vugDHQlnmuJYKLa+6wS3k4kY8jSdPslZRI7wc0Z+C8A9f
X-Received: by 10.37.99.86 with SMTP id x83mr21078553ybb.170.1474412628894;
 Tue, 20 Sep 2016 16:03:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.137 with HTTP; Tue, 20 Sep 2016 16:03:48 -0700 (PDT)
In-Reply-To: <CAFd5g46F1reb-d47YBtxOywPObsLWy+L4KEGuXVJPGvL29O+ng@mail.gmail.com>
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
 <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
 <20160919213536.GA19274@rob-hp-laptop>
 <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
 <CAFd5g46F1reb-d47YBtxOywPObsLWy+L4KEGuXVJPGvL29O+ng@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 20 Sep 2016 16:03:48 -0700
Message-ID: <CAFd5g472L=-fFmxWjYf7jWp4PMuNoSMfUJU_G1vr33RjBFjpEg@mail.gmail.com>
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
X-List-Received-Date: Tue, 20 Sep 2016 23:03:52 -0000

To be clear, these bus numbers are defined as part of the hardware
specification. I am not sure if that was clear before.

On Tue, Sep 20, 2016 at 11:08 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> (sorry if you get a duplicate, I forgot to send plain text)
>
> First off, someone pointed out to me that the mapping that I used
> between addresses and bus numbers is not actually valid for busses
> 8-14.
>
> This could be fixed by checking the offset, but I am wondering if that
> is the right way to do it. It seems like this is not completely
> trivial so maybe this should be specified in the device tree? If that
> is the case, should I do this as another reg entry or go back to the
> way I was doing it before?
>
> On Mon, Sep 19, 2016 at 4:26 PM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Addressed in v3.
>>
>> Thanks!
>>
>> On Mon, Sep 19, 2016 at 2:35 PM, Rob Herring <robh@kernel.org> wrote:
>>> On Fri, Sep 09, 2016 at 06:55:51PM -0700, Brendan Higgins wrote:
>>>> Added device tree binding documentation for Aspeed I2C controller and
>>>> busses.
>>>>
>>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>>> ---
>>>> Changes for v2:
>>>>   - None
>>>> ---
>>>>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 63 ++++++++++++++++++++++
>>>>  1 file changed, 63 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> new file mode 100644
>>>> index 0000000..df68f2a
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> @@ -0,0 +1,63 @@
>>>> +Device tree configuration for the I2C controller and busses on the AST24XX
>>>> +and AST25XX SoCs.
>>>> +
>>>> +Controller:
>>>> +
>>>> +     Required Properties:
>>>> +     - #address-cells        : should be 1
>>>> +     - #size-cells           : should be 1
>>>> +     - #interrupt-cells      : should be 1
>>>> +     - compatible            : should be "aspeed,ast2400-i2c-controller"
>>>> +                               or "aspeed,ast2500-i2c-controller"
>>>> +     - reg                   : address start and range of controller
>>>> +     - ranges                : defines address offset and range for busses
>>>> +     - interrupts            : interrupt number
>>>> +     - clocks                : root clock of bus, should reference the APB
>>>> +                               clock
>>>> +     - clock-ranges          : specifies that child busses can inherit clocks
>>>> +     - interrupt-controller  : denotes that the controller receives and fires
>>>> +                               new interrupts for child busses
>>>> +
>>>> +Bus:
>>>> +
>>>> +     Required Properties:
>>>> +     - #address-cells        : should be 1
>>>> +     - #size-cells           : should be 0
>>>> +     - reg                   : address offset and range of bus
>>>> +     - compatible            : should be "aspeed,ast2400-i2c-bus"
>>>> +                               or "aspeed,ast2500-i2c-bus"
>>>> +     - bus                   : the bus's number
>>>
>>> Don't use indexes. The reg property is enough to id which bus is which.
