Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::242; helo=mail-ot0-x242.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cE9KI2Wi"; 
 dkim-atps=neutral
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHKzY02SCzF0Wj
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 20:18:00 +1100 (AEDT)
Received: by mail-ot0-x242.google.com with SMTP id d10so1555317oti.7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=BhEJ7MExI32pABIpbURdf7GMyogg2NthJNQ9YpyRGNI=;
 b=cE9KI2Wi+WsOzRIMWbHAvorRfcbimFG7MHz6IWtSQSbJZujXxIu5YH6OraObo1K9tZ
 z5R/4G4ajdC0Tlovr/vagNW9pG4sCSyBHwGPPTs/ZOvIB/P+QRNkclKpO1AaIbN9EB87
 3JUcY7tah7hYbXZzbyJq0sXeLK0PrlXSh3N/aee6xNpk8bNE6z1TkoFJHyVfqHWibozt
 i0YmBSHk444VbFRiq2A9jGajkUPL0+cbpw2SMm0J2r3YflUrd4NUXFcbv7Zom8WGw0uH
 7eJ/25Tpq4NLQt2Po/L//uuS5M46tCVFvy6/iKIOo3C6hmc9HvoRT5Hn5QJyNLbOalr6
 j0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=BhEJ7MExI32pABIpbURdf7GMyogg2NthJNQ9YpyRGNI=;
 b=Lrzsgrd8frBlg2iu1cmRr8a4+iMKLnTkPd9W1iCbhLQjsRM2ah/tAWCS8c3IOjXrme
 YW1B/tYOCbybxQkfjSzP9j/TEAcV0Ylai6ci1koKRDDYPXr4hpIY9HacqkHuBattlMzA
 VszIoVo/DjBWKrfzJn+pyZJU2nBD6M/+caYyzGmxZFw9ihtcqUjAmHO54UmFlQajuoiE
 ElHxTHOY20NQbw8jrC3KhnBlaPyLCx/MBLzFQdRW8qWQxps1cnoWqeGJtQ1W/5Hnv5VZ
 OOnuR47JmyqB+OGZ+W09i5PYHRj6CYjthsoqYCBM5RiwSXiDIyGurmzeJslf2kM4MzeI
 ioyw==
X-Gm-Message-State: AKwxytffkHuKhxz7G4RT6IlrbC6MorsGrESYWOBu1dDCnB8R561bQMJX
 V9iIAEXOn+JqMVqaCcTbffsLKegmxb5UqSG16nA=
X-Google-Smtp-Source: ACJfBot4Yev4TryI2q/ZHEBCDhetN5oy6Tj1QFjwHy4US4vJfhbde7tmS418sYSOep7q3kN6E3HTM/3y0rM7A5iTbxc=
X-Received: by 10.157.9.202 with SMTP id 10mr10193861otz.363.1515662277356;
 Thu, 11 Jan 2018 01:17:57 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.157.2.226 with HTTP; Thu, 11 Jan 2018 01:17:56 -0800 (PST)
In-Reply-To: <20180111084128.GA16780@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com>
 <CACPK8Xe9Jti8S2px=QOcSMA2v+TZ4eGDGQND4qmBUBXeBpsBZQ@mail.gmail.com>
 <20180111084128.GA16780@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Jan 2018 10:17:56 +0100
X-Google-Sender-Auth: DmlxgnJQrbXJrvHjcI0_opwUwNg
Message-ID: <CAK8P3a1xfo_p9Zi0BpP8cvXhkSrMynf=eQ=GkmJwDGf+Jb5O2g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Thu, 11 Jan 2018 09:18:01 -0000

On Thu, Jan 11, 2018 at 9:41 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Jan 11, 2018 at 12:28:48AM -0800, Joel Stanley wrote:
>> On Wed, Jan 10, 2018 at 11:30 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
>> > On Wed, Jan 10, 2018 at 01:46:34PM -0800, Jae Hyun Yoo wrote:
>> >> Thanks for your pointing it out and I totally agree with you. Actually, we
>> >> are preparing 4.13 update for now and an another update will be followed up.
>> >> As I answered above, I'll rebase this patch set onto the latest kernel.org
>> >> mainline. Sorry for my misunderstanding of upstream process.
>> >
>> > 4.13?  Why that kernel?  It too is obsolete and insecure and
>> > unsupported.
>>
>> It contains support for our hardware that I have integrated from work
>> in progress patches and upstream commits.
>>
>> The OpenBMC project, with myself as the kernel maintainer, have
>> intentions to regularly move to upstream releases. This takes time and
>> effort. This time and effort is balanced with submitting our drivers
>> upstream.
>
> Of course, but please do not have your "users" use a kernel that is
> known to have bugs and can not be supported.  That would not be good at
> all, don't you think?

I've been pretty happy with the progress in merging drivers upstream
for OpenBMC. Of course things always take longer than planned,
but they are getting there. Most servers today are probably running
the aspeed vendor kernel based on linux-2.6.28.10, at least that's
what my workstation runs (and no, I did not connect the BMC to my
home network).

The particular choices of mainline versions (4.10 and 4.13) may be
unfortunate as they are both one off from a longterm release, but
not being stuck on 2.6 is the important first step in order to upstream
stuff.

>> Another silicon vendor has recently joined the project and that brings
>> an entire SoC that is not upstream. We have patches on the ARM that
>> are under review for this SoC, with more drivers undergoing cleanup in
>> order to submit them to the relevant maintainers.
>
> Why are you merging all SoC trees together into one place?  That seems
> like a nightmare to manage, especially with git.

Why would anyone want to have multiple kernel trees just to run
things on different SoCs? ;-)

It's just a collection of device drivers in different stages of getting
upstreamed.

>> > And if you do have out-of-tree code, why not use a process that makes it
>> > trivial to update the base kernel version so that you can keep up to
>> > date very easily?  (hint, just using 'git' is not a good way to do
>> > this...)
>>
>> We have a process that we've been developing under for the past few
>> years. I find git to be a great tool for managing Linux kernel trees.
>>
>> What would you recommend for managing kernel trees?
>
> quilt is best for a tree that you can not rebase (i.e. a public git
> tree).  Otherwise you end up getting patches all mushed together and
> hard to extract in any simple way.

I'm ususally happy with having git with topic branches to make the
rebasing easier. In many cases, you can just leave a topic branch
for a particular subsystem unchanged between versions and just
merge the latest version of those branches until the branch goes
away after upstreaming.

        Arnd
