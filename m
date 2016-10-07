Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqsDL2G7bzDrPL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 12:21:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sqsDK5tk1z9s65;
 Fri,  7 Oct 2016 12:21:21 +1100 (AEDT)
Subject: Re: [PATCH linux 15/15] drivers/fsi: Initialize CFAMs for read/write
 access
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
 <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
 <CAA0LjjVtq-Mdo7zz7Aim_1Xcn_tG-PqfrEnzWgi50aYcg_S-eA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <7611055b-b2d6-b461-7b0f-f672b577cdc7@ozlabs.org>
Date: Fri, 7 Oct 2016 09:21:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjVtq-Mdo7zz7Aim_1Xcn_tG-PqfrEnzWgi50aYcg_S-eA@mail.gmail.com>
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
X-List-Received-Date: Fri, 07 Oct 2016 01:21:22 -0000

Hi Chris,

> A break can be issued on any available link.

OK.

> Due to hardware bugs that vary depending on the combination of
> master type and cfam type the break command must be issued to
> different ID's and addresses accordingly.  This was the reason for
> adding the cfam_id, break_id, etc.. to the fsi_master struct.

But (according to the docs I have) a break is just a logical 1 for 256
clocks - it contains no addressing ID / information. What do the
cfam_ids and break_ids represent "on the wire"?

Cheers,


Jeremy
