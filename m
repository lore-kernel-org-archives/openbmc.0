Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMYjK4y0YzDvcX
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 14:19:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3tMYjJ1tngz9t2N;
 Mon, 21 Nov 2016 14:19:00 +1100 (AEDT)
Subject: Re: [PATCH linux 06/19] fsi: enable debug
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org,
 gustavo.padovan@collabora.co.uk, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, jthumshirn@suse.de, dan.j.williams@intel.com,
 sre@kernel.org, clg@kaod.org, k.kozlowski@samsung.com
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1479696048-75851-7-git-send-email-christopher.lee.bostic@gmail.com>
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <346e2df9-a360-e148-8ba7-bc0b335e6308@ozlabs.org>
Date: Mon, 21 Nov 2016 11:18:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1479696048-75851-7-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Mon, 21 Nov 2016 03:19:01 -0000

Hi Chris,

> Enable debug for the fsi core during development. Remove before
> submission.

We probably want to drop this one now :)

Cheers,


Jeremy
