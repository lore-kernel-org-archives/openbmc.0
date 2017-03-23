Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vplpv3XgzzDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 23:14:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vplpv14rqz9s2x;
 Thu, 23 Mar 2017 23:14:31 +1100 (AEDT)
To: openbmc@lists.ozlabs.org,
 Christopher Bostic <christopher.lee.bostic@gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Subject: Upstream work for OpenFSI patches
Message-ID: <05efd2cd-b928-96eb-433e-49ff451eaaf3@ozlabs.org>
Date: Thu, 23 Mar 2017 20:14:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Mar 2017 12:14:31 -0000

Hi Chris & all,

Over the last week or so, I've (re-)started our upstreaming efforts for
the fsi patches, by addressing the reviews we've had so far, and
settling some of the open items we've had that effect the future
userspace ABI of the FSI code.

I think the patches at a point where we're ready to resubmit upstream,
so I've pushed a branch here:

  https://github.com/jk-ozlabs/linux/commits/openbmc/fsi

- this is currently based on the OpenBMC 4.10 tree, but will be easily
applicable to vanilla upstream. I've kept the "DEBUG" patches at the top
of the tree, but these are not intended to be upstreamed (unless someone
convinces us otherwise!). This tree may be rebased as development
continues, and I'll likely start a branch which is based on mainline.

There are some fairly significant changes from our first submission,
notably:

 - endianness: the _read() and _write() APIs are now all *bus endian*,
   so will be the same on all platforms (the previous fsi patches
   exposed as (BMC/FSP) CPU endian, which is variable).

   This includes the sysfs raw file, so the byte ordering matches what's
   transferred on the bus, regardless of CPU endianness:

      # hexdump -n 4 -C fsi0/slave@00:00/raw
      00000000  c0 01 0d 12                        |....|
      00000004

   This will likely mean that drivers and accesses to 'raw' from
   userspace may need to convert to bus endian.

 - device tree: I've removed the "ibm," prefix for the fsi core and GPIO
   master compatibility strings, as they're not describing IBM-specific
   hardware. I've also fixed some errors with our proposed binding
   specification.

 - device model: we now create separate struct devices for each FSI
   master, which fits better with the Linux device model, and allows us
   to add sysfs attributes that are implemented by the fsi core

 - sysfs: there are now sysfs facilities for break and term, and the raw
   file supports reads and writes of arbitrary sizes.

 - GPIO master: I've split the xfer() logic out a little, so that the
   response handling & DPOLL retry mechanism is more obvious

 - GPIO master: simplifications for message construction

 - GPIO master: fixes for some CRC calculations

 - GPIO master: we now issue TERM in response to DPOLL busy-loops

 - Error handling: rather than handle errors on (potentially) an entire
   cascaded read or write, the error handling is now down on a per-slave
   basis, where we try to reestablish communication in a more "gradual"
   manner, rather than sending a break immediately.

   (we may need to add a hook to percolate error recovery up to a
   slave's master, but I haven't seen any need for that at present)

 - Hub master: this is now implemented as a fsi engine driver, as the
   fsi_slave_{read,write}() functions are exported (and the port count
   is available in the hMFSI configuration register)

   This means we need fewer special-cases in the fsi core.

 - Tracepoints: I've added tracepoints for FSI core read & write, and
   another set for low-level GPIO in/out operations.

I've kept the original authorship attribution on each patch, but do let
me know if anything seems amiss.

I've tested on one-core (heavily) and two-core (lightly) p9 platforms,
and all seems to look okay so far.

There are a couple of pending items, but those shouldn't need to hold us
up:

 - IRQ support needs more work, but there doesn't seem to be any
   consumers of that so far
 - tests for unbind/rebind
 - updating MAINTAINERS

So, please take a look at the series and let me know if there is
anything that still needs doing (particularly fixes that have come in
since the first series), and we can work out our plan for upstream
progression.

Cheers,


Jeremy
