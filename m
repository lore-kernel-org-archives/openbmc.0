Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy8vG3H1mzDvLy
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 18:28:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sy8vF6d00z9s8x;
 Mon, 17 Oct 2016 18:28:25 +1100 (AEDT)
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
Message-ID: <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
Date: Mon, 17 Oct 2016 15:28:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 07:28:26 -0000

Hi Chris,

Overall, this series is getting to look much better - I'd say we're in
good shape for upstream submission soon.

I have some further comments on patches, but we should start thinking
about how we'd like to construct the upstream submission. Here's what
I'd suggest:

 - I take the corrections that you've made to my series, and integrate
   them into their relevant original patches, and update the commits to
   indicate that you've also contributed to these

 - I then update my fsi branch on github with the slightly-updated
   series of 13 base patches.

 - Because it's only a skeleton implementation, I drop the
   fsi_master_gpio patch from my series, and you squash (my) 13 with
   (your) 18, which makes a proper master driver. You take authorship of
   the resulting patch.

 - You pull from my github repo, and rebase your 14-20 on top of that.
   Some of those will then be no-ops, as the changes will already be in
   the base series.

How does that sound?

Cheers,


Jeremy
