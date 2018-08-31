Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4228nn1hjQzF387
 for <openbmc@lists.ozlabs.org>; Sat,  1 Sep 2018 05:39:39 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Aug 2018 12:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,313,1531810800"; d="scan'208";a="86194194"
Received: from mauery.jf.intel.com ([10.54.51.74])
 by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2018 12:39:34 -0700
Date: Fri, 31 Aug 2018 12:39:19 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Subject: Re: OEM IPMI EthStats
Message-ID: <20180831193919.GB44886@mauery.jf.intel.com>
References: <CAO=notzR73b_oZjAiH1x+KjL-i_WKpHUp=xEdRfq5H76u0FmSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notzR73b_oZjAiH1x+KjL-i_WKpHUp=xEdRfq5H76u0FmSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2018 19:39:42 -0000

On 30-Aug-2018 02:15 PM, Patrick Venture wrote:
>Out of a desire to export link health information, we implemented an
>OEM IPMI command that lets one grab ethernet statistics from a named
>ethernet device on the BMC.  (The NCSI statistics IPMI commands were a
>bit clunky and didn't do what we needed).
>
>The OEM IPMI commands spec is pretty short on this one:
>
>### Ethernet Statistics Command (0x30) {#ethernet-statistics-command-0x30}

I would say that this command could be useful to the entire OpenBMC 
community, so registering it under the OpenBMC OEM table would be good.

>There is the need to read a specific ethernet-level statistic value
>from the BMC.  This is driven primarily to detect link errors that
>require hardware swaps during manufacturing.
>
>This command will be well structured such that there is a request and
>response which mirror to some extent.
>
>The request will specify the ethernet interface by name, as a
>length-prepended string, and the field they're requesting by
>identifier (an unsigned byte).
>
>If the command is not supported, the IPMI OEM handler will respond
>accordingly, however, if the field is not supported or not recognized,
>the command will return 0xcc (invalid field).
>
>The current ethernet statistics available (all future additions must append):
>
>|Identifier |Human Readable Name
>|-----------|--------------------
>|0          |rx_bytes
>|1          |rx_compressed
>|2          |rx_crc_errors
>|3          |rx_dropped
>|4          |rx_errors
>|5          |rx_fifo_errors
>|6          |rx_frame_errors
>|7          |rx_length_errors
>|8          |rx_missed_errors
>|9          |rx_nohandler
>|10         |rx_over_errors
>|11         |rx_packets
>|12         |tx_aborted_errors
>|13         |tx_bytes
>|14         |tx_carrier_errors
>|15         |tx_compressed
>|16         |tx_dropped
>|17         |tx_errors
>|18         |tx_fifo_errors
>|19         |tx_heartbeat_errors
>|20         |tx_packets
>|21         |tx_window_errors
>
>Request
>
>|Byte(s) |Value |Data
>|--------|------|----
>|0x00    |Statistic ID |The identifier of the desired statistic
>|0x01    |Length       |Where you expect the cable, eth0 or eth1, etc
>|0x02..  |The name     |The string, not null-terminated

Rather than using actual ethernet device names, it might be better to 
use IPMI channel numbers or 0..N-1 for the Nth ethernet device. Other 
than that, the interface looks good to me.

--Vernon

>Response
>
>|Byte(s) |Value  |Data
>|--------|-------|----
>|0x00    |Stat ID|The identifier of the desired statistic
>|0x01....|Uint64 |The value.  Because these are counters we don't
>anticipate negative values, and we don't expect overflow.
