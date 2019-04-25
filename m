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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qtZ02NgQzDqd9
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 09:24:32 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Apr 2019 16:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,395,1549958400"; d="scan'208";a="143685267"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2019 16:24:29 -0700
Subject: Re: bmcweb image upload
To: Wim Vervoorn <wvervoorn@eltan.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <df18326e-d3ff-0725-2960-03aaa606792b@intel.com>
Date: Thu, 25 Apr 2019 16:24:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 25 Apr 2019 23:24:41 -0000

On 4/25/19 2:01 AM, Wim Vervoorn wrote:
> Hello,
> 
> I have an AST2400 OpenBmc with 128 MB of RAM. I found that the firmware upload using WebUI (and Redfish) doesn't work. Bmcweb is killed due to an out of memory condition.
> 
> If found out this is due to the large request size of 30 MB. Will there be an update to the upload mechanism to resolve this large memory requirement?
> 

Running bmcweb on a 128MB ram system has been on my list to try for a
long time.  It's good to know at least some things function.

I don't know of anyone planning on improving the memory usage at this
point.  The systems I support have 512MB of ram, so our systems have
plenty of headroom.  The existing mechanism was definitely a cop-out
from a memory perspective when the implementation was first done;  The
whole payload was buffered in memory before writing to the filesystem,
mostly because of history: Crow didn't have support for incremental
upload or streaming of "normal" HTTP requests or chunk transfer
encoding.  These days the boost::beast internals can support streaming
the payload directly to somewhere, we would just need to expose the
appropriate buffers to bmcweb.

This could definitely be improved.

If I were to go about fixing this, my plan would be:
1. Come up with an amended DBus/filesystem interface that allows
chunking a response directly into flash.  This would probably be a unix
socket, or chunk based dbus interface like venture uses.  As you've
already found, internally the update packages use tarball, so we would
have to stream the decompression of files in the tarball, or use a
different format.
2. Expose a new url registration type in bmcweb that can accept a socket
or buffer object as a parameter.  This is similar to how websocket
upgrade works, just in different conditions when it would get invoked.
3. ??????
4. Profit.
