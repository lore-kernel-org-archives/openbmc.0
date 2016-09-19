Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
 [209.85.213.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdMVc6ptVzDsfW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 09:27:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=RDVojo5S; 
 dkim-atps=neutral
Received: by mail-vk0-f43.google.com with SMTP id o139so689045vka.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 16:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3KTd7FUSRBZeFNnlm6wtHZPWCMmAwrSuVMYYm3yxfu0=;
 b=RDVojo5SnaWTs9RbBcGDXn4Ix+nH1goo+8vx+3+einWICnGBwLeco/PQn58qSDZV0+
 dofJalUvz5EwNn9JAeePAMwVwnSSfwW7o5157ofIO7g24uQ9T2lXCaxXR4dHxtVmIir4
 hNNOuH37uNyTd5IEtpv2AT7BeZP+U4Icj4OvBv9mxZ8VploSD9XAz/p8jEH+88CrhDMn
 CYxFEBxgGplw6xo64veKJ6kDpgKUCV1o2Ry1tjtbmEszmaFZCYa16lTHudrogdMGKeC0
 21Ihyp9NaPlFqjfBX+Wf8NT5RYJDaNu2NykZ2kXhuLzvrrX03oy+zLM4AIKoyf6eYw0H
 NOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3KTd7FUSRBZeFNnlm6wtHZPWCMmAwrSuVMYYm3yxfu0=;
 b=gT58m4oAbEKs+b7SCPFaA9IjHS7z8+GhbXHb/Lz+P4NGWKdFRt4Cn61kx8lbrKihuo
 HkUKrpbfbwUXY4IG7tL4A19FmRQvNlDceVvytGLPMoMVhmRLxnhxeNPIPX+KQXSBy+VH
 2kHYPgO1D5pd789ZUV71a0sl1voXsGotyJkw6KnMPkBsnGtTK8OCya/mfiwcWZzG1fWc
 K5SCjxzP59IxSLkSZPlD6oCakSuLCEcA6dA0/AG767zet+bxoegUKZFwZCJBELjLBdzu
 OLTqmGes4pKbkU6xZP65ibCpF93oE+P5ffSmoq7cuU9Hoe207KogxcksG+xzd2Bgpte6
 qkVw==
X-Gm-Message-State: AE9vXwNN6Z2NEyTkFDaqENExTRdQi/23B0McxBcaC7ys9ng0BTArYo0RdAu1j5oqFlbd9Yx9Vb1LebUfCg/RmpWx
X-Received: by 10.31.29.18 with SMTP id d18mr1494546vkd.18.1474327576715; Mon,
 19 Sep 2016 16:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.137 with HTTP; Mon, 19 Sep 2016 16:26:16 -0700 (PDT)
In-Reply-To: <20160919213536.GA19274@rob-hp-laptop>
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
 <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
 <20160919213536.GA19274@rob-hp-laptop>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 19 Sep 2016 16:26:16 -0700
Message-ID: <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Sep 2016 23:27:21 -0000

Addressed in v3.

Thanks!

On Mon, Sep 19, 2016 at 2:35 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Sep 09, 2016 at 06:55:51PM -0700, Brendan Higgins wrote:
>> Added device tree binding documentation for Aspeed I2C controller and
>> busses.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>> Changes for v2:
>>   - None
>> ---
>>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 63 ++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> new file mode 100644
>> index 0000000..df68f2a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> @@ -0,0 +1,63 @@
>> +Device tree configuration for the I2C controller and busses on the AST24XX
>> +and AST25XX SoCs.
>> +
>> +Controller:
>> +
>> +     Required Properties:
>> +     - #address-cells        : should be 1
>> +     - #size-cells           : should be 1
>> +     - #interrupt-cells      : should be 1
>> +     - compatible            : should be "aspeed,ast2400-i2c-controller"
>> +                               or "aspeed,ast2500-i2c-controller"
>> +     - reg                   : address start and range of controller
>> +     - ranges                : defines address offset and range for busses
>> +     - interrupts            : interrupt number
>> +     - clocks                : root clock of bus, should reference the APB
>> +                               clock
>> +     - clock-ranges          : specifies that child busses can inherit clocks
>> +     - interrupt-controller  : denotes that the controller receives and fires
>> +                               new interrupts for child busses
>> +
>> +Bus:
>> +
>> +     Required Properties:
>> +     - #address-cells        : should be 1
>> +     - #size-cells           : should be 0
>> +     - reg                   : address offset and range of bus
>> +     - compatible            : should be "aspeed,ast2400-i2c-bus"
>> +                               or "aspeed,ast2500-i2c-bus"
>> +     - bus                   : the bus's number
>
> Don't use indexes. The reg property is enough to id which bus is which.
