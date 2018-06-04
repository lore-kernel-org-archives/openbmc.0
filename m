Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dPlqlCGG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aoc3zOmW"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40zdlY3NvxzF0f7
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jun 2018 12:13:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A74021BFF;
 Sun,  3 Jun 2018 22:13:39 -0400 (EDT)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Sun, 03 Jun 2018 22:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=5aQaeI3A5XZObJlV+7GV0Fn20R5cK
 TltI2gNKpVPjao=; b=dPlqlCGGKtBI30754rtrqlpQ5iB38/Aaf4BgAxe02H5YL
 Q6m0fKOSmR5eckHN3X5uEaJju5ew3i/GyxtwJK+zb8P1Dm9/0bnWHIf1n50hBp5c
 T3pnkCC4K99wIP3RcW+hkBREHkIzhvjrFnnNeQ7hcOtzzwjW9tFXWP4mQxb4Npl+
 LSySkP1VL6t0FcX1x4yM808by7pjUgl16/qWN2a2DrK677vjhB9kkRqXFvKcnrAf
 /dg3pHeGJ6EmNaWCLwtGMARSLs2leRchiWKoB1dwi0tg5GMS/zuFfIoy5Y5DctEs
 6bLfkjvGuOGnQ7ncaljO/EJodXNkfOUWYa96E8BYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5aQaeI
 3A5XZObJlV+7GV0Fn20R5cKTltI2gNKpVPjao=; b=aoc3zOmWEqZo+95HiWMTkr
 2AbQhTCzzc5tOQi8F5amxkntj6pAdDVutUrxupmMgKMtumXYZBP9HIWMDDSi0T4z
 YUzzEV+9HjQSha4DdeAGfcwx98KRXsBBQ7307/GBh2VGodw1eDZER/wMO0nKu2LV
 Xk/UcBMen1k+9EDXsbafba526Ef415/zLmT1CfM1RbmsT3lbcR7Ri2SN7aG5+9Ng
 n5nnZqCsHMYurQjdclZ3qPHI0/pzTuFQ0mrwIEPXS3e8P1aHPnwLhxHY/a4R/vto
 2GLByr2hvqR6ONmCjink/SQWNzbW2fPh6krUndIvfnwxrKdcPg6P35tWSZlQu5ag
 ==
X-ME-Proxy: <xmx:UqAUW8YjAsgekM2F92-2oVL7jYGWm6LxbdUMZCfE_Iro8BWwSZGcow>
X-ME-Proxy: <xmx:UqAUWyldlJNBXfpI1px-_Z62Fm3dYRa60O0N9L4Iy3pV3tDg_Ebing>
X-ME-Proxy: <xmx:UqAUW6z-4s2Y0LK1zF3MYOIdzhyoSKfj1dIxtHQ1rgMiw_8pLZRauA>
X-ME-Proxy: <xmx:UqAUWw_9sWcR-0jd1h0awtl1bx54ajR92q8tcUS8k52F13eZ8saMEA>
X-ME-Proxy: <xmx:UqAUW1ADegkYm3ZM5nLOXan0_Cw5rEM3XkLjYQcvxf4DmfFY7PV6tw>
X-ME-Proxy: <xmx:U6AUW6XHY6R-eqt4akYEyzAM5hHO2YOLoTSEoZlFWvYOG8lxU-V3zg>
X-ME-Sender: <xms:UqAUW2HH1ZHXZVlAX-VsbuiHqEZ6TEh8UjSzlMQcs0iuLLuvHOX4Tg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 9B2FA621DC; Sun,  3 Jun 2018 22:13:38 -0400 (EDT)
Message-Id: <1528078418.2156410.1395136520.39E878A9@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fb4a77ea
References: <1526953427.458876.1380098832.53C3F9C7@webmail.messagingengine.com>
 <CAJoAoZmd+RJepSkFE+VUapmrY_rYdftKX0LnSrjUXSqv_bGy2w@mail.gmail.com>
 <1527814593.468836.1392470512.06FD33AE@webmail.messagingengine.com>
 <CAJoAoZn7q_eXB4+J57H3RJpM=O_o5oSRtcxbJrb7gFjT-84uUA@mail.gmail.com>
Subject: Re: obmc-gerrit: A tool for automagically adding reviewers to your
 patches
In-Reply-To: <CAJoAoZn7q_eXB4+J57H3RJpM=O_o5oSRtcxbJrb7gFjT-84uUA@mail.gmail.com>
Date: Mon, 04 Jun 2018 11:43:38 +0930
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
X-List-Received-Date: Mon, 04 Jun 2018 02:13:48 -0000

On Sat, 2 Jun 2018, at 02:16, Emily Shaffer wrote:
> At least in IPMI etc I haven't seen people use this. Are they common
> elsewhere in the project?
> 

The Cc: tag is common in the kernel as it uses a mailing-list based development method. As such it's pretty well established.  The thought was so that I could be even lazier about pushing changes to Gerrit.

Nothing would *force* you to use it, was just wondering if it would be convenient for anyone besides me (i.e. is there enough interest to warrant the effort).

Andrew
