Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgN7573bvzDsjB
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 16:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dGjuyJtN; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 51so1000190uac.1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 23:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rejMP/iOAytvBH+jyMpTWqW0UNpP2oz9euWxuz+TQ4Y=;
 b=dGjuyJtNSIU8JWnrvmxPeBWO/0zV0GCOCn1erojPwaSS7yI70U/TQ5Glxasal4yc6x
 1IxnmJc+uQucUp83jMQmnXopyhHHbRysxq8KNv1ZNQYVUA8Y+bkomR13p5xh3jiz4Alc
 3CK4CuvGZTuu6P3Z5XolWsOKcwrfTTAUC96gUmsC7Odh8bbIrFbNNKRMhG07lWRAob/Z
 LBaUUxqEK9msYHeEmHiQDumenzhGgCSD1iCK7dkD0m8v3ACSJei3sdrT9wlXPZGqJOts
 AKWK/vw9oG5ScpWhs6lpnLrSEmEKmpUIsJHzWuMS2H7K7k7MF4Fddsx2QkPoe0Vt19OP
 +Pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rejMP/iOAytvBH+jyMpTWqW0UNpP2oz9euWxuz+TQ4Y=;
 b=SnI7ZidNti83m+ioonG6S1fbppDmTJoa5LWk7SuCFoRKo+ipder/455rAxZyZINhe6
 XvNfkc+Ze7eQhMl09i9jUlXEF6JIg1JMbOa5kwfHr12Ti2SSBfVDKfGZ0CUqE9C36XxP
 q11a15Qd6M3ZMA+qCFn6UZgiknj+YLSAruBxKJATpx1TZ19g4PdUET+EeXIus+Fl7zbW
 gyyghP8bNA2BL0HqFpeJuWtNJzbnmpdp6VrI6VUCVYNagXKq5rXwHAe0yw9TD/gbIpHd
 wonMVzA2LlHT8scX6k6EhqrUO+dX70LJm7syo8BH5+cdyweamSYESkg5sWhASIwH1bot
 0WBg==
X-Gm-Message-State: AE9vXwOXz2GsznFALz4cVTdL3e2DcJdnUp5AoOSNYuyBADsNyp1smIkn8VI15ece3jpTdEAThgHGwjJ2B1rjJg==
X-Received: by 10.159.35.21 with SMTP id 21mr2361056uae.48.1474610543624; Thu,
 22 Sep 2016 23:02:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 23:02:03 -0700 (PDT)
In-Reply-To: <CAFd5g46j02sb2w_DwaXAgnfcO=ONmJGZwqdRneNd0QHq-t53rA@mail.gmail.com>
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
 <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
 <20160919213536.GA19274@rob-hp-laptop>
 <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
 <CAFd5g46j02sb2w_DwaXAgnfcO=ONmJGZwqdRneNd0QHq-t53rA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 15:32:03 +0930
X-Google-Sender-Auth: _h2CBuqNph0zgC9_tBC2-t7I9Pc
Message-ID: <CACPK8XcWbgfW_==aVjUataA2Yk26TSaO2o3Vt0pR68qKpkYxuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, 
 Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Fri, 23 Sep 2016 06:02:26 -0000

Hi Brendan,

On Wed, Sep 21, 2016 at 3:35 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> First off, someone pointed out to me that the mapping that I used between
> addresses and bus numbers is not actually valid for busses 8-14.
>
> This could be fixed by checking the offset, but I am wondering if that is
> the right way to do it. It seems like this is not completely trivial so
> maybe this should be specified in the device tree? If that is the case,
> should I do this as another reg entry or go back to the way I was doing it
> before?

I don't see an alternative way to derive these numbers. As you
mention, the block of SRAM in the middle of the IP screwing up the
linear mapping.

I suggest going back to what you have in v2, with a mention in the
commit message as to why the bus property is necessary.

Cheers,

Joel
