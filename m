Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqYhk0vcmzDrPb
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 00:41:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uU3NCNOF; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id d132so1314692oib.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NClZODfkK56S6Lw1BeGsDOj9cgxH7JqZm/98kGx2zKc=;
 b=uU3NCNOFjqX7iCQbqkkhsBgYL9ZzfwRJQUf+3WtaSBXKdQpEv00jInsxsry9Dc+2Bo
 qv9mULLL1KyCL3Zlh6WqEPM2kew+EoNUfP84dgltfacSjFi8Y5Oyu+AusQRHnFU66s3g
 KPC8Ybpi9BZZ3U6+vTwJaG719wuO40diUm5c9XY2m5ZSFo+ZhdExvLbK+f+yno/HVeXc
 WrX98hBNNNWSw0DsPjeJeIyYejabRHNcSxh/XikbePmmZVN3j2aO/+USpmGoqOg7qgQ8
 FrYHHeH9ifRrJg5H7M0KEplAAOEu3xoMutlTp44cWWhnKWiSC9fiqXT2ErkMkYww7/+T
 CQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NClZODfkK56S6Lw1BeGsDOj9cgxH7JqZm/98kGx2zKc=;
 b=bx/avbzrwge9IZkzrZPlSqTNeYQuoih4Lbag9Jwp8mJT5qlEDwpFYi0dHeQlA9arse
 s+LVxx0QVWQCIJc7etq45zP1YbiFaFDiLsA0fdKoh1abkw2XWt1jy08uCjnGpdqZcNse
 7stsa/TpOdg2kqLoiLfffLfQAioYyvf6HuHTZKvGagI8WXiAatVqNQhPoezs7rBPWz9x
 iZ5SITwwymJy5DtdvrjufKSubi6p9GhAl/2CeAzyhHpovlP2xeW4oLcAWGyYIGjU/Ewv
 v9wwshAzTNy3qwJmQZnf6MR1O/Z8erjMFexC1Gk7ufwV0BJz50VQ5f6YbrPZ99181D84
 vaqQ==
X-Gm-Message-State: AA6/9Rlu2amEn4d9tBGWAVyOAoJLgHImNmiJ7XRQPBltSS6p9vO6t0Cn6ZYSjEadiHKUMHS4X/t2ono+rtl/UQ==
X-Received: by 10.202.106.194 with SMTP id f185mr12166637oic.38.1475761284390; 
 Thu, 06 Oct 2016 06:41:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Thu, 6 Oct 2016 06:41:23 -0700 (PDT)
In-Reply-To: <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
 <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 6 Oct 2016 08:41:23 -0500
Message-ID: <CAA0LjjV9EUp8L6tpzJbPcmycMVZWvfdBs6jWhuHW-fMfWAK97w@mail.gmail.com>
Subject: Re: [PATCH linux 14/15] drivers/fsi: Rename slave to cfam
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 06 Oct 2016 13:41:26 -0000

On Thu, Oct 6, 2016 at 1:58 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Suggested changes to the patch set so far as provided by Jeremy Kerr.
>> Rename slave to cfam to distinguish between the slave engine and its
>> containing cfam.
>
> I'm still not 100% on that. As is my understanding, a (hardware) CFAM
> contains multiple slaves, and that not what `struct fsi_slave`
> represents (it's a single slave).

In redundant configurations yes there are two slaves.  However, any
controlling device driver would only ever use one of them.  A redundant
system with its own fsi device driver would be controlling the other slave.

I still maintain that there is bound to be confusion with slave->read( )
etc... which are meant for accessing more than just the slave engine.
cfam->read makes it more clear I think that you are accessing some
range within the cfam, not just the slave engine.  A cfam acts as a slave
in a general sense but it doesn't distinguish itself from the slave engine.

If this is a big sticking point I'll rename it to slave and deal with the
potential ambiguity that may come up later. I'd like to move ahead
with the rest of the implementation.

>
>> A few formatting changes to make checkpatch accept
>> patches 0001-0013.
>
> Those would be better split out. If you like, I can then take that
> change and re-roll my original skeleton series with that incorporated.
>

I'm not sure what split out means in this case.  Git am applies each patch
in sequence so those warnings will be hit before any patches I add to reverse
something are applied.

I know we had discussed last week about making it clear what changes
you had made versus mine.  As per discussion I left your changes as
is in the patch series, then made my recommended changes as the
next in the series.   A bit confusing on how to deal with checkpatch,
git am, ... in those circumstances.

> Cheers,
>
>
> Jeremy
