Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wPKy2FmHzF3Xk
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 12:44:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="xrE4K8DT"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 42wPKx2C0nz9s47;
 Thu, 15 Nov 2018 12:44:21 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1542246261; bh=DQjnSNCwDS8TyDIdVygMZ7Q/Vxv9aNg8zaPgm05f6tA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xrE4K8DTNE8544ewNmTOkdJ4Og989uyaRHHWeY3d+2v5JMjV7okkIPb0oZqM4KNpL
 1rKVaK7KIb/6kAjsz832I+MtWWPqrGaAf59MxKaFiHM3GalzLN9nwuO/m3iaU2uS72
 uWHiUwSKinPOORgeufIFXyqGRVE+VlBUSMvAoy2BvxvnWPmJP1538+OvIeqpHdc/rY
 iDxRQMT/KYJ8Bj8UVhZMt8UbeFykiEAEUK5icTu0Uq5EQ/VK1Ye/sgwJtF/3gA5oNh
 u6j4GELzTtJUSYCyYY7/KOL8zBwtE4c3u8RS5BvprtmQNnw+1T158a4jNvWmgciGNN
 JEdE4yWXGNVKA==
Subject: Re: MCTP protocol support in OpenBMC?
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 David Thompson <dthompson@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>
Cc: Dong Wei <Dong.Wei@arm.com>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
 <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
Date: Thu, 15 Nov 2018 09:44:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 01:44:22 -0000

Hi all,

> We (@ arm) are also interested in contributing MCTP to OpenBMC.

OK, super!

> We would like to collaborate with OpenBMC folks  who are interested in this topic. (maybe form a Workgroup to discuss this).

Personally, I'd prefer *not* to form a workgroup at the moment; we can 
discuss things here on the list, rather than separating those 
conversations from the rest of the OpenBMC community. I also don't think 
we need any of the formality of a workgroup at this stage.

Essentially, forming a WG just means we'd have meetings and a separate 
mailing list. The former means that some attendees of the WG have to 
have late nights to attend, and the latter separates the MCTP 
discussions from the rest of OpenBMC.

However, we can certainly revisit this if conditions warrant it.

Let me know if you have any strong opinions one way or the other.

With that in mind, and since a few folks have expressed interest, I'll 
share some of my initial sketches to this list soon. I'll be sure to 
include MCTP in the subject to make things findable.

Cheers,


Jeremy
