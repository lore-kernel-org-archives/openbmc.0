Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42w5j44B8RzF3b8
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 00:59:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="UNcoUedK"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 42w5j36P9Sz9s9m;
 Thu, 15 Nov 2018 00:59:51 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1542203992; bh=VNvJU9k9e2/KDXSZoFTHjXTNoOEVpLeRjsVcRP9j7MU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=UNcoUedKhug0sM93aF5gq9y/+2R4l+w8I3M/9fdibe7hCpcQonaeIhXzT14RIghsb
 K6SvjOvVSyly7LnGJw5EDI6lqe+Pvjo4NSKoIBBq9mrE8q9lUZp9ZhzJma3LSVYrNO
 vvypHqVT07OMd0E1PB55Z6YUM92DYHyR5ph252kvebzMuqlwciQhYCdXMv21OVATNf
 jU/wDfLUaTQ7piBmLtQoSGeze0JD4li+c8LXI83nRwhdXG/RhHYeLSWOLrfu4E5Lxv
 PZgefZoOPXl54c6u2rD7knmuv/GwTEZTR+/WxjrkIN3Jlf00xAwJCUMtHlhvJ/cu8p
 gShHa+ZzAKFXQ==
Subject: Re: MCTP protocol support in OpenBMC?
To: David Thompson <dthompson@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
Date: Wed, 14 Nov 2018 21:59:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 14 Nov 2018 13:59:53 -0000

Hi David and Rick,

> Does OpenBMC currently have any support for MCTP protocol layer,
> or is there a plan to deliver something like this in the future?  I’d be
> very interested to hear about any future plans related to MCTP stack.

Us too! I'm interested in looking at MCTP, and am in the middle of doing 
a little prototyping with our host firmware stack.

I'd also like to avoid duplicating work though, have you (or others) 
made progress on this since this initial email? I know there was a 
presentation on MCTP at the recent hackathon, but I'm not sure if any 
solid plans came from that.

If not, I'd be happy to sketch out an architecture for this...

Cheers,


Jeremy
