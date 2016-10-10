Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssl5Q5JZSzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 13:51:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3ssl5Q1kXpz9ry7;
 Mon, 10 Oct 2016 13:51:54 +1100 (AEDT)
Subject: Re: [PATCH linux v2 14/17] drivers/fsi: Fix some text formatting
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-15-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <59e43ef4-6319-c6eb-d467-95a17374322f@ozlabs.org>
Date: Mon, 10 Oct 2016 10:51:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475948333-55960-15-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 02:51:54 -0000

Hi Chris,

> Cleaned up a few formatting warnings like blank lines at EOF
> and block comment style.
> 
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

This looks good to me. Do you want me to apply these as fixups to my
patches now, or do you want to carry this separately?

Note that we'll need to apply as fixup before sending upstream, so this
is just a matter of when would suit you best.

Cheers,


Jeremy
