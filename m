Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRZCx4h3ZzDqBW
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 17:56:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vRZCx1rJfz9s84;
 Mon, 20 Feb 2017 17:56:13 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v3] drivers: fsi: Use kernel ida to manage
 device indexes
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1487367482-24868-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <258d17ec-a52e-0706-bd84-cd972780bbf6@ozlabs.org>
Date: Mon, 20 Feb 2017 14:56:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487367482-24868-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 06:56:13 -0000

Hi Eddie,

> Fixes bad device indexes and duplicates after fsi rescan

Looks good to me - much cooler than the existing atomic counter.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
