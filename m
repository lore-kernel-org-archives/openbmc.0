Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttWLr62TvzDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 11:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJrwR3tz"; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 96so28871844uaq.2
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jan 2017 16:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DFKITCQMFVMBB7kDjBpGHHp6hv9BgxaSM1fK+TgZeGg=;
 b=hJrwR3tzHJS+9MCwIYj3jmBgCEP7xZ/2xfkNcJ0oJeA0HOWe6T/AYLlCsqRkL911DQ
 vUSEsKogiEStiDbfQMmbRLree79mGzip1BSGFXaJ/04S8QpIhEI6fBPVWTL+rgpuElUl
 wnc8Hc2vNyE5jn713rT8CNcNFgaR6eHFqvSQEDOOMXoPq/Sj187JwAStQIGiY223ukIM
 AmenBENewmRhFhXgSY9SnxX7t4WJgeIqowayc7SlWv6Alv0i1m5zylRhWc3hHbDgo6bk
 a9ozvHgjTNutnX4dDy514cKzTTWBK+hugxlPOTB36sdywFuWmIjo/pcf3+JEBf/vYiHV
 Rpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DFKITCQMFVMBB7kDjBpGHHp6hv9BgxaSM1fK+TgZeGg=;
 b=XLWYhncWdI4n4qrq2ROgrmguYZCHg/B19aJ7aqeGZz/k3W+IanI6yrzO4kxoPmiPTw
 rUWMS5dYlbC6ZSvYtS8Rm2nIZrxi2eA74NxXkKS/J7vnT0Qk7J/GxXywJ++RoH5rNqrF
 un9Ky1Yf7BDyrA0TRma9aDyK1hAVITVEktHT7fOW8M4AyrIhswMS7w+WwF4ipAolUqys
 6C+qPkIci+ZMhSRjYPdTUKHWEXKEekhcAfwUbKniOAFBV5oNNp4DMkUWvdb8x3Cd8waY
 vDoz/PdO/0IiABUx8QFZdyyXj+Qtz+qddUZCzKGWABsJ9OKFA4dBKH5IuFAUEjLT7gJi
 f5TQ==
X-Gm-Message-State: AIkVDXJcBeMe5uMme2R+46podPr+D3VXdIEgJywikzSR1vKjwrOcEV13AFEb3Gx8jj4O/qNz509YsF1K38etRA==
X-Received: by 10.176.71.86 with SMTP id i22mr32683095uac.31.1483488386272;
 Tue, 03 Jan 2017 16:06:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Tue, 3 Jan 2017 16:06:05 -0800 (PST)
In-Reply-To: <31B08FA3-465F-4C0F-9332-0FAE909BD706@fuzziesquirrel.com>
References: <20161230193404.GB8516@roeck-us.net>
 <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
 <CALpMbdkw1QQZfDQ+NA5WbxrjCRLh0C32Z5eWjuzbk4sZXxQHPg@mail.gmail.com>
 <31B08FA3-465F-4C0F-9332-0FAE909BD706@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Jan 2017 11:06:05 +1100
X-Google-Sender-Auth: QW2rmCkOYbZBFxgxdlvgNSiK3jg
Message-ID: <CACPK8Xfam48UvwggUuWGD-hRAay7hndnTocprE5Tyw=+Lpd3Og@mail.gmail.com>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Eddie James <eajames.ibm@gmail.com>, Jeremy Kerr <jk@ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 04 Jan 2017 00:06:30 -0000

On Wed, Jan 4, 2017 at 10:49 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> What if the driver is built into the kernel?  Is there such a thing as module only drivers?

Our kernel is build with module loading disabled at present.

modprobing the driver when userspace is ready is a neat hack that we
could use for now. However, the driver will need a mechanism that
tells it to bind to the hardware when it becomes available. The same
mechanism would be useful for the fsi driver to initiate a scan and
bind it's client drivers.

Cheers,

Joel
