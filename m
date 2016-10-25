Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t30Jv4D3QzDvh0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 15:18:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=lzgk06M+; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id p136so5087802oic.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 21:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u6ER5VnRau3HJb+6nxui1MyOqU3vn/rOYu1ZZ45wMRE=;
 b=lzgk06M+ReYGAdUBUnUlIG/bqQy+7pZNPdjBqi8xU0xxrQVpOyV8g7Ln7fhX/vbOB4
 f/oSmKsQGt7s193ftWad4uHsqajvulsBVCdvjh20deI3VWuTPUaNtKrPk6fQbpql/hKT
 ltpyxBqVpOzP87PsPQlzJqwGs/RnMs5cZX476PxP9tdpcjjUlU1L2EkgT4WtuEuFD+Zy
 eD5iBrTrwJ/K1CNKlcM5De9ZWAWz6QGo2uDHVzNoKJ5TtztDD+Kv/6kuYUF6uaGQW1h1
 Sxj1RzJSbcFhjwmc7JfLAtE1bNZiB/EUa5OoYh4a88RdLibHjVWcJ1DMnrqoAm89TwaS
 qs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=u6ER5VnRau3HJb+6nxui1MyOqU3vn/rOYu1ZZ45wMRE=;
 b=LmoQYX//vDViOtSwaTrpDr5OHXclRRu+MBYCkevSk+aC1lr8B+AJqLnplSwh5Y2oAQ
 WWsJL3E7PkZ/S9av2waFt+ie+mOeKgLiwkvoD2gZpdpDh1Kl8MWhflhuQ3aZN/CSI9kp
 4DO80NjYfhICAiOti5KXoDxMuXM9yHJAX4AQy0Hm9Z5kjrj+pb432BmF4QXJ8vi6ND0R
 5xi97B+lHYxWZxLFRel8oa3RqIZG5jJA+FN08m0Zn5ZFrVa7YJke+MJ5tgTd6e560ozb
 tkegUUgsIwUGqgkIn/uyi5bXzZqhyzule7yf95ljIXG05X4Pz3a5tIrlOeSSpxMV9DfV
 3e9w==
X-Gm-Message-State: AA6/9Rnd8gyQvagQbhXgc0yHfT5O+dhzq7HKHKIFVf51kD57vZU2xzt0Q4WgKoLlFMkiTALl9u8EaOMl2FPkMA==
X-Received: by 10.202.81.204 with SMTP id f195mr15412849oib.137.1477369133387; 
 Mon, 24 Oct 2016 21:18:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Mon, 24 Oct 2016 21:18:33 -0700 (PDT)
In-Reply-To: <CACPK8Xc+_m07jKCm-2tEGetpe7DuM03OrqOVp7wBH=4XgxrzrA@mail.gmail.com>
References: <1477004194-107484-1-git-send-email-xow@google.com>
 <CACPK8Xc+_m07jKCm-2tEGetpe7DuM03OrqOVp7wBH=4XgxrzrA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Oct 2016 14:48:33 +1030
X-Google-Sender-Auth: Y5jRnnDQjJPkozkb_PI247k0xQ4
Message-ID: <CACPK8Xer5mm=UxWnui0AWQM7dwg_0WFwSDhscuerT6X7RHBZMg@mail.gmail.com>
Subject: Re: [PATCH linux] mach-aspeed: Add Zaius BMC PHY reset
To: Xo Wang <xow@google.com>
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
X-List-Received-Date: Tue, 25 Oct 2016 04:18:56 -0000

Hi Xo,

On Fri, Oct 21, 2016 at 3:27 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Oct 21, 2016 at 9:26 AM, Xo Wang <xow@google.com> wrote:
>> The Broadcom PHY for the Zaius BMC requires a hard reset after RGMII
>> clocks are enabled. This asserts the reset in case it wasn't performed
>> in U-Boot.

> I'm not sure how we would handle this properly if we were to submit it
> upstream. We can carry it for now though.

I came across this thread on lkml: https://patchwork.ozlabs.org/patch/685741/

It has some suggestions for now to do a hard reset of the IP on boot
using GPIOs, which might be an upstreamable solution for your issue.

Cheers,

Joel
