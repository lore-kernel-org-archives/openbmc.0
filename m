Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K9CMGNqO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JP2x63U5"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RTWY6x2hzF1s3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 16:25:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7772421A54;
 Thu, 19 Apr 2018 02:25:43 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 02:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=jJetu6o3QzC3ROBHuZ6e2SIKu/qCd
 ZKA9WParOGc+aE=; b=K9CMGNqOXLjLZkU4lCHvG/eYAK8Ex3M5SFQGcxOTTa/J0
 kZxjjZW//y+RG9sohyWcrGWVWTPR6lxoJrsE+Q1QaJQCAjpF9pgV9SkwmW7GBK9t
 tKxaLUxE6hLoU0lfq+RAXDgm4d8RdeFbrHPkqDbt2LosbAeMO+ZbhBs26JVZUoD7
 Ocb+BbAJ8EVXzwiHhaGb0j16XFi29fJvGKV7btN168Ga0rbvWqT0F8DwQBruyPqH
 mfvyurrEcDcYaNSdgVWQGnLEv1ruTbJhTZLSB463jRdOKYZKiqNtY5hXEaNluKDe
 fsQfbdSuF0YFAejtrBhaPkSec1b4KQ9saFnC/JeSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jJetu6
 o3QzC3ROBHuZ6e2SIKu/qCdZKA9WParOGc+aE=; b=JP2x63U5rhR5NBcQLKYG1C
 GwTHyteLJlp82Cu1wUpWlItZZxj6kc+RbrteI6wFj7y9hswvKuRhwcVBxVGkUIF9
 MsYWNmpmh5tCeoQnV13vY8YyRyfOMofcsjYzdUUpiFF87ROWFpfH0kUovAeuKFo0
 q6iMFfFIb8EW+XA2UTAUcCDEK5mk4Qd1EDMcp4Pl/YT7LOO0z8R5PV2tvXXP9HXh
 XClVXEfbdMbWJ4lMzk5c0Z/IyzTmqjccwqluatqAsVpxI724VQH8d1/jzdR0JaTK
 60ZfQunnCcJjJsxz1l3653zfnvIPK3RcnAJsX3ThX4NuUHxqgVfXo1IV+6C5O1mw
 ==
X-ME-Sender: <xms:ZzbYWsbRHMVWJQ9-51ezYF0FUFikuaPQy_dhdZnXrz7hjIweGwmTvg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 397E14256; Thu, 19 Apr 2018 02:25:43 -0400 (EDT)
Message-Id: <1524119143.2483207.1343270792.41805BC6@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Mark Brown <mkbrown32@hotmail.com>, Lei YU <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
 <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
 <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
 <BY2PR02MB13309DE59A88051E5FB73ABFAEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
In-Reply-To: <BY2PR02MB13309DE59A88051E5FB73ABFAEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Date: Thu, 19 Apr 2018 15:55:43 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 06:25:46 -0000

On Thu, 19 Apr 2018, at 15:46, Mark Brown wrote:
> Yes, I remember that it was "quilt" with reference to "u-boot".
> What is the exact git command sequence to update the 
> openbmc clone I have to merge with your fix ?
> 

git pull

Cheers,

Andrew
