Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DPJv0FylzDqCs
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 04:39:10 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 5 Mar 2019 12:39:38 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
Cc: zshelle <zshelle@linux.vnet.ibm.com>, Dong Wei <Dong.Wei@arm.com>,
 ed.tanous@intel.com, openbmc@lists.ozlabs.org
Subject: Re: anyone interested in chip register error diagnostics?
Message-ID: <20190305173938.tdcz4cxtomxz2cbh@thinkpad>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <3d72867607bc75b18960223dc8cea114@linux.vnet.ibm.com>
 <d68f47712a2b0b82dfa4c313fc899afd1e37e529.camel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d68f47712a2b0b82dfa4c313fc899afd1e37e529.camel@arm.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 17:39:11 -0000

On Mon, Mar 04, 2019 at 05:53:45PM -0600, Supreeth Venkatesh wrote:
>On Mon, 2019-03-04 at 16:44 -0600, zshelle wrote:

>On Arm platforms also, There are several error syndrome registers which
>are read.
>This information leads to contruction of CPER record which will be used
>by OS to take service actions as per RAS policy.
>
>After reading 18831, it looks like you want to move error data
>collection to BMC from host firmware and for that you collect all fault
>isolation registers.

It isn't really moving - we run it on the host as well as the BMC, for
situations where the POWER processor is not able to execute instructions
due to a malfunction somewhere.

>Is there a security implication here?

Are you able to expand on this?

>
>Thank you for the proposal, I will read 18591 thoroughly to understand,
>whether we can reuse this on arm architecture.

Thanks Supreeth!
