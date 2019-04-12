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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ghF46LCZzDqRb
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 01:11:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Fri, 12 Apr 2019 11:12:20 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Fix for the OpenBMC 2.6 release
Message-ID: <20190412151220.4n6boeq6iwg3763t@thinkpad.dyn.fuzziesquirrel.com>
References: <69bd75b447df0042d3d868dd8925a6ec@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <69bd75b447df0042d3d868dd8925a6ec@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 12 Apr 2019 15:11:37 -0000

On Thu, Apr 11, 2019 at 06:01:01PM -0500, Joseph Reynolds wrote:
>I would like to make a fix for the OpenBMC 2.6 release (branch=thud), 
>that is https://github.com/openbmc/openbmc/tree/thud
>The fix is the OpenBMC 2.6 version of this fix: 
>https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/20393
>
>Is there a process to get fixes into the 2.6 release?  My fix is in a 
>meta-layer, so I follow the technical process here: 
>https://github.com/openbmc/docs/blob/master/subtree.md.  Except how do 
>I push my change into branch=thud?  (I am still a git novice.)

Hi Joseph

Just push to refs/for/thud instead of refs/for/master.  Make sure your
local ref/branch is based on thud and not master.

-brad
