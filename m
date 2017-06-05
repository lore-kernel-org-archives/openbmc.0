Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh4326RcxzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 16:02:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hdolr/hS"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id w143so1169864yww.1
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hSNhZKi9gXKs1lDB59e2zzol3JkYS9ltfJSmeWhMBAM=;
 b=hdolr/hSfShBgC4W3UQsX7WyKhLSKkAy4ohIHnXoIDyahgQO86UiqcbAApMoKh8jeo
 oj44IoBY4+cldLhmatWmuwylpn7kdlOAWq7sHu48+9o3O8+3yvHPc+bPTc3wm2zR3rNg
 RYT/OTC2Dav2zDnDQBYulszsTtU4GLw0Zbg6fbY8dTi7mLT9GjyXFKWzC5OEh6icFlOc
 /L3GnDwKm8weMhqwupAVYtlVg8Df22GfMVqlqBGGSgwZ+XxPd/+ZW5M6pIZmnhgrgByi
 2EL6ojSx2tjMCezuGv1jwSUtzwwC3hlMypKchHcsixzvqLPQPoxdpWNi27IhaPokiS2x
 jbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hSNhZKi9gXKs1lDB59e2zzol3JkYS9ltfJSmeWhMBAM=;
 b=DnPNVMAMXureWCD8h6k4SnmxuAXGcnz5R0FvAT7bjH05M0gqxdhA1j/WRNuYwwId8j
 4Pzzruq+pWleZiT8KmrORtY6Wd4OoqikiOtoPCr1oGxNmghIRrqvB0nwAvVFRwz+Nd4T
 d3zGZTAWfcQPfIYH/rSrmUJYMEvlqj6y86gndjPAYfoJx5AC02sNRjvRcRLyDoTADF1H
 Kbi1gPUIpihwXJLHdeUk/SmRWkQ+ui7h2QOAObstLplFoSX8i6dfkslGkXIsrTTwA8wA
 7PQ2n5ZBxxdbSglwPpEHP0qI9/gPfkkyEqpLEDJCwLqdINczDfC6QMsEJxP/Pauxx9VT
 lEhA==
X-Gm-Message-State: AODbwcChmANEClJY3Ns6Hvsh02ZPSowo/0ic6KzuXR2Ea2Yyl/OzfY/P
 PjcwAPNUWLW43A+vPl6yp/EUafYF+g==
X-Received: by 10.13.225.196 with SMTP id k187mr13593174ywe.178.1496642524918; 
 Sun, 04 Jun 2017 23:02:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 23:01:44 -0700 (PDT)
In-Reply-To: <20170602062208.15999-1-andrew@aj.id.au>
References: <20170602062208.15999-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 15:31:44 +0930
X-Google-Sender-Auth: Y49D4vnFzMjUVuI3moh2USXgrmY
Message-ID: <CACPK8XcGGbbsTZ+pv3xhA=ZRUPeoZgp28U3DvvnMpxtqEhrQkA@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.10 0/7] Add fast rotor reads to MAX31785
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, 
 msbarth <msbarth@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 05 Jun 2017 06:02:07 -0000

On Fri, Jun 2, 2017 at 3:52 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> I've dodgied up this series with a patch to the i2c core to make the fast rotor
> read documented in [1] work. Thus, it's an RFC series. Further, the fast rotor
> values are zero on the machine I was testing against. Maybe I need to broaden
> my horizons and test against more machines, but I figured I'd send the patches
> to get some "internal" feedback.
>
> Timothy's original patch is reworked against the new hwmon kernel APIs. The
> rework made it easier to support both the 0x3030 and 0x3040 firmwares for the
> approach I took, though maybe there is a better way with using the hwmon
> attribute visibility modes. Further, it's still not a pmbus driver, so it's
> probably not yet acceptible upstream despite the fact that upstream still
> doesn't support fan control in the pmbus core.

Looks good.

I suggest we send it upstream with patches 1, 3, 4, 6 squashed into
one. Make sure we retain Timothy's copyright in the header.

Instead of using your i2c DWORD hack, use i2c_master_recv to do your
four byte transfer. Call out in a comment or your commit message that
the smbus spec doesn't define a 4 byte transfer, but the device needs
it.

Cheers,

Joel
