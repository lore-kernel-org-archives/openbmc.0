Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x241.google.com (mail-qg0-x241.google.com
 [IPv6:2607:f8b0:400d:c04::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDxgl1x76zDqGL
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 12:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Io1FmOHf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=ZL9FPL5R; 
 dkim-atps=neutral
Received: by mail-qg0-x241.google.com with SMTP id t106so2830892qgt.2
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=khgIQg0LNj1gHuZHDnbk0uEXu720/JcjthtzbK2zz9k=;
 b=Io1FmOHf4td2gesu2CNfyZ2DNLYhZ9RK8vp9MXeewSlJWsdIHYICgab9fj8NxF3Eq5
 oGXqVhO6MzSnKwkZadf6gdxnxsROBpSOj7QTpfSqY39WqLKw0aziUga66uaJXSntOrFn
 7fN3HjFp8vHBNHHUWNIBP2JMe86Mbc4rXk7Qu+F2F92rq/75P9XLKUD6tWyUjEdP7pg8
 f4iCdV8U6nhvkcj0fhuQ821ktNmkDyweqpq+0/czPT1Rp37U3DAy4+VU4VTt9Vi/+Pe3
 Jr0P2eKAN/r03dJQo6OFr9DPyw/YhXP4JLMcj3dbGdoRjP1fm3t6AdZAX6Jgmwdufq6p
 Q9/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=khgIQg0LNj1gHuZHDnbk0uEXu720/JcjthtzbK2zz9k=;
 b=ZL9FPL5RocR5J5AQhwZi/vwerYcBqbv0TCc5flqGTbC8jsfZnm0sUGg3ymIcWchXJ5
 qEURW8si+AmzGdBeW7Dv80Tv2S4ym7GDL7HDDhddX7erA2rqkL5gT2NOmIct/mxVJw7s
 Kcsj9DegZbrXDN5Ll4K7u6yRvcOiY+/YFZwsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=khgIQg0LNj1gHuZHDnbk0uEXu720/JcjthtzbK2zz9k=;
 b=BhRnFSdvi8PSvJbRYipGtqJUD6ljh0ghBCv0eQF0ceB+U4ywu0KfULx8kzVrW3v8QA
 n4T9yZQsu8oeh+pimk+Ii4AXdXMtzQROf+DqR7l79WssZswe8FxIMEHX/n64QRuMi/4K
 1bdwq3PCYlWHxlzwLv7+YNtQV71AakO0yK8ZmvLN8EOT2oO7ulDK4E6A1XghWS/6UIpU
 l2UJOGCxMecvLoMT0fHFLhvRfWyjIBL6h4Vg+oJPKpM28JgSq0hrHOxpjGcP+mqJM0Ru
 kaNmcr6e3WSDNp5nMb2QsX6uxRWylFEwdbobma58+cquWQmW+myi8VQLAn/Z6myHuViE
 g5Lw==
X-Gm-Message-State: ALyK8tITbu1BTiuOm98Lh6AhhyjGOaT1W0ryHANeQqihrjFpG4SEBrqRW+7F7oUj/fin0Jpw55jCeJfb6Acilw==
X-Received: by 10.140.37.21 with SMTP id q21mr1318305qgq.69.1464144849021;
 Tue, 24 May 2016 19:54:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Tue, 24 May 2016 19:53:49 -0700 (PDT)
In-Reply-To: <1464142437.20948.28.camel@aj.id.au>
References: <1463713461-5444-1-git-send-email-andrew@aj.id.au>
 <CACPK8XdAJ5U-mrWgb99-SQdZTrn+WoZKV9qbPmOpXhyJ7YCDtg@mail.gmail.com>
 <1464142437.20948.28.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 May 2016 12:23:49 +0930
X-Google-Sender-Auth: ac6GntaYP84NKE8zEjcxfsyiw7Y
Message-ID: <CACPK8XcG-M2cbw4iMJ4imPNDV8ana-EyBn_P8Qmc7kY11ToruA@mail.gmail.com>
Subject: Re: [PATCH qemu] hw/timer: Add clock value matching support to
 aspeed_timer
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2016 02:54:12 -0000

On Wed, May 25, 2016 at 11:43 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> > +    for (i = 0; i < ARRAY_SIZE(seq); i++) {
>> > +        next = calculate_time(t, seq[i]);
>> > +        if (now < next) {
>> > +            return next;
>> > +        }
>> > +    }
>> > +
>> > +    {
>> > +        uint64_t reload_ns;
>> > +
>> > +        reload_ns = (uint64_t) floor(t->reload * calculate_period(t));
>> > +        t->start = now - ((now - t->start) % reload_ns);
>> > +    }
>> Why is this scoped like this?
>
> Because reload_ns wasn't relevant for the loop above, so to make it's
> useful lifetime explicit I scoped it to where I needed it.

Yep. It looks a bit unusual though. Is this a coding style that Qemu uses?

Cheers,

Joel
