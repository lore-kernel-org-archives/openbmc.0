Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szC173KQWzDt3K
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 11:07:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3szC170kF6z9s3s;
 Wed, 19 Oct 2016 11:07:07 +1100 (AEDT)
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
 <CAA0LjjWOqe7-z=QfUgTGY3zd796taS5H4wHARd6K7=_NEXjYhg@mail.gmail.com>
 <d1201620-e069-4fb9-6017-3df4a9844866@ozlabs.org>
 <0c3c9834-aefd-30e6-bc22-577697fa7e95@ozlabs.org>
 <CAA0LjjXxhZsqg3t_MdGfub5-=dD7FUUD+oW=m3jq6sub2kiAZQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <3c14605b-259e-30e9-5a6c-11a7c18d15ba@ozlabs.org>
Date: Wed, 19 Oct 2016 08:07:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjXxhZsqg3t_MdGfub5-=dD7FUUD+oW=m3jq6sub2kiAZQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 00:07:07 -0000

Hi Chris,

> Not sure what may have happened but looks like the crc4 helper
> commit 60e3513 has a build issue.

Sorry about that, looks like I'd picked from an older branch. I've fixed
this up and re-pushed, top commit is now 6e5d6ba0.

Cheers,


Jeremy
