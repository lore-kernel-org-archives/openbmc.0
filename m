Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 758671A00BF
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 13:13:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 1C00B14017E;
 Tue, 24 Nov 2015 13:13:12 +1100 (AEDT)
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
To: Patrick Williams <patrick@stwcx.xyz>,
 Stewart Smith <stewart@linux.vnet.ibm.com>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
 <m3vb8yslyo.fsf@oc8180480414.ibm.com>
 <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
 <m3r3jmsfxs.fsf@oc8180480414.ibm.com>
 <20151123200347.GF21764@asimov.pw-on-the.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <5653C7B6.8090506@ozlabs.org>
Date: Tue, 24 Nov 2015 10:13:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151123200347.GF21764@asimov.pw-on-the.net>
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
X-List-Received-Date: Tue, 24 Nov 2015 02:13:12 -0000

Hi all,

> We should have a discussion on the call about autotools vs (...).  The US
> side of the team has zero experience with autotools and so it was easier
> to just write some simple makefiles to get started.

That will work while we have a limited platform & configuration support,
but we'll need to scale eventually.

> I don't consider autotools to be the "defacto standard" since cmake is
> also pretty popular.

Not nearly as popular as autotools though. If we're going to build
something that's easily adoptable by others, autotools is definitely the
right choice.

Regards,


Jeremy
