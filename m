Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DCNg4TdYzDr7C
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 06:11:30 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2018 11:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,339,1539673200"; d="scan'208";a="106370105"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2018 11:11:28 -0800
Subject: Re: Virtual Media
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: openbmc@lists.ozlabs.org, Jeremy Kerr <jk@ozlabs.org>
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
 <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
 <0d755df3a97b91ceebcdb7b50d403741@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <92915043-f612-1a6a-484f-3d441ac47c08@intel.com>
Date: Mon, 10 Dec 2018 11:13:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <0d755df3a97b91ceebcdb7b50d403741@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Mon, 10 Dec 2018 19:11:32 -0000

On 12/10/18 9:43 AM, Adriana Kobylak wrote:
> Hi Ed,
>
>>  - the nbd infrastructure allows us to use a unix domain socket (rather
>>    than a network socket) for that interface.
>
>>  - Using a websocket proxy, we can connect that process' stdio to a
>>    websocket.
>
> As you pointed out, the Redfish schema for Virtual Media may not fit
> with this design, so wanted to get your thoughts on how/if we could
> somehow implement having the client request to mount the device via a
> websocket, like by calling the VirtualMedia/<device_id> api, or could
> we leverage some other schemas, or what would be your suggestion? Thanks!
>
> Reference:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/16481/
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-rest-server/+/14752/
>
>
I think the root of the issue here is that the Virtual Media Redfish
interface was designed to be able to mount a host from a network share,
rather than proxying over a websocket.  I think in the long term, if
we're going to support all the use cases we want to, we will eventually
need both mechanisms, but for the moment, if we want to get something
that works up quickly, and iterate, we're probably better off just
continuing to make the websocket implementation work reliably.  In my
head (i.e. I haven't backed this up with actual data) I see websocket as
one implementation of a transport layer, with other transport layers
(samba, NFS, ect) that could be supported at a later date.

I suspect the best approach here is to simply add a url handler under
the existing name (/kvmws0) that does the websocket.  When and if
someone goes to build out the Redfish interface for Virtual Media, we
can go implement the redfish specific urls.  If you'd prefer to do it in
the reverse order, that would work as well.

-Ed
