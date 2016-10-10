Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sss2H575fzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:19:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zIoSfV3Q; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 2so3766881vkb.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=a7hEV17i1N3gTswlPHNFu1I8oNnLGOlrEJ+z6OyoIts=;
 b=zIoSfV3QsBjgV2oiY9aoWK9wWGdGuQ8o5La/o7nZjyiUDjrHeKr9vkSpTswwDi1Prp
 Tg33E9vp5intw6T1vEN/2Y8vQql3hHdAp+bWDwyuaKd9RBlGMlnuP1rHfIMzeXXKMnZH
 irZ7TGNF63XQpiVFRYZ+Aa2TwoFKlnl+O1XlftH4TD5xVXI+A9QEUu8oZKO9GJP9TdZi
 towaljeZ2LLMok/rZzE/0JaM09i5E8u/hIkiVKPuQfxYvfWgdZbdz4z1jv0398tz6hCL
 hIzkgAl8/b4jvrpahHPgmEJS5hVGHMuqi3hG6T0MHetwunzeDHRQVVfan5LXrYQrW/DB
 1ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=a7hEV17i1N3gTswlPHNFu1I8oNnLGOlrEJ+z6OyoIts=;
 b=WsOcI7QBEMtqAaGg2dcTUJk+7lwyuh8tMA82bB6l/krLhVkrzr5XweAyhqT1eqd1o8
 sCrvpr2wn4kN3cyKuuxd8HRLNbAcFWRPWRzTAoAs0TttDFK1vVlCquI0htjdjx/qqsx5
 En8qBvLcJjkBqOLBIgYLyQ2uupJjyAIDr33H5baPddTI/n+ylJwx9ObVwolx1lOEA6TX
 ylsalbqxmEA1HHwuBUbyWKEng3nsrqDyF9W14HEQQjqudItDT52GZJtdCcmGjvnJ04Nb
 0yzZUuEkQyqxD29P6rqt6aYgdKmmpG21/ik6laeOO+YaFNWzofQWrftu5T8MKJAveEZW
 Cq1Q==
X-Gm-Message-State: AA6/9RliVhGHqLHh5LETz1wdyF0AVTrYeRBGv7fDPGxjynB/l97SJCE1duBwRGU6HoXF9AHt/4tnL/i/5aIhWw==
X-Received: by 10.31.140.147 with SMTP id o141mr14009147vkd.149.1476083973647; 
 Mon, 10 Oct 2016 00:19:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 00:19:13 -0700 (PDT)
In-Reply-To: <CAFR_W8r663kSg16-4eNYSHkAYabJyBSMC7o0GGhpTyKS9Zc=Kg@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-3-git-send-email-maxims@google.com>
 <CACPK8XekqQyXVfkY6BoNBXWxZSwDXngtxU_8e4uuEZ-JdDmoRw@mail.gmail.com>
 <CAFR_W8r663kSg16-4eNYSHkAYabJyBSMC7o0GGhpTyKS9Zc=Kg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 18:19:13 +1100
X-Google-Sender-Auth: NmZwKGifA83L9qkrattoPh_f1OM
Message-ID: <CACPK8XfidRBwJW6qFrnDcMBif5dHQBa0gHx9Bac71+iTWqjWEQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] aspeed/g5: I2C driver.
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Oct 2016 07:19:36 -0000

On Tue, Oct 4, 2016 at 7:41 AM, Maxim Sloyko <maxims@google.com> wrote:
>> > +
>> > +static const struct udevice_id ast_i2c_ids[] = {
>> > +       {.compatible = "aspeed,ast2400-i2c-controller",},
>> > +       {.compatible = "aspeed,ast2400-i2c-bus",},
>>
>> Your subject says g5, but your compatible strings say g4.
>>
>> Your probe function doesn't test for which string you're using. Why do
>> you have both -controller and -bus?
>
>
> I think this has something to do with how the device tree is processed, but
> it seems that because i2c buses are specified under a single controller
> node, if I don't specify compatibility with -controller, it does not match
> -bus nodes.

I don't follow?

The hardware has a few registers that are common across many busses.
The device tree describes them in the controller node, with the buses
being children of this node.

Cheers,

Joel
