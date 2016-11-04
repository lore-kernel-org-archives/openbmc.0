Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96FS4SBNzDvP2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:07:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IMc478Qx"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id x4so10259637oix.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 20:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UiaMV3NVKzssJMgIRjwC0Kl213EKKq4UgighMiO+ang=;
 b=IMc478Qx6pSLVvyebVMu7O0HfGq/s/599p2bXnuGQDFCK7KgbZGL44T4AV129SYCf9
 3LdK+EOgRcqzyv0TRok4zSlx6JtYFz7FJW3quXJbl6q3L45h0JJgfWN2xRnaGlDSEK2h
 DVSuAOaIh83pkjAMjANSteUOzG0S890ZMps25rs+I7HvY/wByUtRwNk8TseniMkVDnNx
 qjazRJwFBES1YFy2xjGUBd1t+ntxVd853AQqwrkRSU5LccAWYbnFXqrm9NjNDuUNXhUq
 hYqFCPuRa4S+PZwOsNEd0VwAsfGxPOeORjh98mI0iU0lcUSYYsjTHfZpfm6LhlsdiBlm
 lXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UiaMV3NVKzssJMgIRjwC0Kl213EKKq4UgighMiO+ang=;
 b=EP3/FY+1PDQtpLTDcGyi7ibu/HHTmohsH04rXJYZkATk3n8hCgcUUPwmZQu5s4IpDe
 kzxbA/KT5n9QQPyqSDG6Lud8isAgSSIKoQXuqZJM6Ginnh6vv911GKqIbHvGE0AqTiJc
 IIvjDDIhDaf0M1axtJaShLSDDvCwsqQ4P1OOSbxParPQnVJLQsHdjtR2jzCB3nNeiMaU
 J89kklP3hSHsHb5qYBy+hvY4hZ863zVqlwQ3r5WGEJgW0JWSqRTWYWPKw4FLiRTmZaio
 isFIyWvUHOQQkaSgxMdZKGuvrrSTD2yqVlmORU3euIv2ygU77jcqj7ThfVgm6AxClQL1
 lwqg==
X-Gm-Message-State: ABUngvfXu+GDFe3PDjnFiUuSCNapEk+sreDaUDI+64SZBzOETd4AuNz5ZkIw6k9vUHopnWB4qtg0zVW2WhD4Eg==
X-Received: by 10.157.54.5 with SMTP id w5mr8069611otb.211.1478228826852; Thu,
 03 Nov 2016 20:07:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 20:06:46 -0700 (PDT)
In-Reply-To: <1478221709.27396.39.camel@aj.id.au>
References: <1478195018-132099-1-git-send-email-kunyi@google.com>
 <1478195018-132099-2-git-send-email-kunyi@google.com>
 <1478221709.27396.39.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 13:36:46 +1030
X-Google-Sender-Auth: FanrhaevIsLf0X9pbFEVqcPSqc0
Message-ID: <CACPK8XfDqUtK6omPeePgqc378-ht368x+-V8rhiKZjmFBRNwZQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 1/1] pinctrl: aspeed: Enable ASPEED
 pinctrl driver to modify SPI1 strap bits
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Kun Yi <kunyi@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 04 Nov 2016 03:07:09 -0000

On Fri, Nov 4, 2016 at 11:38 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-11-03 at 10:43 -0700, Kun Yi wrote:
>> Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only.
>> Changing SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1.
>>
>> Signed-off-by: Kun Yi <kunyi@google.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> Joel: So lets drop your patches to the board file and apply this. We
> can switch the devicetrees over to pinctrl_spi1_default later.

Applied to dev-4.7.

Andrew, can you send this upstream as a v2 of your pending pinmux series?

Cheers,

Joel
