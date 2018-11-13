Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="huF35578"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="plwwsyB0"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vHBc5FhfzDrWQ
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 17:04:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 52019226AC;
 Tue, 13 Nov 2018 01:04:05 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Tue, 13 Nov 2018 01:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:subject:in-reply-to:references:date; s=fm1; bh=kZA
 B5AhzZmiM5rG6zDHNfvAO3aJJbT2N3147Bf4JCCA=; b=huF355786ZvpYwBwRGv
 ksHfLk7Oo+QkpjdxTz8w6jvdAvxEWEFZ/y94eCsxFsRCwoUkOSYirejnl+WYLagt
 V9xTSFt9kK8W6KS8Kln9cdjYZyrDNeiHqEnPTmLkl+E37OIFhqLAe77Xf2lp4DOO
 LzVC6ksDRnX8rRXU6rFiwUq7SR2NsqVz/emDLIcFkkMj4Ugj7APrxNBYu45sNkBZ
 SLLLrVV4FB2tpKARZ0N7J52ezNy9LFJzBbnEQxnIYULt2iv9lMo4C/WcXKGwXWXz
 qtqcw0idfIz4DV60sSo4qsZDx3Dg/r40tPz2x1pMEhr7NucCmT/Ov4Z/paXGsn2t
 Cvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=kZAB5AhzZmiM5rG6zDHNfvAO3aJJbT2N3147Bf4JC
 CA=; b=plwwsyB0glxgjmafGDFLwhFlDlOzYSQviLzOTnz8UJAsDDyHjzOnJ5WkT
 TobRJPO52U3Kchpg6u4ir+ctqLCidJWaOUF3QM6wz4PBVuN+VCWD2Z/Ku5IFHpI3
 eCh9cHjCsyYgJhy/gOTwVr6n5whkhpJz92oL4idf0p4AYjtvXr6/A/qp3BldrNFL
 7FiGkhpz4oOJ2Bo9tbBsKU8kh85L80Lr4kqTAoWwIZFGGuACKiqtSw6wAArv1tnk
 kA5W1jQI3c/tvaBp34QBXYp8pyG8DL417KsOHjR9gFouqbgbESeih3w59fCit6M6
 Z47onqFzc9WLjw4XPFAaUTCUc82yA==
X-ME-Sender: <xms:VGnqW4YDOUNA5_q75RTzOUQRfqLGYE_cGB3cUylvBQPy04I4O0kCxg>
X-ME-Proxy: <xmx:VGnqW4Uf-gk2iFyWFg1xPDDx_Np808VSJb31KPTIPy1ZVSdVmG8-Bw>
 <xmx:VGnqW4nnJD3ywRWOBbVhzKSccFI_Xd50AFl2ZWO6ath_6fUyCSZ5mw>
 <xmx:VGnqW-n7yvNshCrxDlIPofcHwIhr31jsX88Vnfcae6vEwr43N4enjQ>
 <xmx:VGnqW4Z4QKd-OQXusBH5EkiRCjRrDFeDncCkY64Elih_EqpG0S5ExA>
 <xmx:VGnqWwSKYflPljujyqP4NUINmR2cURWS2MI8GdBa050n-IZwUqR2lw>
 <xmx:VWnqW8qbgO48l1PTCJ2U0xW1Fn4o5GWD4_SUPMu9tzBJQAuOd0pcSA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 1311E9E56F; Tue, 13 Nov 2018 01:04:04 -0500 (EST)
Message-Id: <1542089044.2435385.1574922064.733C19A4@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2d882eb6
Subject: Re: Disabling ppc64le hosts for Qemu tests
In-Reply-To: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
References: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
Date: Tue, 13 Nov 2018 16:34:04 +1030
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
X-List-Received-Date: Tue, 13 Nov 2018 06:04:13 -0000

On Tue, 13 Nov 2018, at 15:38, Joel Stanley wrote:
> Hello Andrew,
> 
> I've been trying to get to the bottom of the slow-booting qemu issue
> for a few weeks now. We commited a fix that resolve the issue on x86
> hosts, but when running the same Qemu build on ppc64le it still has
> the "go slow" behaviour.
> 
>  https://github.com/openbmc/qemu/issues/14
> 
> I propose we run the Romulus Qemu boot test on x86-only build slaves
> while we work this out. That will allow us to unblock the kernel
> security bumps, which have been pending for a few weeks.

I'm on-board with this interim solution. Need to spend some time with
qemu to figure out what the actual bug is.

> 
> I'll continue working on fixing Qemu in the future, but I don't have
> time for the next two weeks due to some higher priority work.
> 
> Cheers,
> 
> Joel
