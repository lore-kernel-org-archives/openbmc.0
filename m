Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSXFN0tpVzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 12:31:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="FicpYbuO"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xSXFM2JTGz9s82;
 Thu, 10 Aug 2017 12:31:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1502332279; bh=BaSSRcIqqWsooZNSOOzzCqrz0LslJWUc3n+MxG76Bxg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FicpYbuOv390D+iHsjSIb7kFOKukOz0DoVks6BXjsO/xAqZp8GvGgShLEESHO+p05
 I1Es7Fah/0WNivCBTPgCMWATNUrYB77OFTJkYyMMzwi7e5QkaN60HE8pMJX7ss9jUs
 fxdrn8XxeYMRQwkoLJZ2Swnv+gias/9jJk/727O1ErwOzTf2eZql2ZHSGt7GSpfovK
 RoOQyvi3/fDFIzv0efcELYAOocMjGc0/bBI/jr8j3HRVfXgmnOu8DA7V9yv5eje0bS
 GsS8cQMioeZU/U9wnCjrK3S84y3MnLJNqev2tyS8+9sGfCyL8Ga85pRSwJHo7Mdn3y
 Wx0CxJ2Xg33fA==
Subject: Re: [RFC v1 4/4] ipmi_bmc: bt-aspeed: port driver to IPMI BMC
 framework
To: Brendan Higgins <brendanhiggins@google.com>, minyard@acm.org,
 benjaminfair@google.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au
Cc: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-5-brendanhiggins@google.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <99a298c1-6241-f835-9587-31c526126453@ozlabs.org>
Date: Thu, 10 Aug 2017 10:31:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170808035301.1980-5-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
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
X-List-Received-Date: Thu, 10 Aug 2017 02:31:20 -0000

Hi Brendan,

> The driver was handling interaction with userspace on its own. This
> patch changes it to use the functionality of the ipmi_bmc framework
> instead.
> 
> Note that this removes the ability for the BMC to set SMS_ATN by making
> an ioctl. If this functionality is required, it can be added back in
> with a later patch.

As Chris has mentioned, we do use this actively at the moment, so I'd
prefer if we could not drop the support for SMS_ATN. However, using a
different interface should be fine, if that helps.

Cheers,


Jeremy
