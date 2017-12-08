Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Um99b5r8"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytMtd5Rj2zDrYf
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 17:31:05 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id f13so10736108lff.12
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 22:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=PzXR5uIVnr0d+TWLjHLVTpJNpk/798jXpUXlknQmwoA=;
 b=Um99b5r8mFEuPr0FyZXDlcrtCyWdwaDBL3IiG4w7t7i6Paht3XsJpVHrt8W3e8UNL9
 ivYZo100KFugQhwpj+xekPxDM8AdOClXmwYxlQR8dPXfdNV61Hd5PmGgPWcPfHksFLhU
 IjkyU2nNVtddyu/oFSsUPfz5BAZg+zrj97a7I+2gwZRshHXsdOSt3CWSkqWnZVRR1Tp3
 JuVLqgx9YW8SrIqQPktwzS1OvvaNEC3AnJMnGwCJUdx77KaqOh8u21jxpLvna+44jQ/p
 TjWdfKBf+irUVtJbCygIzLWPavBAJM3gIFoHcLP87MFpg9ywjIjj3XMjDu1oe5723BUq
 FiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=PzXR5uIVnr0d+TWLjHLVTpJNpk/798jXpUXlknQmwoA=;
 b=el0Wapxzh0eTp+qMEVDG1/rh00h+j0FNHV8pbl6lb8szoVEE7rvdJMZQi5Sor/5FWV
 jbkIO2dlCuEp1ZJQP4C3Zx9zNLIPutadPKvH2+4e+aZSUXb6ZdohUymSgjkxaENNXZNs
 nCpmVH/TOmDi+ZbkrVFEP6unV9g5NFyZEW8zldgf/IaAh5Lft10OVMzQnPqS4oOzKekm
 LWzsqWscd2NMcmJOns2OkqX1wbfqL1906F6Eg7PSgfGUkuXIniJkyMfktsDPZXpF3IBY
 e14BXVO5Ndqxg3NWTpbOOsVDRs1l8aXnSjFXJH9XkqowMl58DB0sjL4OBNGi0NqMMQyy
 GPhw==
X-Gm-Message-State: AJaThX5jU9MIpiLLDehjy1nKmfTXflGlvAue2VEL6+xZ/Xe707qecdee
 VbjvOATLwEn1Hixj0eC7vplUixhWsDBEN6shHBA=
X-Google-Smtp-Source: AGs4zMZsvOBJ1se854hAZcdRi2UUnjRnsKCDt/6ONwvVOXIIXwZUr0UCwa8Ou9CTB73bPAXbYGJCZsHWQ9Rd+mTQVsU=
X-Received: by 10.46.88.68 with SMTP id x4mr15540469ljd.138.1512714662639;
 Thu, 07 Dec 2017 22:31:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 22:30:42 -0800 (PST)
In-Reply-To: <CAO=notwPBvHSvHgnQCycajUyJ-13sa+TrXYxmzKc5SL-V+8_-Q@mail.gmail.com>
References: <20171120185445.146061-1-venture@google.com>
 <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
 <CACPK8Xet_aaCf3StQKwzXGTd1Oi0A=P-i1QU7faCuxOFb3ktxw@mail.gmail.com>
 <CAO=notwPBvHSvHgnQCycajUyJ-13sa+TrXYxmzKc5SL-V+8_-Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 17:00:42 +1030
X-Google-Sender-Auth: 94SDjI_w3sZF8yxYO4lWxYmjbkg
Message-ID: <CACPK8XeRxVvn1ZUM+WDWF5td6edBwWrdsxm7Ozn78FcJf8E1vQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
To: Patrick Venture <venture@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 06:31:06 -0000

On Fri, Dec 1, 2017 at 2:05 AM, Patrick Venture <venture@google.com> wrote:
> On Wed, Nov 29, 2017 at 7:53 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Thu, Nov 30, 2017 at 5:03 AM, Patrick Venture <venture@google.com> wrote:
>>> Can I get a status on this patch?  The device datasheet has 4K
>>> reserved for the range, but only the first 512 are registers
>>> controlled by this driver.  The rest will be handled by a separate
>>> driver.  Or at least that's how it's planned.
>>
>> +cc the people who have worked on this.
>>
>> I think that's okay, but lets see what the others have to say.
>>
>> Do you have a driver for the rest of the GPIOs you can submit? I'd
>> like to see  that code so we can decide if there is good reason to
>> make that completely separate, and not part of the existing driver.
>>
>> This work is best done upstream, as you will need to make the same
>> arguments there.
>
> I should have a driver ready sometime late next week that I'll be
> sending upstream first.  I still need to finish up a few loose ends on
> it.  It wouldn't be unreasonable to have them in the same driver,
> you'd just end up with two groups of gpios that are handled
> differently, and extra soft-irqs.  That said, if you have two large
> groups of things that need to be treated differently, then that's
> somewhat of an argument for having them separate. :)
>
> I'd actually appreciate hearing some thoughts at this point on which
> way to go, since merging the serial handling into the main driver will
> require re-working a few things -- I'd rather take the extra time to
> handle that merge if it's going to head in that direction anyway.
>
> I have read through the gpio-aspeed driver before, as it was a bit
> useful as a guide, and I could see it getting a bit cluttered with
> also handling the serial gpios.

It sounds like a call that could go either way. If you think it would
be easier to maintain two separate drivers then we can go that
direction.

I'd suggest discussing it upstream.

The best way to discuss it would be in the form of a patch. Even if
it's not complete, post it as a RFC.

Cheers,

Joel
