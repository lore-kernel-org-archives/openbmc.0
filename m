Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPf3H1xt9zDqKq
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:42:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l3GmXSz8"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id l16so2543887ywb.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iY/oOglUDBN5XYryvE8A/YwyySycDckokpl/KCYG3oI=;
 b=l3GmXSz8bCIdWUpyKjiGYLzMNPwL3Pw1pBRWt2sieccGnwEXEMCPPqK6bMtc5Tcdeq
 VPJlmTE505nMD02vfnXU/DRFcuZ4UPH0swLZEkVgUb9fL+c51zQmQ6IOzFQtkq3Hmd59
 laZ9oxLS+MoF6viIqow6r6tHY08Hh/Z0rMqLSlg05NJzlYLSFwCH6f563h3hjoNr93uv
 XR655ma58FtkwOUbhxG6KX5YkFwECJrQ4pFhRaHf5Wr3DB2UmFr02Df2R7ZepXjdeQDX
 wVY4Z4gD7RtmHHgp4RXvnYCvq81E8AmX2MMVN3u+X1OSR/4puRaamV3hz0WtZ4+gaIld
 E/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iY/oOglUDBN5XYryvE8A/YwyySycDckokpl/KCYG3oI=;
 b=qo1SYTUHNHNZBgPK+yUXQEUHdJtU95EnTOXDttSjQs5iYwzrxvYB2w1keyw6VKOkkS
 12MPn7AvOHf5kj/9ZNmnc0CegV/E9mEVxBDvNHv5AcsSgXyrKOrUnLQLsmSTNJH6kkgn
 c6MsxsLDAbvV1Ja3LdliDxyHAU1VfcAtqVzqUutJeaZL1OCdX21dRbjT6bUBxMcAmLsS
 rOryFlpG4qJkLNnS56zApMAEw4hd7gYbilCwARsKnia4hxGNqUPkm6D4lZHiDqAQockE
 hF+8GIV5kh1jAXDTp2x4z+9WvWJ10CL7s+6hk11rbQlYYEbnLkjQDsfvMY9s+NtCh0zP
 cmTQ==
X-Gm-Message-State: AMke39n/tsh4UK3kjGHNyMdbsq79HQNIyZRiBhFpYuoG6XPnEV/uEwKs6iF5tZfR65l+ZijM+h2ttnHBvYD7YA==
X-Received: by 10.13.247.134 with SMTP id h128mr4997642ywf.56.1487302921214;
 Thu, 16 Feb 2017 19:42:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 19:41:40 -0800 (PST)
In-Reply-To: <1487302684.3661.40.camel@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-3-andrew@aj.id.au>
 <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
 <1487302684.3661.40.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 14:11:40 +1030
X-Google-Sender-Auth: U4zWFYMIK964-fB1vN0G7D44ClY
Message-ID: <CACPK8Xf-M-J838adk7Yre==y4PF_-6xHyfacs=WWy+NY8XpQPA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 17 Feb 2017 03:42:03 -0000

On Fri, Feb 17, 2017 at 2:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2017-02-17 at 14:02 +1030, Joel Stanley wrote:
>> On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au>
>> wrote:
>> > Required for pinmux, which tests some bits in the LHC's IO space.
>> >
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>
>> Large Hadron Collider!
>>
>> Does the ast2400 want to know about it's particle accelerator too?
>
> Nah, the ast2400 doesn't require a particle accelerator for pinctrl,
> and I don't think we have any other reason to need it (yet).

I think we need it for mbox, assuming we end up enabling ast2400
platforms with that functionality.

Cross that bridge when we get to it.

Cheers,

Joel
