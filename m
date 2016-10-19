Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szpLv4W9hzDt2h
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:39:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3szpLt5lRpz9sD5;
 Thu, 20 Oct 2016 10:39:34 +1100 (AEDT)
Subject: Re: [PATCH linux v5 13/18] drivers/fsi: Set up links for slave
 communication
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <b76314f4-9bcc-7e51-41dc-1e31c326142e@ozlabs.org>
Date: Thu, 20 Oct 2016 07:39:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:39:35 -0000

Hi Chris,

> Enable each link and send a break command in preparation
> for scanning each link for slaves.

Looks good!

Acked-by: Jeremy Kerr <jk@ozlabs.org>

> V3 - Remove definition of BREAK command from fsi-master.h

In general, You'll want to move the V3/V4 changelog to after your
Signed-off-by, and the '---' line. So you have:

<comments>

Signed-off-by:
Acked-by/Tested-by/etc.

---

<version changes>

---

<diffstat & patch>

This means that `git am` will do the right thing and remove the version
changes before applying (as we don't need that in the git tree once
merged).

Cheers,


Jeremy
