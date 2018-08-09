Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YEmbnS35"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mYtH65XvzDqBy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 02:41:27 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id d9-v6so1114676itf.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8izssPpwmKCBc4WC3C3zDDBkVYq54WWlq/jDr0mjCMc=;
 b=YEmbnS354LcpJv4PFAJeQtDNVxvu3iee+FD9N/LiUVNAEWRGXtXDoonaHsVvsaFo08
 K/LROzTZKnXdX1YzPqvQZXK4+LPQwdDQLYqLaepkTgcXGSqIAncjKG5joaPkQhC0Vcp5
 VMoSPFvg5DbL4EStJNLjPxkP+ONAtdhAIwTWnF9cIBkS23L+bbai2O2u+dEACd0qTDsF
 DJJpgo0dwHF39w4rsWI/oxGLeeatIYCa6s9cP8SB6MV8lo+sye1DlKGb3Rr/1XDly3gX
 AWbnW3sn5EKw4S66v45tUDEFylXBOJsiLxmIxKcZl+VuJDOLUceLXUvcXHJvvjrFtvWN
 y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8izssPpwmKCBc4WC3C3zDDBkVYq54WWlq/jDr0mjCMc=;
 b=Hfb1fr2PlEwGpnSIYx0b8Ij255vHKpJA08lqv+UhvW80eSjfP1gtFQzJCziGNGQCVC
 UTrG/ArC+E2KDCTZQRkuDi5PB/9hLunjXuB2U6d/5HUMkrs4HjrPRCYBmWsBXq5+CpnC
 sKWa0e82Bf3AVgSV9tKQedDw02kEEgBdm4r00FwseYQALr6CDqqUCFqQ9KFFb3r4ri7v
 XlNnldXIVI9ju2BpJTGHI5zekqEI6IDNZ227RXOa1kK2Hyaxu6Xp9HfigG9EtJjfWBLR
 cGx7njiXlRcN1QjX963OyN70ENELWEEvCC0zDpDDz1stOzMZYLbbHcwnwiho1pc8KMYc
 ctWA==
X-Gm-Message-State: AOUpUlFnWgh8X8S9LROcNubMinQHOAo3JPABJbXPwc4vzZ3y++ih5uGa
 BrDEMSKjryP38LLoeRDmx0FFvkPzdo1VzbFpL7Lf8WMdH/w=
X-Google-Smtp-Source: AA+uWPxL/3tOziPyGelIL9EljeDSeGYBtb3XU8Za2NRwUvoW3wMmFUYalPj5XbcLVUGALJ+hCC3xHE1YKnmBUUdMUsc=
X-Received: by 2002:a24:8b82:: with SMTP id
 g124-v6mr2801895ite.70.1533832885144; 
 Thu, 09 Aug 2018 09:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Thu, 9 Aug 2018 09:41:04 -0700 (PDT)
In-Reply-To: <20180809163211.GA37965@mauery.jf.intel.com>
References: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
 <20180809163211.GA37965@mauery.jf.intel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 9 Aug 2018 09:41:04 -0700
Message-ID: <CAO=notyXi0VLv=-eJHsODwJvukoMRMbMcC8qndzR9ncYkbsvww@mail.gmail.com>
Subject: Re: Licensing Question
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 16:41:28 -0000

On Thu, Aug 9, 2018 at 9:32 AM, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> On 08-Aug-2018 03:45 PM, Patrick Venture wrote:
>>
>> So, I've spent the last hour trying to submodule my way to using
>> ipmitool.  I've managed to get it compiling for just the one file I
>
>
> Okay, I'll bite. What are you trying to use ipmitool for?

I'm trying to use the ipmitool source for speaking IPMI without
duplicating the code to do so.  I can just open the file interface
myself and handle it, but it seemed to reinvent the wheel on this one.
Although I do need to push a bugfix to ipmitool where they don't check
the msgId returned to see if it matches their expectation.  Unless
someone else fixed it (still need to check).

>
>> need (or want).  However, then I try to link it and then more failures
>> for things that are missing, such as helper methods.  So, then I add
>> the file that has those, and then it doesn't compile because that file
>> doesn't compile.  This is of course, not compiling with the -Werror
>> flag among other things with gcc.
>
>
> I think Alexander is working on getting ipmitool to compile without warnings
> upstream. That is quite the task though; he inherited a lot of warnings. :)
>
>> So, I can keep battling this, or I can ask -- the license for the
>> ipmitool just says I need to keep a copy of the license with the
>> source if I reuse it.  So, I can do that, and I can hack it up to work
>> -- but where I'm curious is -- how does that impact the license of
>> phosphor-ipmi-flash?
>
>
> This is where the lawyers start to smile....

The license is fairly permissive, just says I need to include it.

>
>
>> (Some of the things where gcc is complaining, I can go ahead and
>> submit patches to fix.)
>>
>> Patrick
