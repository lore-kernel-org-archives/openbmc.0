Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qZVrEHGc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="yE1ovLRq"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zdkZ3SlTzDqM3
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 10:13:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B9E721FDA;
 Tue, 12 Feb 2019 18:13:36 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Tue, 12 Feb 2019 18:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:date:subject:in-reply-to; s=fm2; bh=tEa
 EBh4TaMzpgZ3f1DNfcBJT4UWz9/VxSiSjMZwG28o=; b=qZVrEHGcrgWw7rpzTo0
 Zq/98rnvvcOVvtKkXSFNiMOG/pMJpxpIgK14BuEgjBjgqR9XNfVpwAtNE+/4NrDm
 Qs69KOJCjykngRGolXeBG/pj0FmeAsG3v7uS6XefVy0zlnSOPMemihzMDULGJY4k
 OsYy5eFbV6RchtWExk/0VUy2uhLeQFnYWk4TvKzrWv2N+say0QerTmfws/2FyJVM
 T3H1T+7dgXSxu4jQ9jwEw4SWfvrWlLU9Am2iWKbPz/sk7LdOSPxvrjUN89m27wF5
 Y7VkIIsVlFz3onvWjPzBJx/22NWNBHo9ryBvsha8JzZuoEfBDmvia6beeHOt900x
 rxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=tEaEBh4TaMzpgZ3f1DNfcBJT4UWz9/VxSiSjMZwG2
 8o=; b=yE1ovLRqVbIf7I580Mqiju+jq/YRq0oyfMAf6ZP8XXmGDptUcRHLJ1fbp
 FSCGK+0ubTihqt38Pkqz8YiMy733CYRUGm+XUUEtGoyWygEayli4J5KXpOwCuqdz
 SCDMCUsKtTq3YhAIgieSB+PiZ7Gzw8dcfrLNYI5AkW5JzTROn6uTTBwO3T2rJuyB
 mrO4o1W0VOmPaj+Gbx0k+0W5M2zgZ8v3OD4EuLE4QJxaYA44qML4WmDHmpOhPRqH
 67QRvICKE+udqSh/OrUntuOjO4ap6a0r8nX00BsU3x9zrVcdWEBvuMTnEti7HvUQ
 F9OFvjlIz4JU9GnCqqCdynf/Xv7SA==
X-ME-Sender: <xms:IFNjXMwRWmDSuJxnjBkAntMGtTa1gEL-J2j6cXxNfWjgkEva_Lqguw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtvddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fofhffufgjsehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:IFNjXMnIEQSRrQct5Lal7GXPsEsf2Usom1e9l3LWgi-fTCHMs8Y28Q>
 <xmx:IFNjXBEdQixVNfo7KyRbRE5GomTTSOFGlR4GujMLEDIJ4j6iHJLICA>
 <xmx:IFNjXMVFg6CP9MjUr8UfJ1lhvAPASrE2n7P9e7ENWmi4D_AJh4t77g>
 <xmx:IFNjXKTqtPWW65TYf9GS6NTTXvWSIKhNCqZg2lQ4N0tPMECuYnrkzA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id F130894524; Tue, 12 Feb 2019 18:13:35 -0500 (EST)
Message-Id: <1550013215.2866613.1656755904.44211550@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Nancy Yuen <yuenn@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
 <CADfYTpENfKyyoMuhuN+RzD7nCQbo+g8sWS-mxMU0PUS5C-Z3yw@mail.gmail.com>
Date: Wed, 13 Feb 2019 09:43:35 +1030
Subject: Re: Secure boot for BMC
In-Reply-To: <CADfYTpENfKyyoMuhuN+RzD7nCQbo+g8sWS-mxMU0PUS5C-Z3yw@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2019 23:13:45 -0000

On Tue, 12 Feb 2019, at 11:00, Nancy Yuen wrote:
> We are working on secure boot, but we have a requirement for a Google HW
> root of trust so I'm not sure if that fits in with these discussions.

I think it would help to have some idea of Google's requirements so the project
can accommodate them where we can, if you can reveal any details. It may also
help inform others (me?) on strategies to secure firmware.

Andrew
