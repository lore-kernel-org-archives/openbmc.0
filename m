Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22b.google.com (mail-yb0-x22b.google.com
 [IPv6:2607:f8b0:4002:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wydHv5PRdzDr4K
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 08:48:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uBz1XiQS"; 
 dkim-atps=neutral
Received: by mail-yb0-x22b.google.com with SMTP id s9so23584455ybe.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DXzwBh4uAtvcmoBl4Boct8muVKo7/V+QjwOVkE56GRM=;
 b=uBz1XiQSJF+GVAyaBnt6bOrN5R/PJPxf5Gt1oNgeWBvh++yHY5+S4fIB8bzJj9mQke
 ltV7oWEv+z4BTgd18JcE10Zm1tgxaF+BANx6AAICRlZ+Cuj+NSCeqV6hKEP6BK6xdiyX
 1hUl+g4kouPsm+PUp+aG6PgSi10eTo9ZpkLZvLnRaQGu35c5Skf4F/yNCh5arTRPUikq
 U7o9vqiAn+VUoXsJrVSlNBop0gXznzt6aqQY7p6Tg/Bv6hrhga8/wbki8eB9tDNxQvai
 zVSDNZs7PEcMNVHxUNy3URiPhAOqiL7WWIdESads2WFOIN4f+JWuQQrVKteUUP57Js03
 +syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DXzwBh4uAtvcmoBl4Boct8muVKo7/V+QjwOVkE56GRM=;
 b=t1KW7b4IHFpWfY0kSTgFrI2ojTyHaoRpXlfaHkpWEJawHxlIEjMRWrsSxOZ/fdSbLu
 fWJbqrkULmiYut1AUXpesGlqzcKuavqcGmp1Irdl1qhmgnxLCloZ6/WYlUueDZt+btGv
 1berGXcbwajx9uSxdFHXvhYqyLGrEaaPZwEOLVp1Giwbbu0UUaWYIAW9aIJzRlD2VOky
 Y/SkytR73bVT/VYTkahwtN1IBzDuaC3Rya89Gf2+s8VS1LTnicxi7431+Xrd5HpIFDU6
 s0bpHgLVjfPghkHi+Is/CdmDa87myqPIRMos9x3RfDHKmqZwPiW86wCJ4PI2uRhhEzhi
 20wg==
X-Gm-Message-State: AKS2vOx+VKMB+m93zg6NfoSYELkGOh64EqLTBAHkSW0Uqgg/rWlnRAO6
 LOmaC6YqN2ptP+eJmmMuax500MGhTg==
X-Received: by 10.37.183.6 with SMTP id t6mr9544914ybj.221.1498690121458; Wed,
 28 Jun 2017 15:48:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Wed, 28 Jun 2017 15:48:20 -0700 (PDT)
In-Reply-To: <CAO=notxaRU_R7REqCXYKJDzLFVducV5WBDOJ2YnwTG5p7kDasg@mail.gmail.com>
References: <20170627134459.125774-1-venture@google.com>
 <CACPK8XfH0OPN4Lch-JmNWDpRO_5wPDic+-8dFjA3Dzr0LkvU8w@mail.gmail.com>
 <CAO=notxaRU_R7REqCXYKJDzLFVducV5WBDOJ2YnwTG5p7kDasg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Jun 2017 08:18:20 +0930
X-Google-Sender-Auth: n97QrNVWkZC5Y5W6fHJgHN1of4A
Message-ID: <CACPK8XdjAE2nWhvDmLAXvd1OgrHMT2sPRsWDHpGT0ws-c7UBJg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: quanta: Enable pwm
 fans
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 28 Jun 2017 22:48:44 -0000

On Wed, Jun 28, 2017 at 11:31 PM, Patrick Venture <venture@google.com> wrote:

>>> +               compatible = "aspeed,ast2500-pwm-tacho";
>>> +               clocks = <&pwm_tacho_fixed_clk>;
>>> +               pinctrl-names = "default";
>>> +               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
>>> +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>>
>> It looks like you're using fans 0..7, but you're only requesting the
>> pins for the first four fans. Should you be requesting all 8?
>
> The pwm actually drives a pair on this board.  So, we have 8 fans, but
> only four active pwm controls.  I don't know if this is a driver issue
> but the fans are paired and work as a pair.

Okay. The bindings are a bit confusing at first glance. Sounds like
you've got it under control.

I'll apply your v3.

Cheers,

Joel
