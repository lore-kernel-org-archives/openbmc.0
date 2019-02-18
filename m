Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ScOZBvuy"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442yFP56SzzDq74
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 19:48:25 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id h6so38011926itl.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 00:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxzRwxpRy1xNaqq6WnOyw/hR2S9R3OgTLxFavICayfQ=;
 b=ScOZBvuyzyiWrmZ32+AaJKduHBxl8BfH0DKX4jJHlJVxkDFnHAvTn2JVhIGCVLKx54
 bQb8Y7M/s9otJ3gXMn7YYnFx/S36AmXxptlzIcnCiSxPbXaqeRdJA4nXTpPpGHbDVhSa
 3XliJrKMVUFlzCn+kHrI1hgGECVWNAxyIRtQIoID8eYeZK9e90J04pvkAf9iGihGZu0V
 QK8V7XQHJayl5pMpKDpg3Qq9twHleroE665+bRMNNXEg5jtkX7mjRbUCun0u5k7+DyDP
 n19aUKzwkn9usCr++dIBuOPtrkvW/M6KwcVw2wBRNJEIBvpFTH9jvo0UX4mDgW0qfKD7
 ipLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxzRwxpRy1xNaqq6WnOyw/hR2S9R3OgTLxFavICayfQ=;
 b=HeMv0Nl66KrR7I6Mhz79+pR4dURLZ//sPFZeLezlivrEwQ1V57gUgd04RSXSN+3lQM
 FueX8/krGJSwjMS0h4qcxyxgf6bRHV57ggvP2toOFWbW/N22wmsOyD3aMgPa3GgRVl56
 mqanBVGtEAPy4m+y9F7UJZ6wnvEWAVvh1Tte1aQS7XcFvVmcb5ntI/CNXuv2nuquvLkj
 FFuAYBOfWyrptoYuSASPh1sTYWgkq5cuB2s1ITAqZDESkb4qGqyDxyzYgHaVqgvJ12HG
 XI3KU97QLgNUeDdI02kFUc2zbCWLXvwsVR2VfGjZRg3/v4FZRol1AcGKqwT23T6c3dlG
 Ctwg==
X-Gm-Message-State: AHQUAuaW9nxl+RzkYKug61yKkB5wL+6Q36eR95JU2hm4EPX52ffEd58v
 WTy6Jg/XEFxeysMQKx8kqLqL/MqjnUKpROzEzDs=
X-Google-Smtp-Source: AHgI3IaTy5BTkcfDKwn7D0p4DHnYy3OQwyF/XVXNqPJG9433HS30w9+igvmhOfoKrvFo4z74gjqGRraSGgt9fzdp5is=
X-Received: by 2002:a6b:fd02:: with SMTP id c2mr12190712ioi.156.1550479702978; 
 Mon, 18 Feb 2019 00:48:22 -0800 (PST)
MIME-Version: 1.0
References: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
In-Reply-To: <06f35a3e-2d73-f973-8a45-fd38282fd1ed@gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 18 Feb 2019 16:48:04 +0800
Message-ID: <CAARXrtmRpsTEQAWdBEvXTxvzOwAJ7RoHqGWdcA66NPUii9AZBw@mail.gmail.com>
Subject: Re: 2.6 Release announcement
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2019 08:48:26 -0000

Hi Brad, Kurt,

The 2.6.0 tag is a bit weird, that `git describe` does not correctly get the
latest tag:

    $ git describe
    2.6.0-rc1-242-g073a600a0

This results in `/etc/os-release` to report the build is not from the 2.6.0
tag but from 2.6.0-rc1.

Some investigations:

* Both `git describe --tags` and `git describe --abbrev=0 --tags` shows the
latest tag is `2.6.0-rc1`:

    $ git describe --tags
    2.6.0-rc1-242-g073a600a0
    $ git describe --abbrev=0 --tags
    2.6.0-rc1

* The only way to get the latest tag is with below command:

    $ git describe --tags $(git rev-list --tags --max-count=1)
    2.6.0

* It indicates that the tag 2.6.0 is not on the master branch.

    $ git branch --contains tags/2.6.0

    $ git branch --contains tags/2.6.0-rc1
    * master

Could you help to check and hopefully fix this?

Thanks!

On Sat, Feb 16, 2019 at 2:44 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> I have not been successful (yet) in trying to get access to our
> openbmc.org website for adding things like announcements. So, I created
> a quick release announcement on my personal blog to spread the great
> news about all the hard work that went into this release!
>
> http://www.kurttaylor.com/blog/2019/02/openbmc-2-6-release/
> or
> https://twitter.com/kurtrtaylor/status/1096473964350791681
>
> Kurt Taylor (krtaylor)
>
