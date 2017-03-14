Return-Path: <raltherr@google.com>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vjLQM0brgzDqY5
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 03:52:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tkICZtz0"; 
 dkim-atps=neutral
Received: by mail-it0-x235.google.com with SMTP id w124so34484588itb.1
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=cHe5k2fWtZk7gSW0RncVqOTz1bJsEtCXGdFxY9cv7aI=;
 b=tkICZtz0OVBcePuZM1tHWTmwxLcDAWUIxWAzbkRCWMiBcpcdo1xtEwrnAnDvuK78lc
 y4uxPxUa1V6Sp99fH4YJ5eW6+xhun0/QvB6DrzeXEQp6dTQJBO0KbhKnQ/JOWXCsKRns
 toNhwlpWTUU900qkQLWNwK9o+kWWUPO5r4Nh9oEBkJ2flxfAjEtQEAshMiuQaFh6RRdL
 TdwM6wvNZq2Ar02/lX0gECJEhj27EwwQgPLdQ0b23aEBfqxOIGr9a4gOalGiAxlifX5b
 he6G46DboLNwZRlE9EW0nD0gojxqDk8qOv880ckU+kevvBcRt5NZ1vGDThkGn433e7Eu
 VH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=cHe5k2fWtZk7gSW0RncVqOTz1bJsEtCXGdFxY9cv7aI=;
 b=kXsHgZu0ORCIO3/e/I75QftRMLsi/aEFBOurleq4DcFXHAGFjMfeKR7sTiNSn8d/aP
 gT3vxOZdNUJvryC6VKQl4yDYy1wNBaBgFDfqZDyoPyW7xtU+iW8Fzu39RLb4Z0wZuDj/
 RHaFtTpsV7rrkwU6Zx5uv1cuMB9pGzfzXJofoPdHPfOY7hPboO7d8ZarOJcGp9juliwQ
 gilX3XRf31RrVxf4UtiZBWyxjS7OMGJs16vA1KGVJuq9hmARf+24wBtQg9dyY1UOqrRt
 3j6RWP1c1mH2KeXqYTIPw/kwgpqSJEG7sOzRq+N5xTPMoV2upJov356+SDkffR+Ae6Yb
 tnwg==
X-Gm-Message-State: AFeK/H17u3OTIP+PYOyaw703JiggcjvCQm582NcY7D0JuvCgYYhWiCcU/nsQyRvWdnbbqmMlhUgC1GarBMlV578w
X-Received: by 10.36.62.132 with SMTP id s126mr17643333its.28.1489510375407;
 Tue, 14 Mar 2017 09:52:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.109 with HTTP; Tue, 14 Mar 2017 09:52:54 -0700 (PDT)
In-Reply-To: <20170313180242.GN19897@bill-the-cat>
References: <20170313180242.GN19897@bill-the-cat>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 14 Mar 2017 09:52:54 -0700
Message-ID: <CAPLgG==JGZEMT1X5AjQbwYFA+fpaAAbRhbBVAVGrVknbbBAtzQ@mail.gmail.com>
Subject: Fwd: [U-Boot] [ANN] U-Boot v2017.03 is released
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary=001a113fe526d163ca054ab3a86e
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
X-List-Received-Date: Tue, 14 Mar 2017 16:52:59 -0000

--001a113fe526d163ca054ab3a86e
Content-Type: text/plain; charset=UTF-8

AST2500 base support is now released.


---------- Forwarded message ----------
From: Tom Rini <trini@konsulko.com>
Date: Mon, Mar 13, 2017 at 11:02 AM
Subject: [U-Boot] [ANN] U-Boot v2017.03 is released
To: u-boot@lists.denx.de


Hey all,

I've released v2017.03 and it's now live on git and FTP and ACD (along
with PGP sig file).

So, some biggish news.  As things stand today, this is the last release
where the Blackfin and SPARC, unless a new maintainer wants to step in.
The currently listed maintainers haven't gotten back to me of late.

At the high level, what I want to focus on is that I believe we're
making good progress on Kconfig migration.  The above architectures will
help bring down the number of outstanding options, and there's a few
other patches available that will further the progress here.

Thanks again everyone!

--
Tom

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
https://lists.denx.de/listinfo/u-boot

--001a113fe526d163ca054ab3a86e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
X-Attachment-Id: ccd8443ea8d18c1d_0.0.1

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxDQoNCmlRSWNC
QUVCQWdBR0JRSll4dDdDQUFvSkVJZjU5alhUSFhaU2hja1AvaTZqQVVEWGxMOVZ5WUJmVERqaFVj
UGMNClVZYWxqLytVdnUzYVVUYnRQaDhOckRndG1BOC92NHNvUzJHVGRSVEx1alVwZGRjSTdyUFFw
TUtNTkI0d2R3YmQNCitJNUpaR1c4dUF2YWFFRU1wWHQ0VkVKNjZPM2lKVW1BV1R4TDI1NU0reURt
ZFNZOEVqc3l1aWZPNEJERGIvdlUNCnJIVGIrRkQvcTRBanVJYjNCOHZCOWJ2dGVaQ3Y1Z01ZcTZP
dThFWjZJZmM1NDdLSGhpeGNvQUZjS2llWk1Pa1ANCkcxOTRJTVg2VEkvbnNDZytQTzNWRXZLZXBH
a2JVQjNwSFlqRGYzOWpyOVk0ZzlDNHJmM0VNWFdWb2hBNW1XTEMNCnFxRGU5cE1zZUx2d0pCLzkr
MWp1M2wramptajBsYjdRd0dqYUxJVUdhOTBtZDh6V1Y0NXhHQlJvY0wyNm5mU28NCjZvK3pLdDNy
bTNYbGxwMjVPbjZwdk9FYTlZek85S3ZMQnVMM1pDckV2RzZzcFVRbm1SQ2x5RjJxeEJZc1QzUG4N
Clc4bW4ybFNuS3B6dkV1VzcyTE8rbTE5b3dnSWQ3T0NFNjdVeTBHVG5xQWl3cXJKeUhvdjNHREJQ
MUFzY2FEUFMNCjQvTXpMRHQ2dk5Ka2F4amJBK051MkkxSXlWMEdaeHVVbUFwTnR5RG05MzRLZ3dt
SytlL1ZFY3R2a1Q2MkZqMysNCnY4eHdqUDNhZEtONkVGTXI1NTVhdnRvbTNxYjFQWEVWMnQ0NTc2
eGNudnIvOXdKRVliRU9zek84YTBvNkg1Y24NCjNFcm5kd0JSWnFPeWdnSHc3MC9TUWFNUDhkY2wv
WHhmOHI3Ykc3RWRPQ2tRQnBKYW9CS3FOZmp1ZDc1OFFFT0kNClRlcnNxVjJJd1FrcS9EOHE4bUFR
DQo9MDk3bw0KLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tDQo=
--001a113fe526d163ca054ab3a86e--
