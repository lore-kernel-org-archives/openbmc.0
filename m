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
 by lists.ozlabs.org (Postfix) with ESMTPS id 443DQ04GB5zDqHr
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 06:26:47 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 18 Feb 2019 14:27:03 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Secure boot for BMC
Message-ID: <20190218192703.ux3sd6ocuydj5tds@thinkpad.dyn.fuzziesquirrel.com>
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
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
X-List-Received-Date: Mon, 18 Feb 2019 19:26:49 -0000

On Tue, Feb 05, 2019 at 09:14:03AM -0500, Brad Bishop wrote:
>Hi everyone
>
>Does anyone have plans to provide a secure BMC boot implementation to OpenBMC
>in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who all wants to
>collaborate on this before I submit a design template.
>
>thx - brad

I just wanted to quick say thanks to the many that have responded to this.

It is likely someone besides me at IBM will be carrying this forward for us.  I
don't have anything to offer at this point other than suggesting you keep
sharing your ideas for secure BMC boot in this thread.

thx - brad
