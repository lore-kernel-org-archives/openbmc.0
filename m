Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vD5qb2lmWzDqFq
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 01:58:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="CYXzGdmi"; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id j18so158079790ioe.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 06:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MSuyUfyDrtxXu9y3As06PRbzKhCB+I3j4RENBnnXVVc=;
 b=CYXzGdmiIKY1LjeDwcepRdFLgJptgiH9VN6hxT+7EezJmLAtKdYIZ0AVYk1Y8/FEjj
 lELqSWcq+oOB87RBtaR7faPUloXskg/KX33JzVqXmUPJTvXJUJGkDQzneCOVBPJUhIIw
 Lzd9Zds/5y34YIrnw+dsIiHmPgTboUZZobILI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MSuyUfyDrtxXu9y3As06PRbzKhCB+I3j4RENBnnXVVc=;
 b=JUP0ZpLxTvcxhvN4GBbQOmNS3fqwKHWUkHL7IucGLW3hpodtS9Gc5zjuH459BFH+B4
 zDUpimIqfEaeLgRM31VPJS/BojalnYaZAloibZ4OkBsA8XR5hGYgE+uEevfuduPodRFU
 +rhcMw/+tz3jXkrVu7bXN5kz8CF1I6ZNKGBfCqmRnIBHRlqdDDtpw1HLJO+cNuka1EuD
 Ci5REH0Qb9l7GtwhcvWMtyUgUAUkn5zUHBQsVLmSFUIrb0VvzfINkYVWlZwz+X3fFSuC
 5nRQrFR43F3IbAwHDWHjMv2SBHH2+g4SctG8dbG+NFsLItAQXCOWt3k2DjXf9odz0PYC
 tOKA==
X-Gm-Message-State: AIkVDXLbnQW8vfyc+fLsMXe65ywkB7frO2hz5EQWGStncLTodvRtyXLtPqb8Xukw0jFK59Owlm5/miNRZDJ02vmD
X-Received: by 10.107.15.12 with SMTP id x12mr2355574ioi.61.1485961129109;
 Wed, 01 Feb 2017 06:58:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Wed, 1 Feb 2017 06:58:48 -0800 (PST)
In-Reply-To: <1485912024.4137.36.camel@aj.id.au>
References: <20170127042442.28994-1-andrew@aj.id.au>
 <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
 <1485910329.4137.34.camel@aj.id.au> <1485912024.4137.36.camel@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Feb 2017 15:58:48 +0100
Message-ID: <CACRpkdb-s8wgqwuYHEKHGRyu3uHMWQ01Z8CJZZUmdaYuweTuZQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Wed, 01 Feb 2017 14:58:52 -0000

On Wed, Feb 1, 2017 at 2:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-02-01 at 11:22 +1030, Andrew Jeffery wrote:
>> On Tue, 2017-01-31 at 15:50 +0100, Linus Walleij wrote:
>> > > > > > On Fri, Jan 27, 2017 at 5:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > > This is less straight-forward than one would hope, as some banks only
>> > > have 4 pins rather than 8, others are output only, yet more (W and
>> > > X, already supported) are input-only, and in the case of the g4 SoC bank
>> > > AC doesn't exist.
>> > >
>> > > Add some structs to describe the varying properties of different banks
>> > > and integrate mechanisms to deny requests for unsupported
>> > > configurations.
>> > >
>> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > >
>> > > ---
>> > >
>> > > Since v2:
>> >
>> > Patch applied with some patch -p1 < fuzz
>> > please check the result.
>>
>
> *snip*
>
>> Regardless, I'll try to recreate it myself and inspect the fuzz damage.
>
> Ah, I think I see what's happened. I didn't send "gpio: aspeed: Make
> bank names strings" again because you claimed you had applied v1 in the
> v2 thread[1]. This patch doesn't fuzz when "gpio: aspeed: Make bank
> names strings" has been applied, so is it possible that you tried
> applying it to a tree missing "gpio: aspeed: Make bank names strings"?

I mistakedly applied *both* patches to the pinctrl tree, devel branch.

I blame stress.

Oh well I guess I have to keep them there and remove this copy
from the gpio tree.

If the version I applied in the pinctrl tree is the wrong one (which
is possible) then please send an incremental patch on top fixing
the difference, so I can apply that to the pinctrl tree too....

Yours,
Linus Walleij
