Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st4HJ6S2xzDrbq
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 02:46:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3st4HJ421fz9ryT;
 Tue, 11 Oct 2016 02:46:36 +1100 (AEDT)
Subject: Re: [PATCH linux v2 14/17] drivers/fsi: Fix some text formatting
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-15-git-send-email-christopher.lee.bostic@gmail.com>
 <59e43ef4-6319-c6eb-d467-95a17374322f@ozlabs.org>
 <CAA0LjjX67AYab2HHJtXLrjecnGiZHA_AmiTyshN8DZEYZtO66Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <9c6b6da5-fe08-c358-60b3-5ed01f1bcb9a@ozlabs.org>
Date: Mon, 10 Oct 2016 23:46:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjX67AYab2HHJtXLrjecnGiZHA_AmiTyshN8DZEYZtO66Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 15:46:37 -0000

Hi Chris,

>> This looks good to me. Do you want me to apply these as fixups to my
>> patches now, or do you want to carry this separately?
>>
>> Note that we'll need to apply as fixup before sending upstream, so this
>> is just a matter of when would suit you best.
>>
> Hi Jeremy,
> 
> I'd be fine with leaving it as it is here in this patch set.  Not
> familiar with what fixups are in
> this context.

This would mean that I rework my initial series (ie, 1-13) to include
this change (but rolled into the changes, rather than a separate patch).
Since this updates my base series, you would re-consume that series, and
would drop this change from your set.

However, I'm happy to leave it as-is for now. We'd still need to do the
above before submitting upstream, but that can come later.

Cheers,


Jeremy
