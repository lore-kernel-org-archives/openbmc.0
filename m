Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8M8H2mw4zDqL2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 13:45:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5coXtLF"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id u70so7674516ywe.1
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 20:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/rbSh1GwhWBJ0vEo14OKExezId0W34Q88LN97cZ+mAM=;
 b=G5coXtLFi1Svj+sFI/zBALGr8KPZAkhi4lPM4T269LjUHpmWQIbQY04WIXSVTgL4Ha
 C4dirSggarCv+woNONMQb8TDy7LTneFp5+K5f7SswDTpvNYMyxe/zbd04ZCI6F8QdUzE
 GSxdILcAfAMgHIt/I1WGwgaUUQSXDo+3/D6lQwc0RluY9xcZlL7FPNCdPwdbjbln2As1
 kvl4/hBZDPJ8cB3ZOiY2dusT02EJWwoWMHAmkP7VxQJnKL0Iv6pUHHxTKR8keI3dyhcl
 cutR4iqPYE1kpP1PIQgwqB9hg5Iskiw2YjD49KI/MCYFr0jvS1EtzKItGbc/VtU0nldf
 bQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/rbSh1GwhWBJ0vEo14OKExezId0W34Q88LN97cZ+mAM=;
 b=DM4wcFIqsPwKk19eXBIKIIq8on78qE9mX+TWB+ljVwT1C6qcpwxczAJfWEvL174bEm
 2P7QEhgMQDh1ZxFfPlgs8nT7m2whrZ6VsM/CXo4r+pS+QeK1/QwuFnZKqcDvRLaCRZmD
 fE92aJuAdp4s93PUTMRK6W02WpRrodgqbieuvqucc5fL0bVBiCqKcAViVfWmepvjQ9VA
 wXPZ1Ch6bDsM7w4nO+7FBNC5Xc5LgbY3QX/0jJCisnpyPU0box+K++UK6nEzNQmgy2Km
 IHU5ceQoc97XaSkJ2h+Qr3eDX1t2mGYmE33xjVtA0tWzc/7A9SYfPy+M4pBbfWyhgyUJ
 rX4w==
X-Gm-Message-State: AN3rC/6IIcgWU8cOSmaP7G1HcnN4+Bnsgia76m4uMuSweAOaPoebCQDx
 b4TYqJU4tMsqcHKlZVuNMuLsSy4eIV4y5RA=
X-Received: by 10.129.169.200 with SMTP id g191mr11595487ywh.56.1492746333147; 
 Thu, 20 Apr 2017 20:45:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.8.202 with HTTP; Thu, 20 Apr 2017 20:45:12 -0700 (PDT)
In-Reply-To: <1492746120.4069.2.camel@aj.id.au>
References: <1492744763-29872-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492744763-29872-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492746120.4069.2.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Apr 2017 13:15:12 +0930
X-Google-Sender-Auth: Ll0pEw06GGsSmf4hiHSvOzcAZIY
Message-ID: <CACPK8Xc1HWWiWFHOdK9nDYpyakwA3juUKZBP0Uib2e+KjqySDA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v5 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Apr 2017 03:45:36 -0000

On Fri, Apr 21, 2017 at 1:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-04-20 at 23:19 -0400, Brad Bishop wrote:
>> Enable gpio-keys events for the checkstop and water/air cooled
>> gpios for use by applications on the Witherspoon system.
>>
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Flip flop ;)
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

The bike shed is green.

Merged to dev-4.7. Thanks for your patience Brad.

Cheers,

Joel

>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index e3a7b77..236696a 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -31,6 +31,22 @@
>> >             };
>> >     };
>>
>> > +   gpio-keys {
>> > +           compatible = "gpio-keys";
>> +
>> > +           air-water {
>> > +                   label = "air-water";
>> > +                   gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
>> > +                   linux,code = <ASPEED_GPIO(B, 5)>;
>> > +           };
>> +
>> > +           checkstop {
>> > +                   label = "checkstop";
>> > +                   gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>> > +                   linux,code = <ASPEED_GPIO(J, 2)>;
>> > +           };
>> > +   };
>> +
>> >     leds {
>> >             compatible = "gpio-leds";
>>
