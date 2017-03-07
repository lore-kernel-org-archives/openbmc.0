Return-Path: <raltherr@google.com>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd8hv5bxRzDq5x
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 08:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZoMVGmIy"; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id g6so14863525ioj.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aHxxjQUk/ohvwiLvUl4e56ogILVVZd/71z3D3yFYgMw=;
 b=ZoMVGmIy6bMpW0LmljQQh9IciNLLYhJ8agVVw3ccZ5fjRQolqrJJ4EqIw8GUITV7xP
 6X+MQh60tWDkxBvG+YagAjJJ8pDyBU/pQLjq8CbxkKJdzndaixXPqy5eJGPT6z3NaayX
 9d7RdtP8wH0OFOG8st9qH09ejlCZpzoDhpWRXBtn7qg5KY9F6IyMRyQ1gaYgZ2MNmLZp
 FNnagiViRUpftEolwGX+BnJfrT+sX4vrEleNXzs0j54UezXGipAQZwnLkPOmdYkQ3vuG
 aDe0bvJQSEuKaGcU4H8cH6gdaRUUTqJdGyQigUmrl7jfspZxF64umrkoKnmYChI3qaF0
 M+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aHxxjQUk/ohvwiLvUl4e56ogILVVZd/71z3D3yFYgMw=;
 b=iBG1RNkZVk0moXiioDBH3xZYhtJ38LVukCIwMMWjk0+L8iAl9Yi03H6FziupdtDk+a
 aCsRMuGRtGw8cRplHE9Q9nckkSSz50cZ0jSGuJZbFz1FzOW1pKzezEhILu1YJgUWdA93
 z5VXIoKEXglyfreqUedgfbkLJ4TqK/r9HROv4xy3gP/YNzxSO/mJU+JzGggRLAfv8QzI
 gII6w9uD0TkLLX0wSi5ssx+byzfqxlVtR0dfPz3/cq1sNyqIeybFhivodh9al6z0WvJ8
 rgsdPEqFTI0OUiTGYQKTpKifb8K4kMqmOlwnX5qhrIOubqrTthiOyog85HNfIk5MFU9x
 nK7Q==
X-Gm-Message-State: AMke39mYkItywB4O7M8hwYX4k9j7i3sJmvTdYJ/kCTZaVty3v7eMEyBFKYPvdl1yKiKXYi6yb+9BFJiHYAJNtqaW
X-Received: by 10.107.180.145 with SMTP id d139mr3172851iof.101.1488921661659; 
 Tue, 07 Mar 2017 13:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.25.109 with HTTP; Tue, 7 Mar 2017 13:21:01 -0800 (PST)
In-Reply-To: <CAPH-5w7dkuLF_wfwxtSVsHgxCfe787twEuFa-nh2JkncP3gcLw@mail.gmail.com>
References: <20170303205920.146751-1-xow@google.com>
 <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
 <CAPH-5w7dkuLF_wfwxtSVsHgxCfe787twEuFa-nh2JkncP3gcLw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 7 Mar 2017 13:21:01 -0800
Message-ID: <CAPLgG=naqWVfr3C2yFBP9HSTR9WC3UT661fEu+ZT3_ETxp+tuw@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
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
X-List-Received-Date: Tue, 07 Mar 2017 21:21:04 -0000

I don't believe it currently does.  I'm concerned with whether U-Boot
or Linux is expected to configure the NC-SI muxes.

On Tue, Mar 7, 2017 at 1:19 PM, Xo Wang <xow@google.com> wrote:
> On Tue, Mar 7, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
>> Why is Linux doing this instead of U-Boot?
>>
>
> Does our U-Boot understand Aspeed GPIO in the device tree? If it does,
> then it makes more sense for U-Boot to consume and set these pin
> assignments.
>
> xo
