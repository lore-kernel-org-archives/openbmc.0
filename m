Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sybxy6c2nzDt0Y
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 11:47:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sybxy4BSFz9s2Q;
 Tue, 18 Oct 2016 11:47:18 +1100 (AEDT)
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
 <CAA0LjjWOqe7-z=QfUgTGY3zd796taS5H4wHARd6K7=_NEXjYhg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <d1201620-e069-4fb9-6017-3df4a9844866@ozlabs.org>
Date: Tue, 18 Oct 2016 08:47:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjWOqe7-z=QfUgTGY3zd796taS5H4wHARd6K7=_NEXjYhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 18 Oct 2016 00:47:19 -0000

Hi Chris,

>> I have some further comments on patches, but we should start thinking
>> about how we'd like to construct the upstream submission. Here's what
>> I'd suggest:
>>
>>  - I take the corrections that you've made to my series, and integrate
>>    them into their relevant original patches, and update the commits to
>>    indicate that you've also contributed to these
> 
> Would this mean doing a git commit amend on your patches?

Kinda. I'll be doing a `rebase -i` and squashing the fixes into their
relevant (original) changes.

>> How does that sound?
> 
> Sounds like a plan -Thanks

Excellent! I'll get that done today, and let you know when my branch is
ready to re-pull.

Cheers,


Jeremy
