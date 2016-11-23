Return-Path: <sjg@google.com>
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP72V6D6DzDvqg
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 03:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ATWXzBpu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="nuL0wQjb";
 dkim-atps=neutral
Received: by mail-oi0-x22d.google.com with SMTP id w63so20679957oiw.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xbZpwzrhXUyzUZcCQhNDr6J3kBs/Id53kBzGlpJTPyc=;
 b=ATWXzBpuQc0y9mZQ7CYUW9ZkVk3LYie3NmY48BlcDlAORvege/4nkD6sdKCTJ3+v7Z
 buEEmi1WABjIu2jcW7oSYpx1XBZtvy8f1Ogo0AiVJH7+yFMhaFdwsSeZatQM8//Ts5y8
 17FSfVREcM1H5d1bpJ/ne8YoNRHE/z82YU7K/kraH5zJJo4h+mWzMtO3WXPsP5EYTae9
 1ncPL+GyfTMewQzmaXoT0pidPyYrhAn8D76w9J74pv1Raf3cD3kNmWxj3013Sz4A7SC/
 mkGJhS6JOGIPZntQLjOLAphU44AiKyUFPmToJzRhWVK6oWh2saln99/RAYTct+wGbDe0
 pE1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xbZpwzrhXUyzUZcCQhNDr6J3kBs/Id53kBzGlpJTPyc=;
 b=nuL0wQjbAOcJ6H2LvYq5So2QlG+nM4c+GJRFojp0X3Pvvu7010pejIwhAgKMUliKpq
 UfPJ+VlEuqGiQk1qmEnsJijaWVAfSpSLYzvuaHg4oZ42BaK8V5KEKGNloC3Vs1azFQR0
 arGWAd8YxUyLgnVqK2ohJRJJLG/udvNeLTPZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xbZpwzrhXUyzUZcCQhNDr6J3kBs/Id53kBzGlpJTPyc=;
 b=CZeQavZRonbk3YNdbakc24gsiwBRWwvGEvjEwd9KzIEf2NhKN451Av09DIPLK/y1DT
 4YM37ZpOba5adYYxT9StESza1h6b0kYyVhSgLjbkXNqg3JrKWX3ZlFOhX90BbShMC5ey
 GF8mngl5tTymtTpRpALz2Dx0pe+E7BL6c3jQIdkRDxb/OX6mYLsfrJqUx3q0E2YPOUVf
 1O3NAR09tH98g6DMDB29zbSUjZAjJH76WJaBezftSIO+X0DjRCg0cfGlbBZsYpIBC4p5
 OT6cBKrhEYx22stWEA7A7FDz0Ky2IpSdF3qWLMy7TEz1o2TeEdM03o6ymvtYdLi3cq7e
 s7BA==
X-Gm-Message-State: AKaTC03KBa4Ln883sjBJyDdZl54lKCTqlwHD1HuXGx/YYqHDereYd0qq1bE//4B1V9cvpB96CEVmespg+JRDSxS4
X-Received: by 10.157.5.209 with SMTP id 75mr2434286otd.229.1479918256658;
 Wed, 23 Nov 2016 08:24:16 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 08:23:56 -0800 (PST)
In-Reply-To: <CAPnjgZ24YqJ1La=WyJFQKhCdyndpU5uqdCxYBY839ukLfzTczg@mail.gmail.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479858976-139210-2-git-send-email-maxims@google.com>
 <CAPnjgZ24YqJ1La=WyJFQKhCdyndpU5uqdCxYBY839ukLfzTczg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 09:23:56 -0700
X-Google-Sender-Auth: P-4g6JpbsLMfyFLVisQnH572WkQ
Message-ID: <CAPnjgZ2UWTeKX9bYszLCDLKM1niPwQQ84P+w+aOoFFjNkJze-g@mail.gmail.com>
Subject: Re: [PATCH u-boot 1/5] aspeed/g5: Device Tree for ast2500, copied
 from openbmc/linux (include file), plus minimal device tree configuration for
 ast2500 eval board.
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 23 Nov 2016 16:24:19 -0000

[resend from correct address]

On 23 November 2016 at 09:13, Simon Glass <sjg@google.com> wrote:
> On 22 November 2016 at 16:56,  <maxims@google.com> wrote:
>> From: Maxim Sloyko <maxims@google.com>
>>
>> aspeed-g5.dtsi include file is copied from
>> https://github.com/openbmc/linux/blob/c5682cb/arch/arm/boot/dts/aspeed-g5.dtsi
>>
>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>> ---
>>  arch/arm/dts/Makefile          |    2 +
>>  arch/arm/dts/aspeed-g5-evb.dts |   28 +
>>  arch/arm/dts/aspeed-g5.dtsi    | 1278 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 1308 insertions(+)
>>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
