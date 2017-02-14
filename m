Return-Path: <jaghu@google.com>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMsXL1y6vzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 17:12:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ATllhX/J"; 
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id k127so74372746vke.0
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 22:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8Sf2mW7IuyR635gTUpc5dyArMqepQ4fbTF/IMCyENfw=;
 b=ATllhX/JrFz5JcZKgaVW74HMLH88sjbLNYMGzF5ClSjRccpS3MB9mMG+A3paRgIYfL
 Hvnu02ZjfmTS1SW6EA24MgCsBdrzSmg/PjFmOXoXJXrYUN6uaoB+/UnpGlnDxPjxngMY
 UOyVttUxkf0Z0qI+d9Ooa22dDR9UzmyswfHPF68qK/xmOsgMBjCxKQikIxAI6Fv/BY7u
 64+CTTleNQo51WbpqNcRIxF0NR2Y25Qid+UhBMuzJWwrKLorrGtdenL58gcTAXcdKWGK
 L/hRzzpF9zjnPb6WCP9sohlHtCRKnut0RX2os+KhIjgisleBXt1SC3KL6nNUMHjXI1jb
 fbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8Sf2mW7IuyR635gTUpc5dyArMqepQ4fbTF/IMCyENfw=;
 b=HhpQI3MaqGVEoz69yE0lm5ld+EwDQHd1tEA9YczGfNyZ0AYTCLtBZ69brhRweQ2zqG
 /hhIgVsmVC2qKXYaHB/yLwdhICWMW4jysMYNmZ+j7O3Amr24MuSTCzPYWFu5TQpgkG7u
 LDCOVVi+IPQeEBEkynUKWegqda96lMIQS6AN2nBIpvhaNX3rI8a3RF4VLhlsOkTcA+1P
 ajdeHFMVOfxuv14DDf7n1YjKUgCqjWiUr7gG8KjvwnbbJUv0FYRwVmwqA4H/tU2rXLkw
 xJ40g2bFo/j8SexQQZPr15yU8D9O6cKb6UGT72KUWHrJz0JZXkpYki7ONKulsfRSgDPS
 QfJg==
X-Gm-Message-State: AMke39kl6WwUdKvS5l5d9i0eQCsRkuRqMsL55TsVgVlEjbm6c72HSYrWixk67n6ZaGL4d60l+vDGmIGdN7pnco5Z
X-Received: by 10.31.254.198 with SMTP id l189mr13274374vki.86.1487052751251; 
 Mon, 13 Feb 2017 22:12:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.107.77 with HTTP; Mon, 13 Feb 2017 22:12:10 -0800 (PST)
In-Reply-To: <20170201145837.ybfqvz4rdpaiw323@rob-hp-laptop>
References: <20170127093400.28904-1-jaghu@google.com>
 <20170127093400.28904-2-jaghu@google.com>
 <20170201145837.ybfqvz4rdpaiw323@rob-hp-laptop>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Mon, 13 Feb 2017 22:12:10 -0800
Message-ID: <CANsWYUUXbQFsZsKwdXvQoeboO5U0QJJfz-Z-s3ymJ8a4n3hD0w@mail.gmail.com>
Subject: Re: [PATCH linux v2 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
To: Rob Herring <robh@kernel.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Joel Stanley <joel@jms.id.au>, jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 mark.rutland@arm.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-List-Received-Date: Tue, 14 Feb 2017 06:12:35 -0000

On Wed, Feb 1, 2017 at 6:58 AM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jan 27, 2017 at 01:33:59AM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
>> This binding provides interface for adding values related to ASPEED
>> AST2400/2500 PWM and Fan tach controller support.
>> The PWM controller can support upto 8 PWM output ports.
>> The Fan tach controller can support upto 16 tachometer inputs.
>> Types M, N and 0 are three types just to have three independent
>> PWM/Fan Tach related settings.
>
> This still looks overly complicated to me and very specific to ASpeed.
> You need to define a common structure that works for fans. To start
> with, define a node for the fans themselves. This should use the
> PWM binding and a -gpios property for the tach (when connected to a
> GPIO).
>
> Something like this:
>
> ctrl: fan-controller@1234 {
>         ...
>         #pwm-cells = <3>;
>         fan@0 {
>                 reg = <0>; /* 'Channel' of the controller */
>                 pwms = <&ctrl 0 ...>;
>                 tach-gpios = <&gpio 1>;
>                 vcc-supply = <&reg_12V>;
>         };
> };
>
> We already have a pwm-fan binding. This should build on or possibly
> replace that.
>
I have rewritten the structure to be more common and sent the updated patch.
There can be upto 8 fans. Each fan can have 1 PWM source and 1/2 Fan
tach inputs.
I think the pwm-binding may not be very relevant. The pwm-binding
indicates that there can be a unique period value for each pwm(ie
500000 in pwms = <&ctrl 0 500000>).
But here each pwm can't have a unique period value.
There can be only 3 settings (type m, type n, type o). Each setting
includes values like pwm period,
fan_tach_period, etc
Each fan can be configured with one of the three settings.  So the pwm
and the fan tach associated
with the fan will inherit some values from the setting which the fan used.
In the updated patch, I have used a default setting(type m) for the fans.

>>
>> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
>> ---
>> v2:
>> - Removed '_' in node or property names
>> - Gave some explanation for the properties used.
>>
>>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 178 +++++++++++++++++++++
>>  1 file changed, 178 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>> new file mode 100644
>> index 000000000000..290122bfe170
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>> @@ -0,0 +1,178 @@
>> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
>> +
>> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
>> +controller can support upto 16 tachometer inputs.
>
> AIUI, each fan has a PWM and a tach input. How would you use more than 8
> tach inputs?
>
Each fan can have 1 PWM source and 1/2 Fan tach inputs.
>> +
>> +There are three different types M, N, O. These three types are just to have
>> +different PWM and Fan Tach settings. Each type can have the following settings:
>> +     PWM related:
>> +             1) PWM period
>> +             2) PWM clock division high
>> +             3) PWM clock division low
>> +     Fan Tach related:
>> +             1) Fan Tach type enable
>> +             2) Fan Tach clock division
>> +             3) Fan Tach mode selection
>> +             4) Fan Tach period
>> +
>> +Each PWM port should be assigned a type which can be type M, N or O.
>
> What is the definition of M, N, and O?
>
> Rob
