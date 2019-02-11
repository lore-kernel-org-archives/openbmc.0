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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yvgc54ktzDqXB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 05:38:35 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 11 Feb 2019 13:39:04 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Using Stale bot to clean up issues
Message-ID: <20190211183904.dvva7vheuhz4ryok@thinkpad.dyn.fuzziesquirrel.com>
References: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
 <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 18:38:37 -0000

On Thu, Feb 07, 2019 at 03:13:53PM -0800, Ed Tanous wrote:
>
>
>On 2/7/19 11:26 AM, GUNNAR MILLS wrote:
>>
>> Is anyone opposed to using this bot to help clean up our issues?
>>
>
>Have we looked at what a majority of our issues are getting stale from?
>If a majority is lack of feedback from the submitter, I might be in
>favor, but we need to be careful we don't accidentally sweep things
>under the rug just because we don't have the manpower to get them fixed
>right away.

Can you elaborate on the need for care?  It isn't obvious to me.
Thinking out loud... If an issue is closed by the bot that we didn't
want closed, can't we just reopen it?  And if noone notices...it wasn't
that important in the first place?
