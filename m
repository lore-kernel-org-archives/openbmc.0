Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s+knTlmj"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yFMBV4KfxzDrFJ;
 Mon, 16 Oct 2017 00:05:21 +1100 (AEDT)
Received: by mail-it0-x235.google.com with SMTP id o135so15259955itb.0;
 Sun, 15 Oct 2017 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yu5Gf5WcT/x87aENsYbPYJOxZNKL3Bce7MvBvXWb4Sk=;
 b=s+knTlmj+QCu3jh30gcl0F3PFgJPx2FEXq29O2RoKoZXQMrayP5O/rYFsUtB5wh15i
 CuKW+HZsSogXSg0g0v+7nUJd8t2zws3/ndmIkKvgdcIgt5Wucngau8esW1mAZY9BOQ7R
 +bpZ+5wEBcWtbz+uLDZqfvanZIELXhVK+6cBmkv9y3aDDG0ro0BJNdG0V6a8+J33Vh0A
 6agENhP52YihR/Zt7Jm6rUgrJBNjEHsWUmnLO0hl18DHnrpX5U9lLH9eaKHAZbkmtcPk
 cGJQ1vB62dUFRAQ9tlf5UkZBFMFLNd0GH9tkRmfYR033pXRYrtuS42JB1yBxz4lSUMEH
 m8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yu5Gf5WcT/x87aENsYbPYJOxZNKL3Bce7MvBvXWb4Sk=;
 b=RP6uBSNurkJa+cvkRwRR6L1Y38nHocM122ob4PtznbgL6aFcWVRKfsjqS309Lw/SX7
 vAJe9FON5rEY1+kz6TJ0U4bX4gNi+oFSqVyqnSrvneqo6i3ZOsfFk1+T8m9X0Y0Loyy/
 lpYQRp4z5hxj7Qs1E5khRQLJJttoOUSP2qjfeGyhyr1EhNaYxDaHEg8TWi/y4VEdrgyZ
 PrBXTc6Ndg3vtJ7JRYjeG2rX/W1ZFfB7hhk7JVCRCinM3CwyWmye/1bYtNy4feEQBn9I
 GFmsXfNNkTX2A4jyXWTeIOsJHwem1gZaJ7T8QYphrTFpBhdLc+3WomLt9IqffdRfxZ5M
 zJNQ==
X-Gm-Message-State: AMCzsaUrzxvbKBI401w+TZcx+/WDM48XMODigMp1g5QX7UjGEtoL4Hfd
 aUJ3sya4dcGIbBTEaS7g7dYkxBTWeBtW0ZetcYc=
X-Google-Smtp-Source: ABhQp+QI/6R429fQCuY09zeFgk2MV2W/9tsUvs+RfLzw7IcckzQXl7b6R17mUSEXZoOIadQZ6ZXS9TU6MwpY6IZ8KJk=
X-Received: by 10.36.55.21 with SMTP id r21mr7883156itr.85.1508072719691; Sun,
 15 Oct 2017 06:05:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.196.9 with HTTP; Sun, 15 Oct 2017 06:05:19 -0700 (PDT)
In-Reply-To: <1507895332.5452.207.camel@aj.id.au>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
 <1507691558.5452.172.camel@aj.id.au>
 <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
 <1507895332.5452.207.camel@aj.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Sun, 15 Oct 2017 21:05:19 +0800
Message-ID: <CAARXrtn_iKCP3Ujtav1N0Pokhi9R7ei9GXrHt6Q=ONV5WQ_12Q@mail.gmail.com>
Subject: Re: OpenBMC helper scripts repositories
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>, Chris Austen <austenc@us.ibm.com>,
 openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, 
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2017 13:05:23 -0000

On Fri, Oct 13, 2017 at 7:48 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-10-12 at 14:34 +0800, Lei YU wrote:
>> On Wed, Oct 11, 2017 at 11:12 AM, Andrew Jeffery <andrew@aj.id.au>
>> wrote:
>> > On Tue, 2017-10-10 at 09:55 +0800, Lei YU wrote:
>> > > Vote+1
>> > >
>> > > I always wanted such a repo to put common/shared scripts
>> > > together.
>> >
>> > Great, it seems there's a fair bit of consensus on this. Did you
>> > have
>> > any scripts of your own that we could pull in?
>>
>> Yup, I have "upload_and_update.py" that do the code upload/update.
>> Though it only works on non-ubi-fs systems.
>> https://gist.github.com/mine260309/21ceff0f69b42df0ef12a85c83ec01c3
>
> Can you please license this under Apache 2.0 and submit it to
> https://github.com/openbmc/openbmc-tools ?

Created pull request.
Thanks!

>
> Cheers,
>
> Andrew
