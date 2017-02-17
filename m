Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPm2N6w0FzDqBW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 19:11:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vPm2N4ttSz9s80;
 Fri, 17 Feb 2017 19:11:40 +1100 (AEDT)
Subject: Re: sbefifo userspace api
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <8d23fb00-29ae-dc69-46d6-27b48ab3dfa4@ozlabs.org>
Date: Fri, 17 Feb 2017 16:11:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 17 Feb 2017 08:11:41 -0000

Hi Brad,

> Looking to start a discussion around possible user space and kernel
> APIs for the POWER9 sbefifo driver.
> 
> There exists today an “alternate" sbefifo driver :-) that provides a
> single submit ioctl.  Applications submit a request and get a reply in
> single system call.
> 
> Is something like that the best approach for an upstream driver?  Or
> should we try something more "pipe like" with read/write interfaces?

It probably depends on the functionality there; ioctl() is useful in
that (as you say) we can handle request and response in a single
syscall, read() / write() may be more appropriate if ordering can be
handled in userspace.

Can you add a little description about the functionality we're exposing?
That may suggest a particular API.

> Would the in-kernel API be the same as the user space API?

Probably not :)

Cheers,


Jeremy
