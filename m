Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHCZg6ZfvzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:28:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ooExloWH"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id b2so5657195yba.3
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Gc1OmKUpVY36TVNh3LIfbVxK5svzSNistjNebd+mNE0=;
 b=ooExloWHTjBj5kMxGnY/LU9GLiuhO6fIeHLWAA7fGnVjIxQ3mM42396n9ZR3sgLhhb
 kJdhTLtiIyBBhAkXN26ML/6aGsNFCDaNMtj4DYfzjFKlsiFa+Dhf5X3Ixt9sFWQzeyf0
 m1Dp9WwYwIXvnOa5A7RlQhmFRpdnwN4t25jbtQ+OirIXAaoZfRZzA5y/Mts2qGM34s6X
 ogVDmiA8t/lqAydDqUdy9yI+b6HbgKacVRLEASQ1jXIhbKNrZqOGXa+zl6H8NMKyktD7
 2+4W0EdwBAjxvz0kOiK+2V+NJIOG04y/F+UBcTD67W+MNmDN8cBnljsLZEPZ0fZRgvz1
 R2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Gc1OmKUpVY36TVNh3LIfbVxK5svzSNistjNebd+mNE0=;
 b=DidPwCaqgGRC5ktE5pUHFGbFBQFgTzlc9tl5BFwSmBKRbsc3J+4RthQQ2ONHhNxmWi
 vGTuh63YijTRB5iRH/0U0nRKcqSEA96dw5IC+fkin2gathwU0EpoFFUJdiknqTAIID5q
 NWGSy+nCilzc4o67uA4Ewh8eNskmbqyP9YFcIziiCg3rsHjRmaVY46uRo+231hSD5PaG
 /Vi6rzWW3npJL6UH6OAa9ljmlhs6oE9SSl5MzVIMkgaqlaA2iFj++2NBj/uEsrYk0Se9
 /RR99Fnu4SDWHomPWDitZYJZ+oYvt+/Xv13672ocrhQw/XaX4G/c6EHsXBIfHuEo7/I/
 PMQg==
X-Gm-Message-State: AN3rC/60YliT86Xvegh9jGrJqNcbCJwPUckmCny0C+Yubyt6zFqVNwBa
 yY8LG3hHeZ9KsNvBzDx/gu3uHkQWvg==
X-Received: by 10.37.76.6 with SMTP id z6mr23771049yba.77.1493710121774; Tue,
 02 May 2017 00:28:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 2 May 2017 00:28:21 -0700 (PDT)
In-Reply-To: <1493342802.4433.8.camel@aj.id.au>
References: <20170428011805.22513-1-joel@jms.id.au>
 <1493342802.4433.8.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2017 16:58:21 +0930
X-Google-Sender-Auth: aH0HWTFw60JHFWYn10E86JUn4dI
Message-ID: <CACPK8Xdf6ZssagJ53uim14Y4LmjdGwspCWH383sv4by0_F-Qmg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: Update i2c binding
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 02 May 2017 07:28:44 -0000

On Fri, Apr 28, 2017 at 10:56 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2017-04-28 at 10:48 +0930, Joel Stanley wrote:
>> The I2C binding changed when upstreaming the I2C driver.
>>
>> This adds aliases for the 14 built-in I2C busses to ensure userspace
>> sees the numbering that we had with the old driver.
>>
>> This change moves the description of the i2c buses to the bottom of the
>> dtsi to improve readability.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.10.

Cheers,

Joel
