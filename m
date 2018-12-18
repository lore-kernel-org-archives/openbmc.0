Return-Path: <sashal@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="fyY+rJPN"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Jdw03NNzzDqWr;
 Tue, 18 Dec 2018 11:20:31 +1100 (AEDT)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E12820874;
 Tue, 18 Dec 2018 00:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1545092429;
 bh=JAIgOIQfFXT9a1LOTaslhoxR4QxEfjnFoh9E9BsFKjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fyY+rJPNl9WQ5S9QTFuxS8KGRppfxeAJhjpUXUoEhQnCfkajXtfxX06e42Zge6BLh
 MIrDd24i/4eshp79OXy9Oqn/4sU/cdswE8M90yaseRVpnzItDqF1jA7nUnSFsZr91K
 S+Dp4fYUoum/K7CLKfC8bcv54hF/MKuf+Jo2lmJM=
Date: Mon, 17 Dec 2018 19:20:28 -0500
From: Sasha Levin <sashal@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Andy Gross <andy.gross@linaro.org>, bp@alien8.de,
 Daniel Drake <dsd@laptop.org>, David Brown <david.brown@linaro.org>,
 dou_liyang@163.com, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 Jens Frederich <jfrederich@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Rutland <mark.rutland@arm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH 0/7] v4.19-stable randconfig fixes
Message-ID: <20181218002028.GX2746@sasha-vm>
References: <20181214221023.3878670-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20181214221023.3878670-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 02 Jan 2019 10:25:32 +1100
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
X-List-Received-Date: Tue, 18 Dec 2018 00:20:34 -0000

On Fri, Dec 14, 2018 at 11:10:05PM +0100, Arnd Bergmann wrote:
>Hi Greg,
>
>I did some randconfig testing on linux-4.19 arm/arm64/x86. So far I needed
>27 patches, most of which are also still needed in mainline Linux. I
>had submitted some before, and others were not submitted previously
>for some reason. I'll try to get those fixed in mainline and then
>make sure we get them into 4.19 as well.
>
>This series for now contains four patches that did make it into mainline:
>
>2e6ae11dd0d1 ("slimbus: ngd: mark PM functions as __maybe_unused")
>33f49571d750 ("staging: olpc_dcon: add a missing dependency")
>0eeec01488da ("scsi: raid_attrs: fix unused variable warning")
>11d4afd4ff66 ("sched/pelt: Fix warning and clean up IRQ PELT config")
>
>Feel free to either cherry-pick those from mainline or apply the
>patch from this series, whichever works best for you.
>
>The other three patches are for warnings in code that got removed in
>mainline kernels:
>
>3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
>972910948fb6 ("ARM: dts: qcom: Remove Arrow SD600 eval board")
>effec874792f ("drm/msm/dpu: Remove dpu_dbg")
>
>My feeling was that it's safer to just address the warning by fixing
>the code correctly in each of these cases, but if you disagree,
>applying the mainline change should work equally well, so decide
>for yourself.

Thanks Arnd, I took the series as is.

We really need to discuss how -stable deals with removed code upstream.
For some cases, we should probably follow suit and remove it from
-stable as well (I'm mostly thinking dodgy code with potential security
issues).

--
Thanks,
Sasha
