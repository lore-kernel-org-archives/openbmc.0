Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::231; helo=mail-it0-x231.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oh50qeXH"; 
 dkim-atps=neutral
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q3QZ60fqzF0Tj
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 12:59:17 +1000 (AEST)
Received: by mail-it0-x231.google.com with SMTP id e185-v6so7512216ita.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 May 2018 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8M6tEO+G+qMt2CAi8ODOqJhlelxwu1xOE+WaLFQI+38=;
 b=Oh50qeXHHoZ7/MLtYxUMceTwKBOAs4bGqqXv9CHDKbivBkdjD/TznQtZ35JUxJdETq
 V9DyJGz9UkR7igsaALH0XeE9Y3oGVePFH2cgRxaCfNgz8sw9oP3/JhsgsfdgEbNarn2Z
 dF1JOX6XT9YJXWQBta2u7QZHfryl2NwKPzWmAVDBfv8EXsorit0TwLmbnYT/0tQF0Sk7
 JCyg0xNMd6LSQbMjRjomrX1rMhjMRiqGIg7cI6H3niSVv9cI7cl3LSVRtVMrCehtARhR
 DQr5eyS5f9A5xJS1rM9my+5dXXLBaTY1uBk4WeyH7o1Pax9fLYPTgPXYe9YmpxipE/3/
 Ovng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8M6tEO+G+qMt2CAi8ODOqJhlelxwu1xOE+WaLFQI+38=;
 b=G07EpRoFkQ9nEhgwDnUQ/9iDkpm8kEHCw8fzS+mlifMKQw+ZVxjawxAeGXbWMjfy7m
 mn4+J1dopMjf+/s2qxj0X7VRzlyFpmmKFHvnp8Pmr9lm4WlFXBGJx0/rWXoTc9m+g/QL
 ZGy6MNKhRw/csEHLJqLIqIIRF3Xcnod9vUI/hH0SZjFHTkT/oXHOjgw7DDkIE+yvRen6
 j0i9GB+CqhJOD5ccq5t8tk9fQzIi4Iuf78sJAgQoaUJK2t4ADWBslrsnFyHqiPBbrK71
 nLSbgn8/UESCotTdV+FQGcnabR0mTPYFVnptiF6vsidvTlRveedSatB46ibNApW2wALt
 EMTA==
X-Gm-Message-State: ALKqPwcK4XrHm3Y5rPQUxVWGQj/LOkxyrLPDNZ/qhTmEW5enKvw9Ccb1
 okh6IBdQLAqCSayJuMbMW/nrBevABgFO4a/JWx4=
X-Google-Smtp-Source: AB8JxZpPPa2YMVRUeBDj0X+xmKnFh94SQEQdiLzMdSqDdYMuKXFnKg/xvRmFjvtA3BwYMvGgUCcJHe83KLU3jzLEg7o=
X-Received: by 2002:a24:8d85:: with SMTP id
 w127-v6mr15090503itd.22.1526871554986; 
 Sun, 20 May 2018 19:59:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Sun, 20 May 2018 19:59:14
 -0700 (PDT)
In-Reply-To: <CADfYTpEb25ex9znunS1xBtWm7x-Zc8VOw2wAQ33B1NT03rvouQ@mail.gmail.com>
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
 <CACPK8XcTC_BnxVCW4fEymcfGGwpOPGY-cOhWx_1MfhJ6jD_stg@mail.gmail.com>
 <CADfYTpEb25ex9znunS1xBtWm7x-Zc8VOw2wAQ33B1NT03rvouQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 21 May 2018 10:59:14 +0800
Message-ID: <CAARXrtmUQHcZi-3dHaY1smbc9stBt7TLANqgMm3E=GUQvv=3fQ@mail.gmail.com>
Subject: Re: OpenBMC Fix-It
To: Nancy Yuen <yuenn@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2018 02:59:19 -0000

On Sat, May 19, 2018 at 3:13 AM, Nancy Yuen <yuenn@google.com> wrote:
> :D Happy to have you for any part of it Joel!
>
> ----------
> Nancy
>
> On Thu, May 10, 2018 at 5:43 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hi Nancy,
>>
>> On 9 May 2018 at 04:58, Nancy Yuen <yuenn@google.com> wrote:
>> > Please join my team for an OpenBMC  community "fix-it" event in June!
>> >
>> > My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
>> > part of a larger fix-it initiative. OpenBMC is a large part of our
>> > project
>> > so I'd like to spend part of the week on a fix-it on OpenBMC.
>>
>> > Anyone interested in participating?
>>
>> I would be, as much as is practical given timezones :)

I would be interested and would like to fix unit tests in sdbusplus.
But I'm not sure a different timezone (GMT+8) is OK or not :D

>>
>> Cheers,
>>
>> Joel
>
>
