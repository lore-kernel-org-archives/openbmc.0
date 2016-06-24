Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNKN0CD7zDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:57:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=D/mp77dh; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id j2so19001947qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+op9ubmRAD0lICncQ6QxJh0aRnk8onrwr93V8s1M2W8=;
 b=D/mp77dhaWutBpXwinUJbW/bYa+bgoasCmPHqN3CmH0Wx84tzUk7agajW2VNCF3yRI
 qzILO4KF4J1Eh70PN0g1K5IEa5CR6Cw4w1zrMcS/jDwv6uJvvcFeMaLH6SsXjwc/AlVZ
 QJ4nCAXExFbj/6UJgXzsF/tbzWbEoALHajprMyVB1EW8FK4lTwZE7ZEUnGQiEBMbP5XG
 Qnhw2hcF2/ClP9b4hhAneJgJQk9s+vLnx3QBU9OWToZahoq56kGy0R2+MRg309aNDhK1
 7pxg6RdOzm5JHT9OkcO8p75Csft4JSa6ElarO0oDNO98XneEl0SzlfZusgBla5wmJ/V+
 NyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+op9ubmRAD0lICncQ6QxJh0aRnk8onrwr93V8s1M2W8=;
 b=FyRcsWIwrfQR43qM42dJ8gujkLC1//PWMjqV/dh6P0022i0bsd+Og3joI193elglM0
 wbS4zuvoHnUUVYZocvaOkQxnbVG7zx5DWmE5EiQxVWUfFkacKGuwTjYM9Jspu816LJqk
 ORpydktrKWHDbcxFGHYpluk7Iup8p+nhky0RPbxu708FJ8cj9RPYIfQa3RQ4Fc9v23Jz
 kjW/JEd+1PAA/HoHkwLxblQX2PQML7Uq+zYBbmsdfqqAcquY464UNd19klPmRQAAMnpT
 wAcl8KBxkPYkoNttdAJwgiHaROC43tYReICON4At2wRNgYOsASL08vn0gWFkKEZDQHLw
 y3tw==
X-Gm-Message-State: ALyK8tLNYS1xZS4jjNjvwzX5EUATdPmeRnb58gORCbZPemNpgWWO+ueg7KdEYbH4Sfrgv0vo2+BKFTtCoaKd7g==
X-Received: by 10.55.212.89 with SMTP id l86mr2069631qki.114.1466737030028;
 Thu, 23 Jun 2016 19:57:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:56:50 -0700 (PDT)
In-Reply-To: <576C2457.1090606@google.com>
References: <CAPLgG=kfYKVxnd1k2sEdz_sW7kLoV4ZnkDYZKkztiM9=ATcrqA@mail.gmail.com>
 <576C2457.1090606@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:26:50 +0930
X-Google-Sender-Auth: UXQGM9X_Su5WqanlqvAip6cKz8Y
Message-ID: <CACPK8XcmVbAZiVF0A0w2Dp-XzEOV0j1V4jvvc8TBGM6FWsy3=g@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Simplify default bootargs
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 02:57:12 -0000

Hey Xo and Rick,

On Fri, Jun 24, 2016 at 3:33 AM, Xo Wang <xow@google.com> wrote:
>> I believe Xo sent a PR with the same patch.  I
>> prefer to drop my patch and follow up on his.
>
> Joel et al had included a bootargs change in their new unified U-Boot branch
> so I dropped my PR too.

I applied your patch and then I think it got squished into a larger commit.

Thanks for sending it in. We should have sane bootargs for all of our
systems now.

Cheers,

Joel
