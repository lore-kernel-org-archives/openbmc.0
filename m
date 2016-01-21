Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47E661A001D
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 17:14:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 09A841402D9;
 Thu, 21 Jan 2016 17:14:23 +1100 (AEDT)
Subject: Re: [PATCH openbmc 4/6] u-boot : switch to repro, add fw_env.config
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-5-git-send-email-openbmc-patches@stwcx.xyz>
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56A0773F.6000109@ozlabs.org>
Date: Thu, 21 Jan 2016 14:14:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453331420-6524-5-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 06:14:24 -0000

Hi Milton,

> +# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +SRCREV="${AUTOREV}"
> +

We should use a tag here. Just to confirm, you've tested against
c45e7515, right?

Or should we be using the v2013.07-aspeed-openbmc branch, currently at
e00b3cc6?	

Cheers,


Jeremy
