Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vN0D2bXLzDq9H
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 11:40:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2019 16:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,337,1544515200"; d="scan'208";a="144501989"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2019 16:40:40 -0800
Subject: Re: [Redfish] VirtualMedia
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jeremy Kerr <jk@ozlabs.org>, Adriana Kobylak <anoo@linux.vnet.ibm.com>
References: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
 <20190205173627.lju73ko22y4etuab@thinkpad>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <9a237a28-4086-52c0-0ee3-a258e7ece41b@intel.com>
Date: Tue, 5 Feb 2019 16:43:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190205173627.lju73ko22y4etuab@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 06 Feb 2019 00:40:46 -0000



On 2/5/19 9:36 AM, Brad Bishop wrote:
> On Mon, Feb 04, 2019 at 10:12:46PM +0000, Rapkiewicz, Pawel wrote:
> 
> Based on the chat in IRC it sounded like Intel might want to tweak that
> slightly and get rid of the nbd-proxy as a stand-alone application and
> move that functionality into bmcweb.  Did I understand correctly?  I
> don't think I'm opposed to that or anything (Jeremy/Adriana please
> comment if you have any concerns there) but can you comment on the
> motivation for the change?
> 

If you're talking about the conversation I had, it was an idea, but I'm
not sure how feasible it is given my new understanding of how the bnd
interface works in the kernel.  I really need to give it more thought.
Pawel understands this a lot better than I do at this point, and
actually has patches to back it up, so lets let his opinion supersede
mine for the moment.

I would still like to see the two options duke it out though.

(grabs popcorn)
